import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/services/toast_service.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/payment_provider.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.event,
  });

  final EventEntity event;

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  int _quantity = 1;
  String _paymentMethod = 'stripe'; // 'stripe' or 'wallet'
  final TextEditingController _promoController = TextEditingController();

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  double get _total => widget.event.price * _quantity;

  Future<void> _handlePayment() async {
    final promoCode = _promoController.text.trim().isEmpty ? null : _promoController.text.trim();

    bool success;
    if (_paymentMethod == 'wallet') {
      success = await ref.read(paymentProvider.notifier).processWalletPayment(
            eventId: widget.event.id,
            quantity: _quantity,
            promoCode: promoCode,
          );
    } else {
      success = await ref.read(paymentProvider.notifier).processPayment(
            eventId: widget.event.id,
            quantity: _quantity,
            promoCode: promoCode,
          );
    }

    if (!mounted) return;

    if (success) {
      final confirmation = ref.read(paymentProvider).confirmation;
      
      ToastService.showSuccess(
        context: context,
        message: 'Payment successful! ${confirmation?.tickets.length ?? _quantity} ticket(s) purchased',
      );

      // Navigate to tickets screen
      context.go(RouteManager.myTickets);
    } else {
      final error = ref.read(paymentProvider).error;
      ToastService.showError(
        context: context,
        message: error ?? 'Payment failed. Please try again.',
      );
    }
  }

  Widget _buildPaymentOption(
    BuildContext context, {
    required String value,
    required IconData icon,
    required String label,
    required String subtitle,
  }) {
    final isSelected = _paymentMethod == value;
    return InkWell(
      onTap: () => setState(() => _paymentMethod = value),
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? context.colors.primary : context.colors.onSurfaceVariant),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bodyLarge(label),
                  AppText.bodySmall(subtitle, color: context.colors.onSurfaceVariant),
                ],
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: _paymentMethod,
              onChanged: (v) => setState(() => _paymentMethod = v!),
              activeColor: context.colors.primary,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(paymentProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        title: AppText.titleLarge('Checkout'),
        backgroundColor: context.colors.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Info Card
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      widget.event.imageUrl,
                      width: 80.w,
                      height: 80.w,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 80.w,
                        height: 80.w,
                        color: context.colors.surfaceContainerHighest,
                        child: Icon(
                          Icons.image_not_supported,
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.titleMedium(
                          widget.event.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        AppText.bodySmall(
                          widget.event.location,
                          color: context.colors.onSurfaceVariant,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        AppText.bodyMedium(
                          '\$${widget.event.price.toStringAsFixed(2)} per ticket',
                          color: context.colors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Quantity Selector
            AppText.titleMedium('Quantity'),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.bodyLarge('Number of tickets'),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: _quantity > 1 ? context.colors.primary : context.colors.onSurfaceVariant,
                        ),
                        onPressed: _quantity > 1
                            ? () => setState(() => _quantity--)
                            : null,
                      ),
                      SizedBox(
                        width: 40.w,
                        child: AppText.titleLarge(
                          '$_quantity',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: _quantity < 10 ? context.colors.primary : context.colors.onSurfaceVariant,
                        ),
                        onPressed: _quantity < 10
                            ? () => setState(() => _quantity++)
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Promo Code
            AppText.titleMedium('Promo Code (Optional)'),
            SizedBox(height: 12.h),
            TextField(
              controller: _promoController,
              decoration: InputDecoration(
                hintText: 'Enter promo code',
                filled: true,
                fillColor: context.colors.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Icon(
                  Icons.local_offer,
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ),

            SizedBox(height: 32.h),

            // Price Summary
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.bodyLarge('Subtotal'),
                      AppText.bodyLarge('\$${_total.toStringAsFixed(2)}'),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.bodyLarge('Service Fee'),
                      AppText.bodyLarge('\$0.00'),
                    ],
                  ),
                  Divider(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.titleLarge('Total'),
                      AppText.titleLarge(
                        '\$${_total.toStringAsFixed(2)}',
                        color: context.colors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            // Payment Method Selector
            AppText.titleMedium('Payment Method'),
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  _buildPaymentOption(
                    context,
                    value: 'stripe',
                    icon: Icons.credit_card,
                    label: 'Credit / Debit Card',
                    subtitle: 'Pay securely with Stripe',
                  ),
                  Divider(height: 1, indent: 16.w, endIndent: 16.w),
                  _buildPaymentOption(
                    context,
                    value: 'wallet',
                    icon: Icons.account_balance_wallet_outlined,
                    label: 'Wallet',
                    subtitle: 'Pay using your wallet balance',
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            // Payment Button
            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                onPressed: paymentState.isLoading ? null : _handlePayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.primary,
                  foregroundColor: context.colors.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: paymentState.isLoading
                    ? SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: CircularProgressIndicator(
                          color: context.colors.onPrimary,
                          strokeWidth: 2,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _paymentMethod == 'wallet'
                                ? Icons.account_balance_wallet_outlined
                                : Icons.payment,
                            size: 20.sp,
                          ),
                          SizedBox(width: 8.w),
                          AppText.titleMedium(
                            _paymentMethod == 'wallet' ? 'Pay with Wallet' : 'Pay with Card',
                            color: context.colors.onPrimary,
                          ),
                        ],
                      ),
              ),
            ),

            SizedBox(height: 16.h),

            // Secure Payment Info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 16.sp,
                  color: context.colors.onSurfaceVariant,
                ),
                SizedBox(width: 4.w),
                AppText.bodySmall(
                  'Secure payment powered by Stripe',
                  color: context.colors.onSurfaceVariant,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
