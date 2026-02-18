import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/withdraw_request.dart';
import 'package:fajimobileapp/features/wallet/domain/repositories/wallet_repository.dart';

class WithdrawFundsUseCase {

  WithdrawFundsUseCase(this.repository);
  final WalletRepository repository;

  Future<Either<Failure, WithdrawResponse>> call({
    required WithdrawRequest request,
  }) async => await repository.withdrawFunds(
      request: request,
    );
}
