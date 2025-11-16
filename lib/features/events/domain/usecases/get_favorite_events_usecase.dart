import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/event_entity.dart';
import '../repositories/event_repository.dart';

class GetFavoriteEventsUseCase {
  final EventRepository repository;
  
  GetFavoriteEventsUseCase(this.repository);
  
  Future<Either<Failure, List<EventEntity>>> call() async {
    return await repository.getFavoriteEvents();
  }
}
