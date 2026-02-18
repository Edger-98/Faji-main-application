import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/events/domain/repositories/event_repository.dart';

class RemoveFromFavoritesUseCase {
  
  RemoveFromFavoritesUseCase(this.repository);
  final EventRepository repository;
  
  Future<Either<Failure, void>> call(String eventId) async => await repository.removeFromFavorites(eventId);
}
