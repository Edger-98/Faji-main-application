import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_balance.dart';
import 'package:fajimobileapp/features/wallet/domain/repositories/wallet_repository.dart';

class GetWalletBalanceUseCase {

  GetWalletBalanceUseCase(this.repository);
  final WalletRepository repository;

  Future<Either<Failure, WalletBalance>> call() async => await repository.getWalletBalance();
}
