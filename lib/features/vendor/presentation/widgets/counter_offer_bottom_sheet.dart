import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Bottom sheet for vendor to counter offer or decline booking
/// Keyboard-friendly design that doesn't disturb input
class CounterOfferBottomSheet extends StatefulWidget {

  const CounterOfferBottomSheet({
    super.key,
    required this.bookingId,
    required this.currentAmount,
    this.onAccept,
    this.onCounterOffer,
    this.onDecline,
  });
  final String bookingId;
  final String currentAmount;
  final VoidCallback? onAccept;
  final Function(String amount, String message)? onCounterOffer;
  final Function(String reason)? onDecline;

  @override
  State<CounterOfferBottomSheet> createState() => _CounterOfferBottomSheetState();
}

class _CounterOfferBottomSheetState extends State<CounterOfferBottomSheet> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _declineReasonController = TextEditingController();
  
  String _selectedAction = 'accept'; // accept, counter, decline

  @override
  void dispose() {
    _amountController.dispose();
    _messageController.dispose();
    _declineReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          SizedBox(height: 20.h),

          // Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Booking Request',
              style: AppTypography.titleLarge.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Action tabs
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                Expanded(
                  child: _buildActionTab(
                    label: 'Accept',
                    icon: Icons.check_circle_rounded,
                    value: 'accept',
                    color: AppColors.successGreen,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildActionTab(
                    label: 'Counter',
                    icon: Icons.swap_horiz_rounded,
                    value: 'counter',
                    color: context.colors.primary,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildActionTab(
                    label: 'Decline',
                    icon: Icons.cancel_rounded,
                    value: 'decline',
                    color: AppColors.liveRed,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // Content based on selected action
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: _buildActionContent(),
            ),
          ),

          // Action button
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _handleAction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _getActionColor(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                  child: Text(
                    _getActionButtonText(),
                    style: AppTypography.labelLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  Widget _buildActionTab({
    required String label,
    required IconData icon,
    required String value,
    required Color color,
  }) {
    final bool isSelected = _selectedAction == value;

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() => _selectedAction = value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.15)
              : context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? color : context.colors.onSurfaceVariant,
              size: 24.sp,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: isSelected ? color : context.colors.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionContent() {
    switch (_selectedAction) {
      case 'accept':
        return _buildAcceptContent();
      case 'counter':
        return _buildCounterContent();
      case 'decline':
        return _buildDeclineContent();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildAcceptContent() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.successGreen.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.successGreen.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: AppColors.successGreen,
                size: 20.sp,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'You will receive ${widget.currentAmount} after the event is completed.',
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'By accepting, you agree to provide your service for the requested amount.',
          style: AppTypography.bodySmall.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
      ],
    );

  Widget _buildCounterContent() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Counter Offer Amount',
          style: AppTypography.titleSmall.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter your counter offer',
            prefixText: '\$ ',
            filled: true,
            fillColor: context.colors.surfaceContainerHighest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: context.colors.primary,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'Message (Optional)',
          style: AppTypography.titleSmall.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        TextField(
          controller: _messageController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Explain your counter offer...',
            filled: true,
            fillColor: context.colors.surfaceContainerHighest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: context.colors.primary,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: context.colors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.lightbulb_outline_rounded,
                color: context.colors.primary,
                size: 16.sp,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'The host will review your counter offer',
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurface,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

  Widget _buildDeclineContent() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reason for Declining',
          style: AppTypography.titleSmall.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        TextField(
          controller: _declineReasonController,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Let the host know why you\'re declining...',
            filled: true,
            fillColor: context.colors.surfaceContainerHighest,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppColors.liveRed,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: AppColors.liveRed.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: AppColors.liveRed,
                size: 16.sp,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'This action cannot be undone',
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurface,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

  Color _getActionColor() {
    switch (_selectedAction) {
      case 'accept':
        return AppColors.successGreen;
      case 'counter':
        return context.colors.primary;
      case 'decline':
        return AppColors.liveRed;
      default:
        return context.colors.primary;
    }
  }

  String _getActionButtonText() {
    switch (_selectedAction) {
      case 'accept':
        return 'Accept Booking';
      case 'counter':
        return 'Send Counter Offer';
      case 'decline':
        return 'Decline Booking';
      default:
        return 'Confirm';
    }
  }

  void _handleAction() {
    HapticFeedback.mediumImpact();

    switch (_selectedAction) {
      case 'accept':
        widget.onAccept?.call();
        Navigator.pop(context, <String, String>{'action': 'accept'});
      case 'counter':
        if (_amountController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Please enter a counter offer amount'),
              backgroundColor: context.colors.surfaceContainerHighest,
            ),
          );
          return;
        }
        widget.onCounterOffer?.call(
          _amountController.text,
          _messageController.text,
        );
        Navigator.pop(context, <String, String>{
          'action': 'counter',
          'amount': _amountController.text,
          'message': _messageController.text,
        });
      case 'decline':
        if (_declineReasonController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Please provide a reason for declining'),
              backgroundColor: context.colors.surfaceContainerHighest,
            ),
          );
          return;
        }
        widget.onDecline?.call(_declineReasonController.text);
        Navigator.pop(context, <String, String>{
          'action': 'decline',
          'reason': _declineReasonController.text,
        });
    }
  }
}

/// Helper function to show the counter offer bottom sheet
Future<Map<String, dynamic>?> showCounterOfferBottomSheet({
  required BuildContext context,
  required String bookingId,
  required String currentAmount,
  VoidCallback? onAccept,
  Function(String amount, String message)? onCounterOffer,
  Function(String reason)? onDecline,
}) => showModalBottomSheet<Map<String, dynamic>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: CounterOfferBottomSheet(
        bookingId: bookingId,
        currentAmount: currentAmount,
        onAccept: onAccept,
        onCounterOffer: onCounterOffer,
        onDecline: onDecline,
      ),
    ),
  );
