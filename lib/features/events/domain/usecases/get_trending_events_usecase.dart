import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/event_entity.dart';
import '../repositories/event_repository.dart';

/// Get trending events use case
class GetTrendingEventsUseCase {
  final EventRepository repository;

  GetTrendingEventsUseCase(this.repository);

  Future<Either<Failure, List<EventEntity>>> call({int? limit}) async {
    return await repository.getTrendingEvents(limit: limit);
  }
}
