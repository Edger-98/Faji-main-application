import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/wallet/data/services/stripe_connect_service.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/stripe_connect_status.dart';

/// Fetches Stripe Connect account status. Invalidate after onboarding completes.
final FutureProvider<StripeConnectStatus?> stripeConnectStatusProvider =
    FutureProvider<StripeConnectStatus?>((FutureProviderRef<StripeConnectStatus?> ref) async {
  try {
    return await ref.read(stripeConnectServiceProvider).getStatus();
  } catch (e) {
    return null;
  }
});

/// Fetches recent Stripe transfers.
final FutureProvider<List<StripeTransfer>> stripeTransfersProvider =
    FutureProvider<List<StripeTransfer>>((FutureProviderRef<List<StripeTransfer>> ref) async {
  try {
    return await ref.read(stripeConnectServiceProvider).getTransfers();
  } catch (e) {
    return [];
  }
});
