import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/data/models/payment_sheet_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/payment_confirmation_model.dart';

abstract class PaymentRepository {
  Future<Either<Failure, PaymentSheetModel>> createPaymentSheet({
    required String eventId,
    required int quantity,
    String? promoCode,
  });

  Future<Either<Failure, PaymentConfirmationModel>> confirmPayment({
    required String orderId,
    required String paymentIntentId,
  });
}
