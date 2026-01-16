import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/invite_cohost_request.dart';
import '../../domain/entities/cohost_invitation.dart';
import '../../domain/entities/accept_invitation_response.dart';
import '../../domain/entities/cohost.dart';
import '../../domain/entities/cohost_dashboard.dart';
import '../../domain/entities/remove_cohost_response.dart';
import '../../domain/repositories/cohost_repository.dart';
import '../datasources/cohost_remote_datasource.dart';

class CohostRepositoryImpl implements CohostRepository {
  final CohostRemoteDataSource remoteDataSource;

  CohostRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, InviteCohostResponse>> inviteCohost({
    required String eventId,
    required InviteCohostRequest request,
  }) async {
    try {
      final response = await remoteDataSource.inviteCohost(eventId, request);
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
      final response = await remoteDataSource.getCohostInvitations(
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
      final response = await remoteDataSource.acceptInvitation(invitationId);
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
      final request = DeclineInvitationRequest(reason: reason);
      final response = await remoteDataSource.declineInvitation(
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
      final response = await remoteDataSource.getEventCohosts(eventId);
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
      final response = await remoteDataSource.removeCohost(eventId, cohostId);
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
      final response = await remoteDataSource.getCohostDashboard(eventId);
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
        return ServerFailure(message: 'Connection timeout');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Server error';
        if (statusCode == 401) {
          return AuthFailure(message: 'Unauthorized');
        } else if (statusCode == 403) {
          return AuthFailure(message: 'Forbidden');
        } else if (statusCode == 404) {
          return ServerFailure(message: 'Not found');
        }
        return ServerFailure(message: message);
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        return NetworkFailure(message: 'No internet connection');
      default:
        return ServerFailure(message: error.message ?? 'Unknown error');
    }
  }
}
