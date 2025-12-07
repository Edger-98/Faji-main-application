import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_details_tabbed_screen.dart';

class EventCreationSuccessScreen extends StatelessWidget {
  final String eventId;
  final String eventName;

  const EventCreationSuccessScreen({
    super.key,
    required this.eventId,
    required this.eventName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Icon
              Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle,
                  size: 80.sp,
                  color: AppColors.success,
                ),
              ),
              
              SizedBox(height: 32.h),
              
              // Success Title
              Text(
                'Event Created!',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 16.h),
              
              // Event Name
              Text(
                '"$eventName"',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 12.h),
              
              // Success Message
              Text(
                'Your event has been created successfully!\nWhat would you like to do next?',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.onSurfaceVariant,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 48.h),
              
              // View Event Button
              GestureDetector(
                onTap: () {
                  // Navigate to event details
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => EventDetailsTabbedScreen(
                        eventId: eventId,
                        eventName: eventName,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(28.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'View Event',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 16.h),
              
              // Go Home Button
              GestureDetector(
                onTap: () {
                  // Navigate to home and clear all routes
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/home',
                    (route) => false,
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHighest.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  child: Center(
                    child: Text(
                      'Go Home',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
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
}
