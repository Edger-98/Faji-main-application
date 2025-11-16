import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/event_entity.dart';
import '../repositories/event_repository.dart';

class SearchEventsUseCase {
  final EventRepository repository;
  
  SearchEventsUseCase(this.repository);
  
  Future<Either<Failure, List<EventEntity>>> call(String query) async {
    return await repository.searchEvents(query);
  }
}
