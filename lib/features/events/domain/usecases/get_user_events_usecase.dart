import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/repositories/event_repository.dart';

class GetUserEventsUseCase {
  
  GetUserEventsUseCase(this.repository);
  final EventRepository repository;
  
  Future<Either<Failure, List<EventEntity>>> call() async => await repository.getUserEvents();
}
