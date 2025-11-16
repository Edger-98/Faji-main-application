import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/event_repository.dart';

class AddToFavoritesUseCase {
  final EventRepository repository;
  
  AddToFavoritesUseCase(this.repository);
  
  Future<Either<Failure, void>> call(String eventId) async {
    return await repository.addToFavorites(eventId);
  }
}
