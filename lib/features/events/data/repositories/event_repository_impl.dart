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

      // Extract the data field (array of events)
      final data = responseMap['data'];
      if (data == null) {
        return Left(ServerFailure(message: 'No events data'));
      }

      // Parse the events array
      List<dynamic> eventsJson;
      if (data is List) {
        eventsJson = data;
      } else {
        return Left(ServerFailure(message: 'Invalid events data format'));
      }

      // Convert to EventModel list
      final events = eventsJson
          .map((json) {
            if (json is Map<String, dynamic>) {
              return EventModel.fromJson(json);
            } else if (json is Map) {
              return EventModel.fromJson(Map<String, dynamic>.from(json));
            } else {
              throw Exception('Invalid event format');
            }
          })
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
      final response = await remoteDataSource.getTrendingEvents(limit);
      
      if (response.success) {
        final data = response.data ?? [];
        final events = data.map((e) => e.toEntity()).toList();
        return Right(events);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e, stackTrace) {
      return Left(ServerFailure(message: 'Error loading events: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getUpcomingEvents({
    int? limit,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getUpcomingEvents(limit);
      
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
          return Left(ServerFailure(message: 'Invalid event data format'));
        }
      } else {
        // Response is not wrapped, it's the event object directly
        eventJson = responseMap;
      }
      
      // Parse the event
      final event = EventModel.fromJson(eventJson);
      return Right(event.toEntity());
      
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e, stackTrace) {
      return Left(ServerFailure(message: 'Error loading event: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<EventEntity>>> getUserEvents() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getUserEvents();
      
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
        return ServerFailure.fromStatusCode(error.response?.statusCode ?? 500);
      case DioExceptionType.cancel:
        return const NetworkFailure(message: 'Request cancelled');
      default:
        return NetworkFailure.connectionError();
    }
  }
}
