import 'package:dio/dio.dart';
import 'package:fajimobileapp/features/tickets/data/models/payment_sheet_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/payment_confirmation_model.dart';

/// Remote data source for payment operations
abstract class PaymentRemoteDataSource {
  Future<PaymentSheetModel> createPaymentSheet({
    required String eventId,
    required int quantity,
    String? promoCode,
  });

  Future<PaymentConfirmationModel> confirmPayment({
    required String orderId,
    required String paymentIntentId,
  });
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  PaymentRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<PaymentSheetModel> createPaymentSheet({
    required String eventId,
    required int quantity,
    String? promoCode,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/payments/mobile/create-payment-sheet',
      data: {
        'eventId': eventId,
        'quantity': quantity,
        if (promoCode != null) 'promoCode': promoCode,
      },
    );

    if (response.data == null) {
      throw Exception('Failed to create payment sheet');
    }

    return PaymentSheetModel.fromJson(response.data!);
  }

  @override
  Future<PaymentConfirmationModel> confirmPayment({
    required String orderId,
    required String paymentIntentId,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/payments/mobile/confirm-payment',
      data: {
        'orderId': orderId,
        'paymentIntentId': paymentIntentId,
      },
    );

    if (response.data == null) {
      throw Exception('Failed to confirm payment');
    }

    return PaymentConfirmationModel.fromJson(response.data!);
  }
}
