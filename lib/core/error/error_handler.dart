import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/core/utils/logger.dart';

/// Centralized error handling for the application
class ErrorHandler {
  ErrorHandler._();

  /// Handle Dio errors and convert to appropriate Failure
  static Failure handleDioError(DioException error) {
    Logger.error('Dio error occurred: ${error.message}');

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure.timeout();

      case DioExceptionType.connectionError:
        if (error.error is SocketException) {
          return NetworkFailure.noConnection();
        }
        return NetworkFailure.connectionError();

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode != null) {
          return ServerFailure.fromStatusCode(
            statusCode,
            message: _extractErrorMessage(error.response?.data),
          );
        }
        return const ServerFailure(
          message: 'Bad response from server',
          code: 'BAD_RESPONSE',
        );

      case DioExceptionType.cancel:
        return const NetworkFailure(
          message: 'Request was cancelled',
          code: 'REQUEST_CANCELLED',
        );

      case DioExceptionType.badCertificate:
        return const NetworkFailure(
          message: 'Certificate verification failed',
          code: 'BAD_CERTIFICATE',
        );

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return NetworkFailure.noConnection();
        }
        return UnknownFailure.fromException(error);
    }
  }

  /// Handle general exceptions and convert to appropriate Failure
  static Failure handleException(Exception exception) {
    Logger.error('Exception occurred: ${exception}');

    if (exception is SocketException) {
      return NetworkFailure.noConnection();
    }

    if (exception is FormatException) {
      return const ValidationFailure(
        message: 'Invalid data format',
        code: 'FORMAT_ERROR',
      );
    }

    if (exception is ArgumentError) {
      return ValidationFailure(
        message: 'Invalid argument: ${exception}',
        code: 'INVALID_ARGUMENT',
      );
    }

    return UnknownFailure.fromException(exception);
  }

  /// Handle general errors and convert to appropriate Failure
  static Failure handleError(Error error) {
    Logger.error('Error occurred: ${error}');

    if (error is AssertionError) {
      return UnknownFailure(
        message: 'Assertion failed: ${error.message}',
        code: 'ASSERTION_ERROR',
      );
    }

    if (error is TypeError) {
      return const UnknownFailure(
        message: 'Type error occurred',
        code: 'TYPE_ERROR',
      );
    }

    if (error is NoSuchMethodError) {
      return const UnknownFailure(
        message: 'Method not found',
        code: 'METHOD_NOT_FOUND',
      );
    }

    return UnknownFailure.fromError(error);
  }

  /// Handle any object and convert to appropriate Failure
  static Failure handleAny(Object error) {
    if (error is Failure) {
      return error;
    }

    if (error is DioException) {
      return handleDioError(error);
    }

    if (error is Exception) {
      return handleException(error);
    }

    if (error is Error) {
      return handleError(error);
    }

    Logger.error('Unknown error type occurred: ${error}');
    return UnknownFailure(
      message: 'An unexpected error occurred: ${error}',
      code: 'UNKNOWN_ERROR',
    );
  }

  /// Get user-friendly error message from Failure
  static String getErrorMessage(Failure failure) {
    // In debug mode, show detailed error messages
    if (kDebugMode) {
      return '${failure.message}${failure.code != null ? ' (${failure.code})' : ''}';
    }

    // In production, show user-friendly messages
    switch (failure.runtimeType) {
      case const (NetworkFailure):
        return 'Network error. Please check your connection and try again.';
      case const (ServerFailure):
        final serverFailure = failure as ServerFailure;
        switch (serverFailure.code) {
          case 'UNAUTHORIZED':
            return 'Please log in to continue.';
          case 'FORBIDDEN':
            return "You don't have permission to perform this action.";
          case 'NOT_FOUND':
            return 'The requested resource was not found.';
          case 'VALIDATION_ERROR':
            return 'Please check your input and try again.';
          case 'RATE_LIMIT':
            return 'Too many requests. Please wait and try again.';
          default:
            return 'Server error. Please try again later.';
        }
      case const (AuthFailure):
        return failure.message; // Auth messages are usually user-friendly
      case const (ValidationFailure):
        return failure.message; // Validation messages are usually user-friendly
      case const (PermissionFailure):
        return failure.message; // Permission messages are usually user-friendly
      case const (StorageFailure):
        return 'Storage error. Please try again.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }

  /// Log error with appropriate level
  static void logError(Failure failure, {StackTrace? stackTrace}) {
    switch (failure.runtimeType) {
      case const (NetworkFailure):
        Logger.warning('Network failure: ${failure.message}');
      case const (ValidationFailure):
        Logger.info('Validation failure: ${failure.message}');
      case const (CacheFailure):
        Logger.debug('Cache failure: ${failure.message}');
      default:
        Logger.error('Failure occurred: ${failure.message}');
    }
  }

  /// Check if error is recoverable
  static bool isRecoverable(Failure failure) {
    switch (failure.runtimeType) {
      case const (NetworkFailure):
        final networkFailure = failure as NetworkFailure;
        return networkFailure.code != 'NO_CONNECTION';
      case const (ServerFailure):
        final serverFailure = failure as ServerFailure;
        return !<String>['UNAUTHORIZED', 'FORBIDDEN'].contains(serverFailure.code);
      case const (ValidationFailure):
      case const (AuthFailure):
        return false; // User needs to fix input
      case const (CacheFailure):
        return true; // Can retry with network
      case const (StorageFailure):
        final storageFailure = failure as StorageFailure;
        return storageFailure.code != 'INSUFFICIENT_SPACE';
      default:
        return true; // Assume recoverable unless proven otherwise
    }
  }

  /// Get retry delay for recoverable errors
  static Duration getRetryDelay(Failure failure, int attemptNumber) {
    // Exponential backoff with jitter
    final baseDelay = switch (failure.runtimeType) {
      const (NetworkFailure) => 1000, // 1 second
      const (ServerFailure) => 2000,  // 2 seconds
      _ => 1500, // 1.5 seconds
    };

    final delay = baseDelay * (1 << (attemptNumber - 1)); // 2^(n-1)
    final jitter = (delay * 0.1).round(); // 10% jitter
    
    return Duration(milliseconds: delay + jitter);
  }

  /// Extract error message from response data
  static String? _extractErrorMessage(responseData) {
    if (responseData == null) return null;

    if (responseData is Map<String, dynamic>) {
      // Try common error message fields
      for (final key in <String>['message', 'error', 'detail', 'msg']) {
        if (responseData.containsKey(key) && responseData[key] is String) {
          return responseData[key] as String;
        }
      }

      // Try nested error objects
      if (responseData.containsKey('error') && responseData['error'] is Map) {
        final errorObj = responseData['error'] as Map<String, dynamic>;
        if (errorObj.containsKey('message') && errorObj['message'] is String) {
          return errorObj['message'] as String;
        }
      }
    }

    if (responseData is String) {
      return responseData;
    }

    return null;
  }
}