/// Result wrapper for API calls
class ApiResult<T> {
  final T? data;
  final String? error;
  final bool isSuccess;

  const ApiResult._({
    this.data,
    this.error,
    required this.isSuccess,
  });

  /// Create a success result
  factory ApiResult.success(T data) {
    return ApiResult._(
      data: data,
      isSuccess: true,
    );
  }

  /// Create a failure result
  factory ApiResult.failure(String error) {
    return ApiResult._(
      error: error,
      isSuccess: false,
    );
  }

  /// Execute different callbacks based on result
  R when<R>({
    required R Function(T data) success,
    required R Function(String error) failure,
  }) {
    if (isSuccess && data != null) {
      return success(data as T);
    } else {
      return failure(error ?? 'Unknown error');
    }
  }

  /// Map the data if success
  ApiResult<R> map<R>(R Function(T data) transform) {
    if (isSuccess && data != null) {
      return ApiResult.success(transform(data as T));
    } else {
      return ApiResult.failure(error ?? 'Unknown error');
    }
  }
}
