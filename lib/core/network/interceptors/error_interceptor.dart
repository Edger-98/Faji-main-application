import 'package:dio/dio.dart';

import 'package:fajimobileapp/core/error/failures.dart';

/// Interceptor to handle API errors
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final Failure failure = _handleError(err);
    
    // You can log the error here
    print('API Error: ${failure.message}');
    
    handler.next(err);
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure.timeout();
      
      case DioExceptionType.badResponse:
        return _handleResponseError(error.response);
      
      case DioExceptionType.cancel:
        return const NetworkFailure(message: 'Request cancelled');
      
      case DioExceptionType.connectionError:
        return NetworkFailure.noConnection();
      
      default:
        return const ServerFailure(message: 'Something went wrong. Please try again.');
    }
  }

  Failure _handleResponseError(Response? response) {
    if (response == null) {
      return const ServerFailure(message: 'No response from server');
    }

    switch (response.statusCode) {
      case 400:
        return ValidationFailure(
          message: response.data['message'] ?? 'Invalid request',
        );
      case 401:
        return AuthFailure.invalidCredentials();
      case 403:
        return const AuthFailure(message: 'Access forbidden');
      case 404:
        return const ServerFailure(message: 'Resource not found');
      case 500:
      case 502:
      case 503:
        return const ServerFailure(message: 'Server error. Please try again later.');
      default:
        return const ServerFailure(message: 'Something went wrong');
    }
  }
}
