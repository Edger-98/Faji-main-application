import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/earnings_breakdown.dart';
import 'package:fajimobileapp/features/wallet/domain/repositories/wallet_repository.dart';

class GetEarningsBreakdownUseCase {

  GetEarningsBreakdownUseCase(this.repository);
  final WalletRepository repository;

  Future<Either<Failure, EarningsBreakdown>> call() async => await repository.getEarningsBreakdown();
}
