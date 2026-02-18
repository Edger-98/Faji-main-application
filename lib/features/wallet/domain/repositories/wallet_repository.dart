import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_balance.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_transaction.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/withdraw_request.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/topup_request.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/earnings_breakdown.dart';

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
