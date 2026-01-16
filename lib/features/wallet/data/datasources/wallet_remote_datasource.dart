import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/api_response.dart';
import '../../domain/entities/wallet_balance.dart';
import '../../domain/entities/wallet_transaction.dart';
import '../../domain/entities/withdraw_request.dart';
import '../../domain/entities/topup_request.dart';
import '../../domain/entities/earnings_breakdown.dart';

part 'wallet_remote_datasource.g.dart';

@RestApi()
abstract class WalletRemoteDataSource {
  factory WalletRemoteDataSource(Dio dio, {String baseUrl}) =
      _WalletRemoteDataSource;

  /// Get wallet balance
  @GET('/wallet/balance')
  Future<ApiResponse<WalletBalance>> getWalletBalance();

  /// Get wallet transactions
  @GET('/wallet/transactions')
  Future<ApiResponse<WalletTransactionsResponse>> getWalletTransactions(
    @Query('type') String? type,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  /// Withdraw funds from wallet
  @POST('/wallet/withdraw')
  Future<ApiResponse<WithdrawResponse>> withdrawFunds(
    @Body() WithdrawRequest request,
  );

  /// Top-up wallet
  @POST('/wallet/topup')
  Future<ApiResponse<TopupResponse>> topupWallet(
    @Body() TopupRequest request,
  );

  /// Get earnings breakdown
  @GET('/wallet/earnings')
  Future<ApiResponse<EarningsBreakdown>> getEarningsBreakdown();
}
