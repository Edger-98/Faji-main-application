import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fajimobileapp/core/error/failures.dart';

part 'base_state.freezed.dart';

/// Base state for all features using Riverpod
@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = _Initial<T>;
  const factory BaseState.loading() = _Loading<T>;
  const factory BaseState.success(T data) = _Success<T>;
  const factory BaseState.error(Failure failure) = _Error<T>;
}

/// Extension for state checking
extension BaseStateX<T> on BaseState<T> {
  bool get isInitial => this is _Initial<T>;
  bool get isLoading => this is _Loading<T>;
  bool get isSuccess => this is _Success<T>;
  bool get isError => this is _Error<T>;

  T? get dataOrNull => maybeWhen(
        success: (data) => data,
        orElse: () => null,
      );

  Failure? get failureOrNull => maybeWhen(
        error: (Failure failure) => failure,
        orElse: () => null,
      );
}
