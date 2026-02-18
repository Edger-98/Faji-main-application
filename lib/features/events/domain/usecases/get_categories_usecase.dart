import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/core/usecases/usecase.dart';
import 'package:fajimobileapp/features/events/domain/entities/category_entity.dart';
import 'package:fajimobileapp/features/events/domain/repositories/event_repository.dart';

class GetCategoriesUseCase implements UseCase<List<CategoryEntity>, NoParams> {

  GetCategoriesUseCase(this.repository);
  final EventRepository repository;

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async => await repository.getCategories();
}