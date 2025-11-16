import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/event_repository.dart';

class RemoveFromFavoritesUseCase {
  final EventRepository repository;
  
  RemoveFromFavoritesUseCase(this.repository);
  
  Future<Either<Failure, void>> call(String eventId) async {
    return await repository.removeFromFavorites(eventId);
  }
}
