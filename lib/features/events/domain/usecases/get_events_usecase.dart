import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/repositories/event_repository.dart';

class GetEventsUseCase {
  
  GetEventsUseCase(this.repository);
  final EventRepository repository;
  
  Future<Either<Failure, List<EventEntity>>> call({
    int? page,
    int? limit,
    String? category,
    String? search,
    DateTime? startDate,
    DateTime? endDate,
    double? minPrice,
    double? maxPrice,
    String? location,
  }) async => await repository.getEvents(
      page: page,
      limit: limit,
      category: category,
      search: search,
      startDate: startDate,
      endDate: endDate,
      minPrice: minPrice,
      maxPrice: maxPrice,
      location: location,
    );
}
