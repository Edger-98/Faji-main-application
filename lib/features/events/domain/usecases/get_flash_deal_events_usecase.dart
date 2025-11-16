import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/event_entity.dart';
import '../repositories/event_repository.dart';

class GetFlashDealEventsUseCase {
  final EventRepository repository;
  
  GetFlashDealEventsUseCase(this.repository);
  
  Future<Either<Failure, List<EventEntity>>> call({
    int? limit,
  }) async {
    return await repository.getFlashDealEvents(limit: limit);
  }
}
