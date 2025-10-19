import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    this.code,
    this.details,
  });

  final String message;
  final String? code;
  final Map<String, dynamic>? details;

  @override
  List<Object?> get props => <Object?>[message, code, details];
}

/// Server-related failures
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.code,
    super.details,
  });

  factory ServerFailure.fromStatusCode(int statusCode, {String? message}) {
    switch (statusCode) {
      case 400:
        return const ServerFailure(
          message: 'Bad request. Please check your input.',
          code: 'BAD_REQUEST',
        );
      case 401:
        return const ServerFailure(
          message: 'Authentication failed. Please log in again.',
          code: 'UNAUTHORIZED',
        );
      case 403:
        return const ServerFailure(
          message: 'Access denied. You don\'t have permission.',
          code: 'FORBIDDEN',
        );
      case 404:
        return const ServerFailure(
          message: 'Resource not found.',
          code: 'NOT_FOUND',
        );
      case 409:
        return const ServerFailure(
          message: 'Conflict. Resource already exists.',
          code: 'CONFLICT',
        );
      case 422:
        return const ServerFailure(
          message: 'Validation failed. Please check your input.',
          code: 'VALIDATION_ERROR',
        );
      case 429:
        return const ServerFailure(
          message: 'Too many requests. Please try again later.',
          code: 'RATE_LIMIT',
        );
      case 500:
        return const ServerFailure(
          message: 'Internal server error. Please try again.',
          code: 'INTERNAL_ERROR',
        );
      case 502:
        return const ServerFailure(
          message: 'Bad gateway. Service temporarily unavailable.',
          code: 'BAD_GATEWAY',
        );
      case 503:
        return const ServerFailure(
          message: 'Service unavailable. Please try again later.',
          code: 'SERVICE_UNAVAILABLE',
        );
      case 504:
        return const ServerFailure(
          message: 'Gateway timeout. Please try again.',
          code: 'GATEWAY_TIMEOUT',
        );
      default:
        return ServerFailure(
          message: message ?? 'Server error occurred. Please try again.',
          code: 'SERVER_ERROR',
          details: <String, dynamic>{'statusCode': statusCode},
        );
    }
  }
}

/// Network-related failures
class NetworkFailure extends Failure {
  const NetworkFailure({
    required super.message,
    super.code,
    super.details,
  });

  factory NetworkFailure.noConnection() {
    return const NetworkFailure(
      message: 'No internet connection. Please check your network.',
      code: 'NO_CONNECTION',
    );
  }

  factory NetworkFailure.timeout() {
    return const NetworkFailure(
      message: 'Request timeout. Please try again.',
      code: 'TIMEOUT',
    );
  }

  factory NetworkFailure.connectionError() {
    return const NetworkFailure(
      message: 'Connection error. Please check your network.',
      code: 'CONNECTION_ERROR',
    );
  }
}

/// Cache-related failures
class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    super.code,
    super.details,
  });

  factory CacheFailure.notFound() {
    return const CacheFailure(
      message: 'Data not found in cache.',
      code: 'CACHE_NOT_FOUND',
    );
  }

  factory CacheFailure.writeError() {
    return const CacheFailure(
      message: 'Failed to write to cache.',
      code: 'CACHE_WRITE_ERROR',
    );
  }

  factory CacheFailure.readError() {
    return const CacheFailure(
      message: 'Failed to read from cache.',
      code: 'CACHE_READ_ERROR',
    );
  }
}

/// Authentication-related failures
class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.code,
    super.details,
  });

  factory AuthFailure.invalidCredentials() {
    return const AuthFailure(
      message: 'Invalid email or password.',
      code: 'INVALID_CREDENTIALS',
    );
  }

  factory AuthFailure.userNotFound() {
    return const AuthFailure(
      message: 'User not found.',
      code: 'USER_NOT_FOUND',
    );
  }

  factory AuthFailure.emailAlreadyExists() {
    return const AuthFailure(
      message: 'Email already exists.',
      code: 'EMAIL_EXISTS',
    );
  }

  factory AuthFailure.weakPassword() {
    return const AuthFailure(
      message: 'Password is too weak.',
      code: 'WEAK_PASSWORD',
    );
  }

  factory AuthFailure.tokenExpired() {
    return const AuthFailure(
      message: 'Session expired. Please log in again.',
      code: 'TOKEN_EXPIRED',
    );
  }

  factory AuthFailure.accountDisabled() {
    return const AuthFailure(
      message: 'Account has been disabled.',
      code: 'ACCOUNT_DISABLED',
    );
  }
}

/// Validation-related failures
class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.code,
    super.details,
  });

  factory ValidationFailure.invalidInput(String field) {
    return ValidationFailure(
      message: 'Invalid $field provided.',
      code: 'INVALID_INPUT',
      details: <String, dynamic>{'field': field},
    );
  }

  factory ValidationFailure.requiredField(String field) {
    return ValidationFailure(
      message: '$field is required.',
      code: 'REQUIRED_FIELD',
      details: <String, dynamic>{'field': field},
    );
  }

  factory ValidationFailure.multipleErrors(Map<String, String> errors) {
    return ValidationFailure(
      message: 'Multiple validation errors occurred.',
      code: 'MULTIPLE_ERRORS',
      details: <String, dynamic>{'errors': errors},
    );
  }
}

/// Permission-related failures
class PermissionFailure extends Failure {
  const PermissionFailure({
    required super.message,
    super.code,
    super.details,
  });

  factory PermissionFailure.denied(String permission) {
    return PermissionFailure(
      message: '$permission permission denied.',
      code: 'PERMISSION_DENIED',
      details: <String, dynamic>{'permission': permission},
    );
  }

  factory PermissionFailure.permanentlyDenied(String permission) {
    return PermissionFailure(
      message: '$permission permission permanently denied.',
      code: 'PERMISSION_PERMANENTLY_DENIED',
      details: <String, dynamic>{'permission': permission},
    );
  }
}

/// Storage-related failures
class StorageFailure extends Failure {
  const StorageFailure({
    required super.message,
    super.code,
    super.details,
  });

  factory StorageFailure.notFound() {
    return const StorageFailure(
      message: 'File not found.',
      code: 'FILE_NOT_FOUND',
    );
  }

  factory StorageFailure.accessDenied() {
    return const StorageFailure(
      message: 'Access denied to storage.',
      code: 'STORAGE_ACCESS_DENIED',
    );
  }

  factory StorageFailure.insufficientSpace() {
    return const StorageFailure(
      message: 'Insufficient storage space.',
      code: 'INSUFFICIENT_SPACE',
    );
  }

  factory StorageFailure.corruptedData() {
    return const StorageFailure(
      message: 'Data is corrupted.',
      code: 'CORRUPTED_DATA',
    );
  }
}

/// Unknown or unexpected failures
class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.message,
    super.code,
    super.details,
  });

  factory UnknownFailure.fromException(Exception exception) {
    return UnknownFailure(
      message: 'An unexpected error occurred: ${exception.toString()}',
      code: 'UNKNOWN_ERROR',
      details: <String, dynamic>{'exception': exception.toString()},
    );
  }

  factory UnknownFailure.fromError(Error error) {
    return UnknownFailure(
      message: 'An unexpected error occurred: ${error.toString()}',
      code: 'UNKNOWN_ERROR',
      details: <String, dynamic>{
        'error': error.toString(),
        'stackTrace': error.stackTrace.toString(),
      },
    );
  }
}