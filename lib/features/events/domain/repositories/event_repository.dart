import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/entities/category_entity.dart';

/// Event repository interface - domain layer
abstract class EventRepository {
  /// Get all categories
  Future<Either<Failure, List<CategoryEntity>>> getCategories();

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
    String? category,
  });

  /// Get upcoming events
  Future<Either<Failure, List<EventEntity>>> getUpcomingEvents({
    int? limit,
    String? category,
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

  /// Search events with filters
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
  });

  /// Create event with category
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
  });
}
