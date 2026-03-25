import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/core/services/stripe_service.dart';
import 'package:fajimobileapp/features/tickets/data/datasources/payment_remote_datasource.dart';
import 'package:fajimobileapp/features/tickets/data/repositories/payment_repository_impl.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/payment_repository.dart';
import 'package:fajimobileapp/features/tickets/data/models/payment_sheet_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/payment_confirmation_model.dart';

/// Payment data source provider
final paymentRemoteDataSourceProvider = Provider<PaymentRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return PaymentRemoteDataSourceImpl(dio);
});

/// Payment repository provider
final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  final dataSource = ref.watch(paymentRemoteDataSourceProvider);
  return PaymentRepositoryImpl(dataSource);
});

/// Payment state
class PaymentState {
  const PaymentState({
    this.isLoading = false,
    this.error,
    this.paymentSheet,
    this.confirmation,
  });

  final bool isLoading;
  final String? error;
  final PaymentSheetModel? paymentSheet;
  final PaymentConfirmationModel? confirmation;

  PaymentState copyWith({
    bool? isLoading,
    String? error,
    PaymentSheetModel? paymentSheet,
    PaymentConfirmationModel? confirmation,
  }) =>
      PaymentState(
        isLoading: isLoading ?? this.isLoading,
        error: error,
        paymentSheet: paymentSheet ?? this.paymentSheet,
        confirmation: confirmation ?? this.confirmation,
      );
}

/// Payment notifier
class PaymentNotifier extends StateNotifier<PaymentState> {
  PaymentNotifier(this._repository, this._stripeService) : super(const PaymentState());

  final PaymentRepository _repository;
  final StripeService _stripeService;

  /// Process complete payment flow
  Future<bool> processPayment({
    required String eventId,
    required int quantity,
    String? promoCode,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      // Step 1: Create payment sheet
      final sheetResult = await _repository.createPaymentSheet(
        eventId: eventId,
        quantity: quantity,
        promoCode: promoCode,
      );

      return sheetResult.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: failure.message,
          );
          return false;
        },
        (paymentSheet) async {
          state = state.copyWith(paymentSheet: paymentSheet);

          // Step 2: Initialize and present payment sheet
          try {
            await Stripe.instance.initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: paymentSheet.paymentIntentClientSecret,
                merchantDisplayName: 'Faji Events',
                customerId: paymentSheet.customerId,
                customerEphemeralKeySecret: paymentSheet.ephemeralKey,
                style: ThemeMode.dark,
                appearance: const PaymentSheetAppearance(
                  colors: PaymentSheetAppearanceColors(
                    primary: Color(0xFF6C63FF),
                  ),
                ),
                returnURL: 'faji://payment-complete',
              ),
            );

            // Step 3: Present payment sheet
            await Stripe.instance.presentPaymentSheet();

            // Step 4: Confirm payment with backend
            final paymentIntentId = paymentSheet.paymentIntentClientSecret.split('_secret_')[0];
            final confirmResult = await _repository.confirmPayment(
              orderId: paymentSheet.orderId,
              paymentIntentId: paymentIntentId,
            );

            return confirmResult.fold(
              (failure) {
                state = state.copyWith(
                  isLoading: false,
                  error: failure.message,
                );
                return false;
              },
              (confirmation) {
                state = state.copyWith(
                  isLoading: false,
                  confirmation: confirmation,
                );
                return true;
              },
            );
          } on StripeException catch (e) {
            // User cancelled or payment failed
            state = state.copyWith(
              isLoading: false,
              error: e.error.localizedMessage ?? 'Payment failed',
            );
            return false;
          }
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  /// Reset state
  void reset() {
    state = const PaymentState();
  }

  /// Purchase ticket using wallet balance
  Future<bool> processWalletPayment({
    required String eventId,
    required int quantity,
    String? promoCode,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final result = await _repository.purchaseWithWallet(
        eventId: eventId,
        quantity: quantity,
        promoCode: promoCode,
      );

      return result.fold(
        (failure) {
          state = state.copyWith(isLoading: false, error: failure.message);
          return false;
        },
        (_) {
          state = state.copyWith(isLoading: false);
          return true;
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }
}

/// Payment provider
final paymentProvider = StateNotifierProvider<PaymentNotifier, PaymentState>((ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  final stripeService = StripeService();
  return PaymentNotifier(repository, stripeService);
});
