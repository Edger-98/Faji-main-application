import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:retrofit/dio.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_balance.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_transaction.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/withdraw_request.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/topup_request.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/earnings_breakdown.dart';
import 'package:fajimobileapp/features/wallet/domain/repositories/wallet_repository.dart';
import 'package:fajimobileapp/features/wallet/data/datasources/wallet_remote_datasource.dart';

class WalletRepositoryImpl implements WalletRepository {

  WalletRepositoryImpl(this.remoteDataSource);
  final WalletRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, WalletBalance>> getWalletBalance() async {
    try {
      final HttpResponse response = await remoteDataSource.getWalletBalance();
      
      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        
        // Handle both wrapped and direct responses
        final Map<String, dynamic> data = responseData['data'] as Map<String, dynamic>? ?? responseData;
        
        final WalletBalance walletBalance = WalletBalance.fromJson(data);
        return Right(walletBalance);
      } else {
        return const Left(ServerFailure(message: 'Failed to get wallet balance'));
      }    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WalletTransactionsResponse>> getWalletTransactions({
    String? type,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final ApiResponse<WalletTransactionsResponse> response = await remoteDataSource.getWalletTransactions(
        type,
        page,
        limit,
      );
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get transactions'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WithdrawResponse>> withdrawFunds({
    required WithdrawRequest request,
  }) async {
    try {
      final HttpResponse response = await remoteDataSource.withdrawFunds(request);
      
      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        
        // Handle both wrapped and direct responses
        final Map<String, dynamic> data = responseData['data'] as Map<String, dynamic>? ?? responseData;
        
        final WithdrawResponse withdrawResponse = WithdrawResponse.fromJson(data);
        return Right(withdrawResponse);
      } else {
        return const Left(ServerFailure(message: 'Failed to withdraw funds'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TopupResponse>> topupWallet({
    required TopupRequest request,
  }) async {
    try {
      final ApiResponse<TopupResponse> response = await remoteDataSource.topupWallet(request);
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to top-up wallet'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EarningsBreakdown>> getEarningsBreakdown() async {
    try {
      final ApiResponse<EarningsBreakdown> response = await remoteDataSource.getEarningsBreakdown();
      if (response.success && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(message: response.message ?? 'Failed to get earnings breakdown'));
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
        final message = (error.response?.data?['message'] as String?) ?? 'Server error';
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
