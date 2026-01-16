import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/wallet_transaction.dart';
import '../repositories/wallet_repository.dart';

class GetWalletTransactionsUseCase {
  final WalletRepository repository;

  GetWalletTransactionsUseCase(this.repository);

  Future<Either<Failure, WalletTransactionsResponse>> call({
    String? type,
    int page = 1,
    int limit = 20,
  }) async {
    return await repository.getWalletTransactions(
      type: type,
      page: page,
      limit: limit,
    );
  }
}
