import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/repositories/event_repository.dart';

class SearchEventsUseCase {
  
  SearchEventsUseCase(this.repository);
  final EventRepository repository;
  
  Future<Either<Failure, List<EventEntity>>> call({
    required String query,
    String? category,
    String? location,
    double? minPrice,
    double? maxPrice,
    int? page,
    int? limit,
  }) async => await repository.searchEvents(
      query: query,
      category: category,
      location: location,
      minPrice: minPrice,
      maxPrice: maxPrice,
      page: page,
      limit: limit,
    );
}
