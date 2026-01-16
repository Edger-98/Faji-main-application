import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/repositories/event_repository.dart';
import '../datasources/event_remote_datasource.dart';
import '../models/event_model.dart';

/// Event repository implementation
class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  EventRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<EventEntity>>> getEvents({
    int? page,
    int? limit,
    String? category,
    String? search,
    DateTime? startDate,
    DateTime? endDate,
    double? minPrice,
    double? maxPrice,
    String? location,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final queries = <String, dynamic>{
        if (page != null) 'page': page,
        if (limit != null) 'limit': limit,
        if (category != null) 'category': category,
        if (search != null) 'search': search,
        if (startDate != null) 'start_date': startDate.toIso8601String(),
        if (endDate != null) 'end_date': endDate.toIso8601String(),
        if (minPrice != null) 'min_price': minPrice,
        if (maxPrice != null) 'max_price': maxPrice,
        if (location != null) 'location': location,
      };

      final response = await remoteDataSource.getEvents(queries);

      if (response.response.statusCode != 200) {
        return Left(ServerFailure(message: 'Failed to load events'));
      }

      final responseData = response.data;
      if (responseData == null) {
        return Left(ServerFailure(message: 'No data received'));
      }

      // Handle the normalized response: {success: true, data: [...]}
      Map<String, dynamic> responseMap;
      if (responseData is Map<String, dynamic>) {
        responseMap = responseData;
      } else if (responseData is Map) {
        responseMap = Map<String, dynamic>.from(responseData);
      } else {
        return Left(ServerFailure(message: 'Invalid response format'));
      }

      // Extract the data field (array of events or object with events array)
      final data = responseMap['data'];
      if (data == null) {
        return Left(ServerFailure(message: 'No events data'));
      }

      // Parse the events array - handle both formats:
      // Format 1: {data: [...]} - direct array
      // Format 2: {data: {events: [...]}} - nested in events field
      List<dynamic> eventsJson;
      if (data is List) {
        // Direct array format
        eventsJson = data;
      } else if (data is Map<String, dynamic> && data.containsKey('events')) {
        // Nested format with events field
        final events = data['events'];
        if (events is List) {
          eventsJson = events;
        } else {
          return Left(ServerFailure(message: 'Invalid events format'));
        }
      } else if (data is Map && (data as Map).containsKey('events')) {
        // Nested format (non-typed map)
        final events = (data as Map)['events'];
        if (events is List) {
          eventsJson = events;
        } else {
          return Left(ServerFailure(message: 'Invalid events format'));
        }
      } else {
        return Left(ServerFailure(message: 'Invalid events data format'));
      }

      // Convert to EventModel list
      final events = eventsJson
          .map((json) {
            try {
              if (json is Map<String, dynamic>) {
                return EventModel.fromJson(json);
              } else if (json is Map) {
                return EventModel.fromJson(Map<String, dynamic>.from(json));
              } else {
                print('❌ getEvents: Invalid event format, skipping: ${json.runtimeType}');
                return null;
              }
            } catch (e, stackTrace) {
              print('❌ getEvents: Error parsing event: $e');
              print('❌ getEvents: Event data: $json');
              return null;
            }
          })
          .whereType<EventModel>() // Filter out nulls
          .map((model) => model.toEntity())
          .toList();

      return Right(events);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getTrendingEvents({
    int? limit,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      // Try to get trending events, but if endpoint doesn't exist, return empty list
      try {
        final response = await remoteDataSource.getTrendingEvents(limit);
        
        if (response.success) {
          final data = response.data ?? [];
          final events = data.map((e) => e.toEntity()).toList();
          return Right(events);
        } else {
          // If not successful, return empty list instead of error
          return const Right([]);
        }
      } on DioException catch (e) {
        // If endpoint doesn't exist (404), return empty list
        if (e.response?.statusCode == 404) {
          return const Right([]);
        }
        rethrow;
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e, stackTrace) {
      // Return empty list instead of error for better UX
      return const Right([]);
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getUpcomingEvents({
    int? limit,
  }) async {
    print('🔍 getUpcomingEvents: Starting request with limit=$limit');
    
    if (!await networkInfo.isConnected) {
      print('❌ getUpcomingEvents: No network connection');
      return Left(NetworkFailure.noConnection());
    }

    try {
      // Try to get upcoming events, but if endpoint doesn't exist, return empty list
      try {
        print('📡 getUpcomingEvents: Calling API endpoint /events/upcoming');
        final response = await remoteDataSource.getUpcomingEvents(limit);
        
        print('✅ getUpcomingEvents: Response received - success: ${response.success}');
        
        if (response.success) {
          final data = response.data ?? [];
          print('📊 getUpcomingEvents: Received ${data.length} events');
          final events = data.map((e) => e.toEntity()).toList();
          return Right(events);
        } else {
          print('⚠️ getUpcomingEvents: Response not successful - ${response.message}');
          // If not successful, return empty list instead of error
          return const Right([]);
        }
      } on DioException catch (e) {
        print('❌ getUpcomingEvents: DioException - ${e.type}, status: ${e.response?.statusCode}');
        print('❌ getUpcomingEvents: Error message: ${e.message}');
        print('❌ getUpcomingEvents: Response data: ${e.response?.data}');
        
        // If endpoint doesn't exist (404), return empty list
        if (e.response?.statusCode == 404) {
          print('⚠️ getUpcomingEvents: Endpoint not found (404), returning empty list');
          return const Right([]);
        }
        rethrow;
      }
    } on DioException catch (e) {
      print('❌ getUpcomingEvents: Outer DioException caught');
      return Left(_handleDioError(e));
    } catch (e, stackTrace) {
      print('❌ getUpcomingEvents: Unexpected error: $e');
      print('❌ getUpcomingEvents: Stack trace: $stackTrace');
      // Return empty list instead of error for better UX
      return const Right([]);
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getFlashDealEvents({
    int? limit,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getFlashDealEvents(limit);
      
      if (response.success) {
        final data = response.data ?? [];
        final events = data.map((e) => e.toEntity()).toList();
        return Right(events);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventEntity>> getEventById(String id) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getEventById(id);
      
      if (response.response.statusCode != 200) {
        return Left(ServerFailure(message: 'Failed to load event'));
      }
      
      // Extract the response data
      final responseData = response.data;
      
      if (responseData == null) {
        return Left(ServerFailure(message: 'No data received'));
      }
      
      // The normalizer wraps the response as: {success: true, message: "Success", data: {...}}
      // Handle both wrapped and unwrapped responses
      Map<String, dynamic> responseMap;
      
      if (responseData is Map<String, dynamic>) {
        responseMap = responseData;
      } else if (responseData is Map) {
        responseMap = Map<String, dynamic>.from(responseData);
      } else {
        print('❌ getEventById: Invalid response type: ${responseData.runtimeType}');
        return Left(ServerFailure(message: 'Invalid response format'));
      }
      
      // Check if response is wrapped (has 'data' field)
      final bool isWrapped = responseMap.containsKey('data');
      
      Map<String, dynamic> eventJson;
      
      if (isWrapped) {
        // Response is wrapped: {success: true/false, data: {...event...}}
        // Note: success might be false but data can still be present
        final data = responseMap['data'];
        
        if (data == null) {
          final message = responseMap['message'] as String? ?? 'Failed to load event';
          return Left(ServerFailure(message: message));
        }
        
        // Extract event data
        if (data is Map<String, dynamic>) {
          eventJson = data;
        } else if (data is Map) {
          eventJson = Map<String, dynamic>.from(data);
        } else {
          print('❌ getEventById: Invalid data type: ${data.runtimeType}');
          print('❌ getEventById: Data content: $data');
          return Left(ServerFailure(message: 'Invalid event data format'));
        }
      } else {
        // Response is not wrapped, it's the event object directly
        eventJson = responseMap;
      }
      
      // Parse the event using EventModel which handles Mongoose data
      try {
        final event = EventModel.fromJson(eventJson);
        return Right(event.toEntity());
      } catch (e, stackTrace) {
        print('❌ getEventById: Error parsing event: $e');
        print('❌ getEventById: Stack trace: $stackTrace');
        print('❌ getEventById: Event JSON keys: ${eventJson.keys.toList()}');
        return Left(ServerFailure(message: 'Error parsing event: ${e.toString()}'));
      }
      
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e, stackTrace) {
      print('❌ getEventById: Unexpected error: $e');
      print('❌ getEventById: Stack trace: $stackTrace');
      return Left(ServerFailure(message: 'Error loading event: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getUserEvents() async {
    print('🔍 getUserEvents: Starting request');
    
    if (!await networkInfo.isConnected) {
      print('❌ getUserEvents: No network connection');
      return Left(NetworkFailure.noConnection());
    }

    try {
      print('📡 getUserEvents: Calling API endpoint /events/my-events');
      final response = await remoteDataSource.getUserEvents();
      
      print('✅ getUserEvents: Response received - status: ${response.response.statusCode}');
      
      if (response.response.statusCode != 200) {
        print('❌ getUserEvents: Non-200 status code');
        return Left(ServerFailure(message: 'Failed to load events'));
      }

      final responseData = response.data;
      if (responseData == null) {
        print('❌ getUserEvents: No data received');
        return Left(ServerFailure(message: 'No data received'));
      }

      print('📊 getUserEvents: Response data type: ${responseData.runtimeType}');

      // Handle the response: {success: true, data: {events: [...], pagination: {...}}}
      Map<String, dynamic> responseMap;
      if (responseData is Map<String, dynamic>) {
        responseMap = responseData;
      } else if (responseData is Map) {
        responseMap = Map<String, dynamic>.from(responseData);
      } else {
        print('❌ getUserEvents: Invalid response format - ${responseData.runtimeType}');
        return Left(ServerFailure(message: 'Invalid response format'));
      }

      print('📊 getUserEvents: Response keys: ${responseMap.keys.toList()}');

      // Extract the data field
      final data = responseMap['data'];
      if (data == null) {
        print('❌ getUserEvents: No events data in response');
        return Left(ServerFailure(message: 'No events data'));
      }

      print('📊 getUserEvents: Data type: ${data.runtimeType}');

      // Extract events array from data.events
      List<dynamic> eventsJson;
      if (data is Map<String, dynamic> && data.containsKey('events')) {
        final events = data['events'];
        print('📊 getUserEvents: Found events field, type: ${events.runtimeType}');
        if (events is List) {
          eventsJson = events;
        } else {
          print('❌ getUserEvents: Events field is not a list');
          return Left(ServerFailure(message: 'Invalid events format'));
        }
      } else if (data is List) {
        // Fallback: if data is directly an array
        print('📊 getUserEvents: Data is directly a list');
        eventsJson = data;
      } else {
        print('❌ getUserEvents: Invalid data structure - ${data.runtimeType}');
        return Left(ServerFailure(message: 'Invalid data structure'));
      }

      print('📊 getUserEvents: Processing ${eventsJson.length} events');

      // Convert to EventEntity list
      // The /events/my-events endpoint returns organized events with different structure
      final events = eventsJson
          .map((json) {
            try {
              if (json is Map<String, dynamic>) {
                // Convert organize_event format to EventEntity
                return _convertOrganizedEventToEntity(json);
              } else if (json is Map) {
                return _convertOrganizedEventToEntity(Map<String, dynamic>.from(json));
              } else {
                print('❌ getUserEvents: Invalid event format, skipping: ${json.runtimeType}');
                return null;
              }
            } catch (e, stackTrace) {
              print('❌ getUserEvents: Error parsing event: $e');
              print('❌ getUserEvents: Stack trace: $stackTrace');
              print('❌ getUserEvents: Event JSON keys: ${json is Map ? (json as Map).keys.toList() : 'not a map'}');
              return null;
            }
          })
          .whereType<EventEntity>() // Filter out nulls
          .toList();

      print('✅ getUserEvents: Successfully parsed ${events.length} events');
      return Right(events);
    } on DioException catch (e) {
      print('❌ getUserEvents: DioException - ${e.type}, status: ${e.response?.statusCode}');
      print('❌ getUserEvents: Error message: ${e.message}');
      print('❌ getUserEvents: Response data: ${e.response?.data}');
      return Left(_handleDioError(e));
    } catch (e, stackTrace) {
      print('❌ getUserEvents: Unexpected error: $e');
      print('❌ getUserEvents: Stack trace: $stackTrace');
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  /// Helper to safely parse dates that might be objects or strings
  DateTime? _parseDateSafely(dynamic dateValue) {
    if (dateValue == null) return null;
    
    try {
      // If it's already a DateTime
      if (dateValue is DateTime) return dateValue;
      
      // If it's a string
      if (dateValue is String) {
        if (dateValue.isEmpty) return null;
        return DateTime.parse(dateValue);
      }
      
      // If it's a Map (Mongoose date object), try to extract the value
      if (dateValue is Map) {
        // Check for common date object patterns
        if (dateValue.containsKey('\$date')) {
          return DateTime.parse(dateValue['\$date'].toString());
        }
        // If it's an empty object, return null
        if (dateValue.isEmpty) return null;
        // Try to convert to string and parse
        return DateTime.parse(dateValue.toString());
      }
      
      // Try to convert to string and parse
      return DateTime.parse(dateValue.toString());
    } catch (e) {
      print('⚠️ Failed to parse date: $dateValue (${dateValue.runtimeType})');
      return null;
    }
  }
  
  /// Helper to safely extract string ID from various formats
  String _extractIdSafely(dynamic idValue) {
    if (idValue == null) return '';
    
    try {
      // If it's already a string
      if (idValue is String) return idValue;
      
      // If it's a Map (Mongoose ObjectId with buffer)
      if (idValue is Map) {
        // Check for _id field
        if (idValue.containsKey('_id')) {
          return idValue['_id'].toString();
        }
        // Check for id field
        if (idValue.containsKey('id')) {
          return idValue['id'].toString();
        }
        // If it has a buffer, it's likely a Mongoose ObjectId - skip it
        if (idValue.containsKey('buffer')) {
          return '';
        }
      }
      
      // Try to convert to string
      return idValue.toString();
    } catch (e) {
      print('⚠️ Failed to extract ID: $idValue (${idValue.runtimeType})');
      return '';
    }
  }
  
  // Helper method to convert organized event format to EventEntity
  EventEntity _convertOrganizedEventToEntity(Map<String, dynamic> json) {
    final host = json['host'] as Map<String, dynamic>?;
    final location = json['location'] as Map<String, dynamic>?;
    final media = json['media'] as Map<String, dynamic>?;
    
    // Get imageUrl - check direct field first, then media.poster, then fallback
    String imageUrl = '';
    if (json['imageUrl'] != null && (json['imageUrl'] as String).isNotEmpty) {
      // NEW: Direct imageUrl field (Cloudinary URL)
      imageUrl = json['imageUrl'] as String;
    } else if (media?['poster'] != null && (media!['poster'] as String).isNotEmpty) {
      // Fallback: Old poster field
      imageUrl = media['poster'] as String;
    }
    
    // Parse stats - handle Mongoose document objects
    int totalTickets = 0;
    int availableTickets = 0;
    
    if (json['stats'] is Map) {
      var statsMap = json['stats'] as Map<String, dynamic>;
      
      // If stats contains Mongoose internal data, extract the actual document
      if (statsMap.containsKey('_doc')) {
        statsMap = statsMap['_doc'] as Map<String, dynamic>;
      }
      
      totalTickets = (statsMap['expectedGuests'] as num?)?.toInt() ?? 0;
      availableTickets = totalTickets - ((statsMap['confirmedGuests'] as num?)?.toInt() ?? 0);
    }
    
    return EventEntity(
      id: json['id'] as String,
      title: json['name'] as String,
      description: json['description'] as String? ?? '',
      hostId: _extractIdSafely(host?['id']),
      hostName: host?['name'] as String? ?? 'Unknown',
      hostImage: host?['avatar'] as String?,
      category: json['category'] as String? ?? 'Other',
      startDate: _parseDateSafely(json['startDate']) ?? DateTime.now(),
      endDate: _parseDateSafely(json['endDate']) ?? DateTime.now().add(const Duration(hours: 2)),
      location: location?['address'] as String? ?? '',
      latitude: (location?['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (location?['longitude'] as num?)?.toDouble() ?? 0.0,
      imageUrl: imageUrl,
      price: 0.0, // Organized events don't have price
      totalTickets: totalTickets,
      availableTickets: availableTickets,
      isTrending: false,
      isFeatured: false,
      createdAt: _parseDateSafely(json['createdAt']),
      updatedAt: _parseDateSafely(json['updatedAt']),
    );
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getFavoriteEvents() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getFavoriteEvents();
      
      if (response.success) {
        final data = response.data ?? [];
        final events = data.map((e) => e.toEntity()).toList();
        return Right(events);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addToFavorites(String eventId) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.addToFavorites(eventId);
      
      if (response.success) {
        return Right(response.data ?? true);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFromFavorites(String eventId) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.removeFromFavorites(eventId);
      
      if (response.success) {
        return Right(response.data ?? true);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> searchEvents(String query) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.searchEvents(query);
      
      if (response.success) {
        final data = response.data ?? [];
        final events = data.map((e) => e.toEntity()).toList();
        return Right(events);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure.timeout();
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 500;
        
        // Handle 401 with custom message for event operations
        if (statusCode == 401) {
          final message = error.response?.data?['message'] as String? ??
              error.response?.data?['error'] as String? ??
              'Authentication failed';
          
          final customMessage = message.toLowerCase().contains('event') || 
                               message.toLowerCase().contains('access') ||
                               message.toLowerCase().contains('permission')
              ? "You're not authorized to perform this action on this event"
              : message;
          
          return AuthFailure(message: customMessage);
        }
        
        return ServerFailure.fromStatusCode(statusCode);
      case DioExceptionType.cancel:
        return const NetworkFailure(message: 'Request cancelled');
      default:
        return NetworkFailure.connectionError();
    }
  }
}
