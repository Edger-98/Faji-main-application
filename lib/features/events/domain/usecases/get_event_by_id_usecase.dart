import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/repositories/event_repository.dart';

class GetEventByIdUseCase {
  
  GetEventByIdUseCase(this.repository);
  final EventRepository repository;
  
  Future<Either<Failure, EventEntity>> call(String eventId) async => await repository.getEventById(eventId);
}
