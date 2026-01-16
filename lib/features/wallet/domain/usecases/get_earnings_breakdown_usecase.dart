import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/earnings_breakdown.dart';
import '../repositories/wallet_repository.dart';

class GetEarningsBreakdownUseCase {
  final WalletRepository repository;

  GetEarningsBreakdownUseCase(this.repository);

  Future<Either<Failure, EarningsBreakdown>> call() async {
    return await repository.getEarningsBreakdown();
  }
}
