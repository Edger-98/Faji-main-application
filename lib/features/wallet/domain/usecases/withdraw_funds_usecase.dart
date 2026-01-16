import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/withdraw_request.dart';
import '../repositories/wallet_repository.dart';

class WithdrawFundsUseCase {
  final WalletRepository repository;

  WithdrawFundsUseCase(this.repository);

  Future<Either<Failure, WithdrawResponse>> call({
    required WithdrawRequest request,
  }) async {
    return await repository.withdrawFunds(
      request: request,
    );
  }
}
