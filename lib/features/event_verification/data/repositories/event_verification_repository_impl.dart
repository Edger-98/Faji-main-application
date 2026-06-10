import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fajimobileapp/core/network/api_response.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/core/network/network_info.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/refund_response.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/revenue_distribution.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/verification_status.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/verify_event_response.dart' hide VerificationStatus;
import 'package:fajimobileapp/features/event_verification/domain/repositories/event_verification_repository.dart';
import 'package:fajimobileapp/features/event_verification/data/datasources/event_verification_remote_datasource.dart';

/// Event Verification Repository Implementation
class EventVerificationRepositoryImpl implements EventVerificationRepository {

  EventVerificationRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  final EventVerificationRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, VerificationStatus>> getVerificationStatus(
    String eventId,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final ApiResponse<VerificationStatus> response = await remoteDataSource.getVerificationStatus(eventId);

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
      final ApiResponse<VerifyEventResponse> response = await remoteDataSource.verifyEvent(
        eventId,
        manualOverride ? <String, dynamic>{'manualOverride': true} : null,
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
      final ApiResponse<RevenueDistribution> response = await remoteDataSource.getRevenueDistribution(eventId);

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
      final ApiResponse<RefundResponse> response = await remoteDataSource.processRefunds(
        eventId,
        reason != null ? <String, dynamic>{'reason': reason} : null,
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
      final ApiResponse<VerifyEventResponse> response = await remoteDataSource.releaseEscrow(eventId);

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
        final int? statusCode = error.response?.statusCode;
        final String message = error.response?.data?['message'] as String? ??
            error.response?.data?['error'] as String? ??
            'An error occurred';

        if (statusCode == 401) {
          // Provide a user-friendly message for authorization issues
          final String customMessage = message.toLowerCase().contains('event') || 
                               message.toLowerCase().contains('access') ||
                               message.toLowerCase().contains('permission')
              ? "You're not authorized to perform this action on this event"
              : message;
          return AuthFailure(message: customMessage);
        } else if (statusCode == 422 || statusCode == 400) {
          return ValidationFailure(message: message);
        } else if (statusCode == 404) {
          return const ServerFailure(message: 'Event not found');
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
