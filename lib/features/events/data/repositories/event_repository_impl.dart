import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/core/network/network_info.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/entities/category_entity.dart';
import 'package:fajimobileapp/features/events/domain/repositories/event_repository.dart';
import 'package:fajimobileapp/features/events/data/datasources/event_remote_datasource.dart';
import 'package:fajimobileapp/features/events/data/models/event_model.dart';
import 'package:retrofit/dio.dart';

/// Event repository implementation
class EventRepositoryImpl implements EventRepository {

  EventRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.dio,
  });
  final EventRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final Dio dio;

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        print('📡 getCategories: Calling API endpoint /categories');
        
        // Make a raw API call since the response format doesn't match our model
        final response = await dio.get<Map<String, dynamic>>('/categories');
        
        if (response.statusCode == 200 && response.data != null) {
          final data = response.data!;
          print('📊 getCategories: Response data: $data');
          
          // Extract categories array from nested structure
          final categoriesData = data['data'] as Map<String, dynamic>?;
          final categoriesList = categoriesData?['categories'] as List<dynamic>?;
          
          if (categoriesList != null) {
            // Map of category names to emojis
            final categoryIcons = {
              'Birthday': '🎂',
              'Wedding': '💒',
              'Conference': '🎤',
              'Concert': '🎵',
              'Workshop': '🛠️',
              'Seminar': '📚',
              'Party': '🎉',
              'After Party': '🎊',
              'Corporate Event': '💼',
              'Networking': '🤝',
              'Festival': '🎪',
              'Exhibition': '🖼️',
              'Sports': '⚽',
              'Charity': '❤️',
              'Graduation': '🎓',
              'Anniversary': '💝',
              'Baby Shower': '👶',
              'Bridal Shower': '👰',
              'Reunion': '👥',
              'Meetup': '☕',
              'Launch Event': '🚀',
              'Gala': '🎭',
              'Music': '🎸',
              'Art': '🎨',
              'Food': '🍽️',
              'Other': '📌',
            };
            
            // Convert string array to CategoryEntity objects
            final categories = categoriesList.map((category) {
              final name = category.toString();
              return CategoryEntity(
                id: name.toLowerCase().replaceAll(' ', '-'),
                name: name,
                icon: categoryIcons[name] ?? '📌',
                isActive: true,
              );
            }).toList();
            
            print('✅ getCategories: Found ${categories.length} categories');
            return Right(categories);
          } else {
            print('❌ getCategories: Categories list not found in response');
            return const Left(ServerFailure(message: 'Invalid response format'));
          }
        } else {
          print('❌ getCategories: API returned error status');
          return const Left(ServerFailure(message: 'Failed to fetch categories'));
        }
      } catch (e, stackTrace) {
        print('❌ getCategories: Exception - $e');
        print('Stack trace: $stackTrace');
        return Left(ServerFailure(message: 'Failed to fetch categories: $e'));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

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
      final Map<String, dynamic> queries = <String, dynamic>{
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

      print('🔍 getEvents: Query parameters: $queries');

      final HttpResponse response = await remoteDataSource.getEvents(queries);

      if (response.response.statusCode != 200) {
        return const Left(ServerFailure(message: 'Failed to load events'));
      }

      final responseData = response.data;
      if (responseData == null) {
        return const Left(ServerFailure(message: 'No data received'));
      }

      // Handle the normalized response: {success: true, data: [...]}
      Map<String, dynamic> responseMap;
      if (responseData is Map<String, dynamic>) {
        responseMap = responseData;
      } else if (responseData is Map) {
        responseMap = Map<String, dynamic>.from(responseData);
      } else {
        return const Left(ServerFailure(message: 'Invalid response format'));
      }

      // Extract the data field (array of events or object with events array)
      final data = responseMap['data'];
      if (data == null) {
        return const Left(ServerFailure(message: 'No events data'));
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
          return const Left(ServerFailure(message: 'Invalid events format'));
        }
      } else if (data is Map && (data).containsKey('events')) {
        // Nested format (non-typed map)
        final events = (data)['events'];
        if (events is List) {
          eventsJson = events;
        } else {
          return const Left(ServerFailure(message: 'Invalid events format'));
        }
      } else {
        return const Left(ServerFailure(message: 'Invalid events data format'));
      }

      // Convert to EventModel list
      final List<EventEntity> events = eventsJson
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
            } catch (e) {
              print('❌ getEvents: Error parsing event: $e');
              print('❌ getEvents: Event data: $json');
              return null;
            }
          })
          .whereType<EventModel>() // Filter out nulls
          .map((EventModel model) => model.toEntity())
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
    String? category,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      // Try to get trending events, but if endpoint doesn't exist, return empty list
      try {
        final ApiResponse<List<EventModel>> response = await remoteDataSource.getTrendingEvents(limit, category);
        
        if (response.success) {
          final List<EventModel> data = response.data ?? <EventModel>[];
          final List<EventEntity> events = data.map((EventModel e) => e.toEntity()).toList();
          
          // Backend handles filtering, just return the results
          print('✅ getTrendingEvents: Received ${events.length} events for category: ${category ?? "all"}');
          
          return Right(events);
        } else {
          // If not successful, return empty list instead of error
          return const Right(<EventEntity>[]);
        }
      } on DioException catch (e) {
        // If endpoint doesn't exist (404), return empty list
        if (e.response?.statusCode == 404) {
          return const Right(<EventEntity>[]);
        }
        rethrow;
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      // Return empty list instead of error for better UX
      return const Right(<EventEntity>[]);
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getUpcomingEvents({
    int? limit,
    String? category,
  }) async {
    print('🔍 getUpcomingEvents: Starting request with limit=$limit, category=$category');
    
    if (!await networkInfo.isConnected) {
      print('❌ getUpcomingEvents: No network connection');
      return Left(NetworkFailure.noConnection());
    }

    try {
      // Try to get upcoming events, but if endpoint doesn't exist, return empty list
      try {
        print('📡 getUpcomingEvents: Calling API endpoint /events/upcoming');
        final ApiResponse<List<EventModel>> response = await remoteDataSource.getUpcomingEvents(limit, category);
        
        print('✅ getUpcomingEvents: Response received - success: ${response.success}');
        
        if (response.success) {
          final List<EventModel> data = response.data ?? <EventModel>[];
          print('📊 getUpcomingEvents: Received ${data.length} events');
          final List<EventEntity> events = data.map((EventModel e) => e.toEntity()).toList();
          
          // Backend handles filtering, just return the results
          print('✅ getUpcomingEvents: Returning ${events.length} events for category: ${category ?? "all"}');
          
          return Right(events);
        } else {
          print('⚠️ getUpcomingEvents: Response not successful - ${response.message}');
          // If not successful, return empty list instead of error
          return const Right(<EventEntity>[]);
        }
      } on DioException catch (e) {
        print('❌ getUpcomingEvents: DioException - ${e.type}, status: ${e.response?.statusCode}');
        print('❌ getUpcomingEvents: Error message: ${e.message}');
        print('❌ getUpcomingEvents: Response data: ${e.response?.data}');
        
        // If endpoint doesn't exist (404), return empty list
        if (e.response?.statusCode == 404) {
          print('⚠️ getUpcomingEvents: Endpoint not found (404), returning empty list');
          return const Right(<EventEntity>[]);
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
      return const Right(<EventEntity>[]);
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
      final ApiResponse<List<EventModel>> response = await remoteDataSource.getFlashDealEvents(limit);
      
      if (response.success) {
        final List<EventModel> data = response.data ?? <EventModel>[];
        final List<EventEntity> events = data.map((EventModel e) => e.toEntity()).toList();
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
      final HttpResponse response = await remoteDataSource.getEventById(id);
      
      if (response.response.statusCode != 200) {
        return const Left(ServerFailure(message: 'Failed to load event'));
      }
      
      // Extract the response data
      final responseData = response.data;
      
      if (responseData == null) {
        return const Left(ServerFailure(message: 'No data received'));
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
        return const Left(ServerFailure(message: 'Invalid response format'));
      }
      
      // Check if response is wrapped (has 'data' field)
      final isWrapped = responseMap.containsKey('data');
      
      Map<String, dynamic> eventJson;
      
      if (isWrapped) {
        // Response is wrapped: {success: true/false, data: {...event...}}
        // Note: success might be false but data can still be present
        final data = responseMap['data'];
        
        if (data == null) {
          final String message = responseMap['message'] as String? ?? 'Failed to load event';
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
          return const Left(ServerFailure(message: 'Invalid event data format'));
        }
      } else {
        // Response is not wrapped, it's the event object directly
        eventJson = responseMap;
      }
      
      // Parse the event using EventModel which handles Mongoose data
      try {
        final EventModel event = EventModel.fromJson(eventJson);
        return Right(event.toEntity());
      } catch (e, stackTrace) {
        print('❌ getEventById: Error parsing event: $e');
        print('❌ getEventById: Stack trace: $stackTrace');
        print('❌ getEventById: Event JSON keys: ${eventJson.keys.toList()}');
        return Left(ServerFailure(message: 'Error parsing event: ${e}'));
      }
      
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e, stackTrace) {
      print('❌ getEventById: Unexpected error: $e');
      print('❌ getEventById: Stack trace: $stackTrace');
      return Left(ServerFailure(message: 'Error loading event: ${e}'));
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
      final HttpResponse response = await remoteDataSource.getUserEvents();
      
      print('✅ getUserEvents: Response received - status: ${response.response.statusCode}');
      
      if (response.response.statusCode != 200) {
        print('❌ getUserEvents: Non-200 status code');
        return const Left(ServerFailure(message: 'Failed to load events'));
      }

      final responseData = response.data;
      if (responseData == null) {
        print('❌ getUserEvents: No data received');
        return const Left(ServerFailure(message: 'No data received'));
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
        return const Left(ServerFailure(message: 'Invalid response format'));
      }

      print('📊 getUserEvents: Response keys: ${responseMap.keys.toList()}');

      // Extract the data field
      final data = responseMap['data'];
      if (data == null) {
        print('❌ getUserEvents: No events data in response');
        return const Left(ServerFailure(message: 'No events data'));
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
          return const Left(ServerFailure(message: 'Invalid events format'));
        }
      } else if (data is List) {
        // Fallback: if data is directly an array
        print('📊 getUserEvents: Data is directly a list');
        eventsJson = data;
      } else {
        print('❌ getUserEvents: Invalid data structure - ${data.runtimeType}');
        return const Left(ServerFailure(message: 'Invalid data structure'));
      }

      print('📊 getUserEvents: Processing ${eventsJson.length} events');

      // Convert to EventEntity list
      // The /events/my-events endpoint returns organized events with different structure
      final List<EventEntity> events = eventsJson
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
              print('❌ getUserEvents: Event JSON keys: ${json is Map ? (json).keys.toList() : 'not a map'}');
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
  DateTime? _parseDateSafely(dateValue) {
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
        if (dateValue.containsKey(r'$date')) {
          return DateTime.parse(dateValue[r'$date'].toString());
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
  String _extractIdSafely(idValue) {
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
    final Map<String, dynamic>? host = json['host'] as Map<String, dynamic>?;
    final Map<String, dynamic>? location = json['location'] as Map<String, dynamic>?;
    final Map<String, dynamic>? media = json['media'] as Map<String, dynamic>?;
    
    // Get imageUrl - check direct field first, then media.poster, then fallback
    var imageUrl = '';
    if (json['imageUrl'] != null && (json['imageUrl'] as String).isNotEmpty) {
      // NEW: Direct imageUrl field (Cloudinary URL)
      imageUrl = json['imageUrl'] as String;
    } else if (media?['poster'] != null && (media!['poster'] as String).isNotEmpty) {
      // Fallback: Old poster field
      imageUrl = media['poster'] as String;
    }
    
    // Parse stats - handle Mongoose document objects
    var totalTickets = 0;
    var availableTickets = 0;
    
    if (json['stats'] is Map) {
      Map<String, dynamic> statsMap = json['stats'] as Map<String, dynamic>;
      
      // If stats contains Mongoose internal data, extract the actual document
      if (statsMap.containsKey('_doc')) {
        statsMap = statsMap['_doc'] as Map<String, dynamic>;
      }
      
      totalTickets = (statsMap['expectedGuests'] as num?)?.toInt() ?? 0;
      availableTickets = totalTickets - ((statsMap['confirmedGuests'] as num?)?.toInt() ?? 0);
    }
    
    // Parse dates - if dates are empty objects, use status field to determine dates
    final String? status = json['status'] as String?;
    DateTime startDate;
    DateTime endDate;
    
    final parsedStartDate = _parseDateSafely(json['startDate']);
    final parsedEndDate = _parseDateSafely(json['endDate']);
    
    if (parsedStartDate != null && parsedEndDate != null) {
      // Dates are valid, use them
      startDate = parsedStartDate;
      endDate = parsedEndDate;
    } else {
      // Dates are missing/empty - use status to determine appropriate dates
      if (status == 'past') {
        // Past event - set dates in the past
        startDate = DateTime.now().subtract(const Duration(days: 30));
        endDate = DateTime.now().subtract(const Duration(days: 30, hours: 2));
      } else if (status == 'cancelled') {
        // Cancelled event - set dates in the future but mark as cancelled
        startDate = DateTime.now().add(const Duration(days: 30));
        endDate = DateTime.now().add(const Duration(days: 30, hours: 2));
      } else {
        // Upcoming or unknown status - set dates in the future
        startDate = DateTime.now().add(const Duration(days: 30));
        endDate = DateTime.now().add(const Duration(days: 30, hours: 2));
      }
    }
    
    return EventEntity(
      id: json['id'] as String,
      title: json['name'] as String,
      description: json['description'] as String? ?? '',
      hostId: _extractIdSafely(host?['id']),
      hostName: host?['name'] as String? ?? 'Unknown',
      hostImage: host?['avatar'] as String?,
      category: json['category'] as String? ?? 'Other',
      startDate: startDate,
      endDate: endDate,
      location: location?['address'] as String? ?? '',
      latitude: (location?['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (location?['longitude'] as num?)?.toDouble() ?? 0.0,
      imageUrl: imageUrl,
      price: 0, // Organized events don't have price
      totalTickets: totalTickets,
      availableTickets: availableTickets,
      isTrending: false,
      isFeatured: false,
      isCancelled: status == 'cancelled',
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
      final HttpResponse response = await remoteDataSource.getFavoriteEvents();
      
      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        
        // Handle both wrapped and direct responses
        final List data = responseData['data'] as List<dynamic>? ?? <dynamic>[];
        
        final List<EventEntity> events = data.map((eventJson) => EventModel.fromJson(eventJson as Map<String, dynamic>)).map((EventModel model) => model.toEntity()).toList();
        
        return Right(events);
      } else {
        return const Left(ServerFailure(message: 'Failed to get favorite events'));
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
      final HttpResponse response = await remoteDataSource.addToFavorites(eventId);
      
      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        final bool success = responseData['success'] as bool? ?? false;
        
        if (success) {
          return const Right(true);
        } else {
          return Left(ServerFailure(message: responseData['message']?.toString() ?? 'Failed to add to favorites'));
        }
      } else {
        return const Left(ServerFailure(message: 'Failed to add to favorites'));
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
      final HttpResponse response = await remoteDataSource.removeFromFavorites(eventId);
      
      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        final bool success = responseData['success'] as bool? ?? false;
        
        if (success) {
          return const Right(true);
        } else {
          return Left(ServerFailure(message: responseData['message']?.toString() ?? 'Failed to remove from favorites'));
        }
      } else {
        return const Left(ServerFailure(message: 'Failed to remove from favorites'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> searchEvents({
    required String query,
    String? category,
    String? location,
    double? latitude,
    double? longitude,
    double? radius,
    double? minPrice,
    double? maxPrice,
    int? page,
    int? limit,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final Map<String, dynamic> queries = <String, dynamic>{
        'q': query,
        if (category != null) 'category': category,
        if (location != null) 'location': location,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (radius != null) 'radius': radius,
        if (minPrice != null) 'minPrice': minPrice,
        if (maxPrice != null) 'maxPrice': maxPrice,
        if (page != null) 'page': page,
        if (limit != null) 'limit': limit,
      };

      final HttpResponse response = await remoteDataSource.searchEvents(queries);
      
      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        
        // Handle both wrapped and direct responses
        final List data = responseData['data'] as List<dynamic>? ?? 
                    responseData['events'] as List<dynamic>? ?? 
                    <dynamic>[];
        
        final List<EventEntity> events = data.map((eventJson) => EventModel.fromJson(eventJson as Map<String, dynamic>)).map((EventModel model) => model.toEntity()).toList();
        
        return Right(events);
      } else {
        return const Left(ServerFailure(message: 'Search failed'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventEntity>> createEvent({
    required String title,
    required String description,
    required String category,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    String? imageUrl,
    double? price,
    int? totalTickets,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        print('📡 createEvent: Calling API endpoint /events');
        
        final Map<String, Object> eventData = <String, Object>{
          'title': title,
          'description': description,
          'category': category,
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
          'location': location,
          if (imageUrl != null) 'imageUrl': imageUrl,
          if (price != null) 'price': price,
          if (totalTickets != null) 'totalTickets': totalTickets,
        };
        
        final HttpResponse response = await remoteDataSource.createEvent(eventData);
        
        if (response.response.statusCode == 200 || response.response.statusCode == 201) {
          final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
          final eventJson = responseData['data'] ?? responseData;
          final EventModel eventModel = EventModel.fromJson(eventJson as Map<String, dynamic>);
          
          print('✅ createEvent: Event created successfully');
          return Right(eventModel.toEntity());
        } else {
          print('❌ createEvent: Failed with status ${response.response.statusCode}');
          return const Left(ServerFailure(message: 'Failed to create event'));
        }
      } catch (e) {
        print('❌ createEvent: Exception - $e');
        return Left(ServerFailure(message: 'Failed to create event: ${e}'));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure.timeout();
      case DioExceptionType.badResponse:
        final int statusCode = error.response?.statusCode ?? 500;
        
        // Handle 401 with custom message for event operations
        if (statusCode == 401) {
          final String message = error.response?.data?['message'] as String? ??
              error.response?.data?['error'] as String? ??
              'Authentication failed';
          
          final String customMessage = message.toLowerCase().contains('event') || 
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
