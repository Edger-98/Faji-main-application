import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/event_entity.dart';
import '../repositories/event_repository.dart';

class GetEventByIdUseCase {
  final EventRepository repository;
  
  GetEventByIdUseCase(this.repository);
  
  Future<Either<Failure, EventEntity>> call(String eventId) async {
    return await repository.getEventById(eventId);
  }
}
