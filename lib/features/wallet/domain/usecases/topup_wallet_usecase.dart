import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/topup_request.dart';
import '../repositories/wallet_repository.dart';

class TopupWalletUseCase {
  final WalletRepository repository;

  TopupWalletUseCase(this.repository);

  Future<Either<Failure, TopupResponse>> call({
    required TopupRequest request,
  }) async {
    return await repository.topupWallet(
      request: request,
    );
  }
}
