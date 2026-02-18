import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';

/// Base ViewModel class for all features
abstract class BaseViewModel<T> extends StateNotifier<BaseState<T>> {
  BaseViewModel() : super(const BaseState.initial());

  /// Set loading state
  void setLoading() {
    state = const BaseState.loading();
  }

  /// Set success state
  void setSuccess(T data) {
    state = BaseState.success(data);
  }

  /// Set error state
  void setError(String message) {
    state = BaseState.error(
      Exception(message) as Never, // This will be properly typed in implementation
    );
  }

  /// Reset to initial state
  void reset() {
    state = const BaseState.initial();
  }
}
