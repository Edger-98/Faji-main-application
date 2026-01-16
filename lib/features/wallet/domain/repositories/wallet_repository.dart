import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/wallet_balance.dart';
import '../entities/wallet_transaction.dart';
import '../entities/withdraw_request.dart';
import '../entities/topup_request.dart';
import '../entities/earnings_breakdown.dart';

abstract class WalletRepository {
  /// Get wallet balance
  Future<Either<Failure, WalletBalance>> getWalletBalance();

  /// Get wallet transactions
  Future<Either<Failure, WalletTransactionsResponse>> getWalletTransactions({
    String? type,
    int page = 1,
    int limit = 20,
  });

  /// Withdraw funds from wallet
  Future<Either<Failure, WithdrawResponse>> withdrawFunds({
    required WithdrawRequest request,
  });

  /// Top-up wallet
  Future<Either<Failure, TopupResponse>> topupWallet({
    required TopupRequest request,
  });

  /// Get earnings breakdown
  Future<Either<Failure, EarningsBreakdown>> getEarningsBreakdown();
}
