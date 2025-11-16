import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/event_entity.dart';

/// Event repository interface - domain layer
abstract class EventRepository {
  /// Get all events with optional filters
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
  });

  /// Get trending events
  Future<Either<Failure, List<EventEntity>>> getTrendingEvents({
    int? limit,
  });

  /// Get upcoming events
  Future<Either<Failure, List<EventEntity>>> getUpcomingEvents({
    int? limit,
  });

  /// Get flash deal events
  Future<Either<Failure, List<EventEntity>>> getFlashDealEvents({
    int? limit,
  });

  /// Get event by ID
  Future<Either<Failure, EventEntity>> getEventById(String id);

  /// Get user's events (attended/purchased)
  Future<Either<Failure, List<EventEntity>>> getUserEvents();

  /// Get favorite events
  Future<Either<Failure, List<EventEntity>>> getFavoriteEvents();

  /// Add event to favorites
  Future<Either<Failure, bool>> addToFavorites(String eventId);

  /// Remove event from favorites
  Future<Either<Failure, bool>> removeFromFavorites(String eventId);

  /// Search events
  Future<Either<Failure, List<EventEntity>>> searchEvents(String query);
}
