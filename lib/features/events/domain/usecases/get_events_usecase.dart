import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/event_entity.dart';
import '../repositories/event_repository.dart';

class GetEventsUseCase {
  final EventRepository repository;
  
  GetEventsUseCase(this.repository);
  
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
  }) async {
    return await repository.getEvents(
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
}
