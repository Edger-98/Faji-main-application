import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/data/datasources/payment_remote_datasource.dart';
import 'package:fajimobileapp/features/tickets/data/models/payment_sheet_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/payment_confirmation_model.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  PaymentRepositoryImpl(this._remoteDataSource);

  final PaymentRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, PaymentSheetModel>> createPaymentSheet({
    required String eventId,
    required int quantity,
    String? promoCode,
  }) async {
    try {
      final result = await _remoteDataSource.createPaymentSheet(
        eventId: eventId,
        quantity: quantity,
        promoCode: promoCode,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaymentConfirmationModel>> confirmPayment({
    required String orderId,
    required String paymentIntentId,
  }) async {
    try {
      final result = await _remoteDataSource.confirmPayment(
        orderId: orderId,
        paymentIntentId: paymentIntentId,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> purchaseWithWallet({
    required String eventId,
    required int quantity,
    String? promoCode,
  }) async {
    try {
      await _remoteDataSource.purchaseWithWallet(
        eventId: eventId,
        quantity: quantity,
        promoCode: promoCode,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
