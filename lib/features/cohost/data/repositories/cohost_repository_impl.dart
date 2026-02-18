import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/invite_cohost_request.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost_invitation.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/accept_invitation_response.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost_dashboard.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/remove_cohost_response.dart';
import 'package:fajimobileapp/features/cohost/domain/repositories/cohost_repository.dart';
import 'package:fajimobileapp/features/cohost/data/datasources/cohost_remote_datasource.dart';

class CohostRepositoryImpl implements CohostRepository {

  CohostRepositoryImpl(this.remoteDataSource);
  final CohostRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, InviteCohostResponse>> inviteCohost({
    required String eventId,
    required InviteCohostRequest request,
  }) async {
    try {
      final ApiResponse<InviteCohostResponse> response = await remoteDataSource.inviteCohost(eventId, request);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to invite co-host'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CohostInvitationsResponse>> getCohostInvitations({
    String? status,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final ApiResponse<CohostInvitationsResponse> response = await remoteDataSource.getCohostInvitations(
        status,
        page,
        limit,
      );
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get invitations'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AcceptInvitationResponse>> acceptInvitation({
    required String invitationId,
  }) async {
    try {
      final ApiResponse<AcceptInvitationResponse> response = await remoteDataSource.acceptInvitation(invitationId);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to accept invitation'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeclineInvitationResponse>> declineInvitation({
    required String invitationId,
    String? reason,
  }) async {
    try {
      final DeclineInvitationRequest request = DeclineInvitationRequest(reason: reason);
      final ApiResponse<DeclineInvitationResponse> response = await remoteDataSource.declineInvitation(
        invitationId,
        request,
      );
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to decline invitation'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EventCohostsResponse>> getEventCohosts({
    required String eventId,
  }) async {
    try {
      final ApiResponse<EventCohostsResponse> response = await remoteDataSource.getEventCohosts(eventId);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get co-hosts'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RemoveCohostResponse>> removeCohost({
    required String eventId,
    required String cohostId,
  }) async {
    try {
      final ApiResponse<RemoveCohostResponse> response = await remoteDataSource.removeCohost(eventId, cohostId);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to remove co-host'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CohostDashboard>> getCohostDashboard({
    required String eventId,
  }) async {
    try {
      final ApiResponse<CohostDashboard> response = await remoteDataSource.getCohostDashboard(eventId);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get dashboard'));
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
        return const ServerFailure(message: 'Connection timeout');
      case DioExceptionType.badResponse:
        final int? statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Server error';
        if (statusCode == 401) {
          return const AuthFailure(message: 'Unauthorized');
        } else if (statusCode == 403) {
          return const AuthFailure(message: 'Forbidden');
        } else if (statusCode == 404) {
          return const ServerFailure(message: 'Not found');
        }
        return ServerFailure(message: message);
      case DioExceptionType.cancel:
        return const ServerFailure(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        return const NetworkFailure(message: 'No internet connection');
      default:
        return ServerFailure(message: error.message ?? 'Unknown error');
    }
  }
}
