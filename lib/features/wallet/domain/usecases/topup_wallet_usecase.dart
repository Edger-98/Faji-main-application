import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/topup_request.dart';
import 'package:fajimobileapp/features/wallet/domain/repositories/wallet_repository.dart';

class TopupWalletUseCase {

  TopupWalletUseCase(this.repository);
  final WalletRepository repository;

  Future<Either<Failure, TopupResponse>> call({
    required TopupRequest request,
  }) async => await repository.topupWallet(
      request: request,
    );
}
