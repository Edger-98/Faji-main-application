import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import '../../../../core/design_system/design_system.dart';

/// Bottom sheet for rating the app
class RateAppBottomSheet extends StatefulWidget {
  const RateAppBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const RateAppBottomSheet(),
    );
  }

  @override
  State<RateAppBottomSheet> createState() => _RateAppBottomSheetState();
}

class _RateAppBottomSheetState extends State<RateAppBottomSheet> {
  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  Future<void> _submitRating() async {
    if (_rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select a rating'),
          backgroundColor: context.colors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);
    HapticFeedback.mediumImpact();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;

      // Close bottom sheet
      Navigator.pop(context);

      // If rating is 4 or 5, prompt for app store review
      if (_rating >= 4) {
        final InAppReview inAppReview = InAppReview.instance;
        if (await inAppReview.isAvailable()) {
          await inAppReview.requestReview();
        }
      }

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Thank you for your feedback!'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit rating: $e'),
            backgroundColor: context.colors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            24.w,
            16.h,
            24.w,
            MediaQuery.of(context).viewInsets.bottom + 24.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: context.colors.onSurfaceVariant.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),

              SizedBox(height: 24.h),

              // Header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Rate Faji',
                      style: AppTypography.headlineMedium.copyWith(
                        color: context.colors.onSurface,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8.h),

              Text(
                'How would you rate your experience with Faji?',
                style: AppTypography.bodyMedium.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),

              SizedBox(height: 32.h),

              // Star rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final starNumber = index + 1;
                  final isSelected = starNumber <= _rating;

                  return GestureDetector(
                    onTap: () {
                      setState(() => _rating = starNumber);
                      HapticFeedback.lightImpact();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Icon(
                        isSelected ? Icons.star_rounded : Icons.star_outline_rounded,
                        size: 48.sp,
                        color: isSelected
                            ? AppColors.warning
                            : context.colors.onSurfaceVariant.withOpacity(0.3),
                      ),
                    ),
                  );
                }),
              ),

              if (_rating > 0) ...[
                SizedBox(height: 16.h),
                Text(
                  _getRatingText(_rating),
                  style: AppTypography.titleMedium.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],

              SizedBox(height: 32.h),

              // Review text field
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: context.colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: TextField(
                  controller: _reviewController,
                  maxLines: 4,
                  maxLength: 500,
                  decoration: InputDecoration(
                    hintText: 'Tell us more about your experience (optional)',
                    hintStyle: AppTypography.bodyMedium.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: AppTypography.bodyMedium.copyWith(
                    color: context.colors.onSurface,
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitRating,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isSubmitting
                        ? context.colors.primary.withOpacity(0.5)
                        : context.colors.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: _isSubmitting
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              'Submitting...',
                              style: AppTypography.titleMedium.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          'Submit Rating',
                          style: AppTypography.titleMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getRatingText(int rating) {
    switch (rating) {
      case 1:
        return 'Poor';
      case 2:
        return 'Fair';
      case 3:
        return 'Good';
      case 4:
        return 'Very Good';
      case 5:
        return 'Excellent!';
      default:
        return '';
    }
  }
}
