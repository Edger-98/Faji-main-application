import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/core/models/event_model.dart';

class EventCreationSuccessScreen extends StatefulWidget {

  const EventCreationSuccessScreen({
    super.key,
    required this.createdEvent,
  });
  final EventModel createdEvent;

  @override
  State<EventCreationSuccessScreen> createState() => _EventCreationSuccessScreenState();
}

class _EventCreationSuccessScreenState extends State<EventCreationSuccessScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _fadeController;
  late AnimationController _slideController;
  
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controllers
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Create animations
    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    // Start animations with delays
    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _scaleController.forward();
    
    await Future.delayed(const Duration(milliseconds: 400));
    _fadeController.forward();
    
    await Future.delayed(const Duration(milliseconds: 200));
    _slideController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _goToDashboard() {
    context.go(RouteManager.dashboard);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Success Icon
              ScaleTransition(
                scale: _scaleAnimation,
                child: Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.15),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.success.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: 90.sp,
                    color: AppColors.success,
                  ),
                ),
              ),
              
              SizedBox(height: 40.h),
              
              // Animated Success Title
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  'Event Created Successfully!',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              SizedBox(height: 16.h),
              
              // Animated Event Name
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    '"${widget.createdEvent.name}"',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              
              SizedBox(height: 24.h),
              
              // Animated Success Message
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  'Your event is now live and ready to share!\nWhat would you like to do next?',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.onSurfaceVariant,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              SizedBox(height: 60.h),
              
              // Animated Action Buttons
              SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    // Go to Dashboard Button (Primary)
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: _goToDashboard,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.onPrimary,
                          elevation: 2,
                          shadowColor: AppColors.primary.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.dashboard_rounded,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Go to Dashboard',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 40.h),
              
              // Additional Info
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 20.sp,
                        color: AppColors.onSurfaceVariant,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          'You can view and manage your event from the dashboard.',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.onSurfaceVariant,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
}