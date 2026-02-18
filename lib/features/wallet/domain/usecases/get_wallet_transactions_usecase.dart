import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_transaction.dart';
import 'package:fajimobileapp/features/wallet/domain/repositories/wallet_repository.dart';

class GetWalletTransactionsUseCase {

  GetWalletTransactionsUseCase(this.repository);
  final WalletRepository repository;

  Future<Either<Failure, WalletTransactionsResponse>> call({
    String? type,
    int page = 1,
    int limit = 20,
  }) async => await repository.getWalletTransactions(
      type: type,
      page: page,
      limit: limit,
    );
}
