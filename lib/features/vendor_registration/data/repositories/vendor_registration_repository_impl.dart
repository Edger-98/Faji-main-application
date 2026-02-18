import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_registration.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_document.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_portfolio.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/bank_details.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/registration_status.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/repositories/vendor_registration_repository.dart';
import 'package:fajimobileapp/features/vendor_registration/data/datasources/vendor_registration_remote_datasource.dart';

class VendorRegistrationRepositoryImpl
    implements VendorRegistrationRepository {

  VendorRegistrationRepositoryImpl(this.remoteDataSource);
  final VendorRegistrationRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, VendorRegistrationResponse>> registerVendor({
    required VendorRegistrationRequest request,
  }) async {
    try {
      final ApiResponse<VendorRegistrationResponse> response = await remoteDataSource.registerVendor(request);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to register vendor'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VendorDocument>> uploadDocuments({
    required UploadDocumentRequest request,
  }) async {
    try {
      final ApiResponse<VendorDocument> response = await remoteDataSource.uploadDocuments(request);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to upload documents'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VendorPortfolio>> uploadPortfolio({
    required UploadPortfolioRequest request,
  }) async {
    try {
      final ApiResponse<VendorPortfolio> response = await remoteDataSource.uploadPortfolio(request);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to upload portfolio'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BankDetailsResponse>> addBankDetails({
    required BankDetailsRequest request,
  }) async {
    try {
      final ApiResponse<BankDetailsResponse> response = await remoteDataSource.addBankDetails(request);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to add bank details'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegistrationStatus>> checkStatus() async {
    try {
      final ApiResponse<RegistrationStatus> response = await remoteDataSource.checkStatus();
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to check status'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VendorRegistrationProfile>> getProfile() async {
    try {
      final ApiResponse<VendorRegistrationProfile> response = await remoteDataSource.getProfile();
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get profile'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VendorRegistrationProfile>> updateProfile({
    required Map<String, dynamic> profileData,
  }) async {
    try {
      final ApiResponse<VendorRegistrationProfile> response = await remoteDataSource.updateProfile(profileData);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to update profile'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePortfolio({
    required String portfolioId,
  }) async {
    try {
      await remoteDataSource.deletePortfolio(portfolioId);
      return const Right(null);
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
