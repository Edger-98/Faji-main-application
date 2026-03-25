import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_balance.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_transaction.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/withdraw_request.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/topup_request.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/earnings_breakdown.dart';

part 'wallet_remote_datasource.g.dart';

@RestApi()
abstract class WalletRemoteDataSource {
  factory WalletRemoteDataSource(Dio dio, {String baseUrl}) =
      _WalletRemoteDataSource;

  /// Get wallet balance
  @GET('/wallet/balance')
  Future<HttpResponse<dynamic>> getWalletBalance();

  /// Get wallet transactions
  @GET('/wallet/transactions')
  Future<ApiResponse<WalletTransactionsResponse>> getWalletTransactions(
    @Query('type') String? type,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  /// Withdraw funds from wallet
  @POST('/wallet/withdraw')
  Future<HttpResponse<dynamic>> withdrawFunds(
    @Body() WithdrawRequest request,
  );

  /// Fund wallet - POST /wallet/fund
  @POST('/wallet/fund')
  Future<ApiResponse<TopupResponse>> topupWallet(
    @Body() TopupRequest request,
  );

  /// Get earnings breakdown
  @GET('/wallet/earnings')
  Future<ApiResponse<EarningsBreakdown>> getEarningsBreakdown();
}
