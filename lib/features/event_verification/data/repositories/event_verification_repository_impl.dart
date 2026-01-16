import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/refund_response.dart';
import '../../domain/entities/revenue_distribution.dart';
import '../../domain/entities/verification_status.dart';
import '../../domain/entities/verify_event_response.dart';
import '../../domain/repositories/event_verification_repository.dart';
import '../datasources/event_verification_remote_datasource.dart';

/// Event Verification Repository Implementation
class EventVerificationRepositoryImpl implements EventVerificationRepository {
  final EventVerificationRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  EventVerificationRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, VerificationStatus>> getVerificationStatus(
    String eventId,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getVerificationStatus(eventId);

      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyEventResponse>> verifyEvent({
    required String eventId,
    bool manualOverride = false,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.verifyEvent(
        eventId,
        manualOverride ? {'manualOverride': true} : null,
      );

      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RevenueDistribution>> getRevenueDistribution(
    String eventId,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.getRevenueDistribution(eventId);

      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RefundResponse>> processRefunds({
    required String eventId,
    String? reason,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.processRefunds(
        eventId,
        reason != null ? {'reason': reason} : null,
      );

      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyEventResponse>> releaseEscrow(
    String eventId,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final response = await remoteDataSource.releaseEscrow(eventId);

      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure.timeout();
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] as String? ??
            error.response?.data?['error'] as String? ??
            'An error occurred';

        if (statusCode == 401) {
          // Provide a user-friendly message for authorization issues
          final customMessage = message.toLowerCase().contains('event') || 
                               message.toLowerCase().contains('access') ||
                               message.toLowerCase().contains('permission')
              ? "You're not authorized to perform this action on this event"
              : message;
          return AuthFailure(message: customMessage);
        } else if (statusCode == 422 || statusCode == 400) {
          return ValidationFailure(message: message);
        } else if (statusCode == 404) {
          return ServerFailure(message: 'Event not found');
        }
        return ServerFailure(message: message);
      case DioExceptionType.cancel:
        return const NetworkFailure(message: 'Request cancelled');
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return NetworkFailure.connectionError();
    }
  }
}
