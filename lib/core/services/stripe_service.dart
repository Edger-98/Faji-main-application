import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StripeService {
  static Future<void> initialize() async {
    try {
      print('🔧 Initializing Stripe...');
      
      // Get publishable key from environment
      final publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'];
      
      print('🔧 Stripe key from env: ${publishableKey?.substring(0, 20) ?? "NOT FOUND"}...');
      
      if (publishableKey == null || publishableKey.isEmpty) {
        print('⚠️ WARNING: Stripe publishable key not found in .env file');
        print('⚠️ Stripe payments will not work until key is configured');
        return;
      }

      // Check if it's a placeholder
      if (publishableKey.contains('your_publishable_key_here')) {
        print('⚠️ WARNING: Stripe publishable key is a placeholder');
        print('⚠️ Please update .env file with actual Stripe key');
        return;
      }

      // Initialize Stripe
      Stripe.publishableKey = publishableKey;
      
      print('✅ Stripe publishable key set: ${publishableKey.substring(0, 20)}...');
      
      // Optional: Set merchant identifier for Apple Pay
      final merchantIdentifier = dotenv.env['STRIPE_MERCHANT_IDENTIFIER'];
      if (merchantIdentifier != null && merchantIdentifier.isNotEmpty) {
        Stripe.merchantIdentifier = merchantIdentifier;
        print('✅ Stripe merchant identifier set');
      }

      print('✅ Stripe initialized successfully');
    } catch (e, stackTrace) {
      print('❌ Failed to initialize Stripe: $e');
      print('❌ Stack trace: $stackTrace');
    }
  }

  /// Create payment intent on backend and process payment
  Future<Map<String, dynamic>?> processPayment({
    required double amount,
    required String currency,
    required String description,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      // TODO: Call your backend to create payment intent
      // The backend should return clientSecret
      
      // For now, return null - implement when backend endpoint is ready
      print('💳 Processing payment: $amount $currency');
      print('   Description: $description');
      print('   Metadata: $metadata');
      
      return null;
    } catch (e) {
      print('❌ Payment processing failed: $e');
      rethrow;
    }
  }

  /// Present payment sheet
  Future<bool> presentPaymentSheet({
    required String clientSecret,
    String? customerId,
    String? ephemeralKey,
  }) async {
    try {
      print('💳 ========== STRIPE PAYMENT SHEET ==========');
      print('💳 Client Secret: ${clientSecret.substring(0, 20)}...');
      print('💳 Customer ID: $customerId');
      print('💳 Ephemeral Key: ${ephemeralKey != null ? "Present" : "None"}');
      print('💳 Stripe Publishable Key: ${Stripe.publishableKey != null ? Stripe.publishableKey!.substring(0, 20) : "NOT SET"}...');
      
      if (Stripe.publishableKey == null || Stripe.publishableKey.isEmpty) {
        print('❌ Stripe publishable key is not set!');
        throw Exception('Stripe is not initialized. Please check your .env file.');
      }
      
      print('💳 Initializing payment sheet...');
      
      // Initialize payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Faji',
          customerId: customerId,
          customerEphemeralKeySecret: ephemeralKey,
          style: ThemeMode.dark,
          appearance: const PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: Color(0xFF6C63FF),
            ),
          ),
        ),
      );

      print('💳 Payment sheet initialized successfully');
      print('💳 Presenting payment sheet to user...');
      
      // Present payment sheet
      await Stripe.instance.presentPaymentSheet();
      
      print('✅ Payment completed successfully!');
      print('💳 ========================================');
      return true;
    } on StripeException catch (e) {
      print('❌ Stripe Exception:');
      print('   Code: ${e.error.code}');
      print('   Message: ${e.error.localizedMessage}');
      print('   Decline Code: ${e.error.declineCode}');
      print('   Type: ${e.error.type}');
      print('💳 ========================================');
      
      // User cancelled
      if (e.error.code == FailureCode.Canceled) {
        return false;
      }
      
      rethrow;
    } catch (e, stackTrace) {
      print('❌ Payment sheet error: $e');
      print('❌ Stack trace: $stackTrace');
      print('💳 ========================================');
      rethrow;
    }
  }

  /// Confirm payment
  Future<bool> confirmPayment({
    required String clientSecret,
    Map<String, dynamic>? paymentMethodData,
  }) async {
    try {
      await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: clientSecret,
      );
      
      print('✅ Payment confirmed');
      return true;
    } on StripeException catch (e) {
      print('❌ Payment confirmation failed: ${e.error.localizedMessage}');
      return false;
    } catch (e) {
      print('❌ Payment confirmation error: $e');
      return false;
    }
  }
}
