import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:fajimobileapp/core/error/failures.dart';

/// Base class for all use cases
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Class to be used when no parameters are needed
class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}