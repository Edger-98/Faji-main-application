import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/event_entity.dart';
import '../repositories/event_repository.dart';

class GetUpcomingEventsUseCase {
  final EventRepository repository;
  
  GetUpcomingEventsUseCase(this.repository);
  
  Future<Either<Failure, List<EventEntity>>> call({
    int? limit,
  }) async {
    return await repository.getUpcomingEvents(limit: limit);
  }
}
