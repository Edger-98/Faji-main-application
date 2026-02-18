import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Onboarding screen for first-time users
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const String _onboardingCompleteKey = 'onboarding_complete';

  final List<OnboardingPage> _pages = <OnboardingPage>[
    OnboardingPage(
      emoji: '🎉',
      title: 'Create Amazing Events',
      description: 'Host parties, weddings, corporate events, and more. Manage everything in one place.',
    ),
    OnboardingPage(
      emoji: '🎫',
      title: 'Sell Tickets Easily',
      description: 'Create ticket tiers, set prices, and sell tickets directly through the app.',
    ),
    OnboardingPage(
      emoji: '🤝',
      title: 'Find Trusted Vendors',
      description: 'Connect with verified DJs, photographers, caterers, and other service providers.',
    ),
    OnboardingPage(
      emoji: '💰',
      title: 'Get Paid Securely',
      description: 'Track earnings, manage payouts, and handle all payments safely through our platform.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingCompleteKey, true);
    
    if (mounted) {
      context.go(RouteManager.intro);
    }
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_currentPage < _pages.length - 1)
                    TextButton(
                      onPressed: _skipOnboarding,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Page view
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index]);
                },
              ),
            ),

            // Page indicators
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => _buildIndicator(index == _currentPage),
                ),
              ),
            ),

            // Next/Get Started button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: GestureDetector(
                onTap: _nextPage,
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  child: Center(
                    child: Text(
                      _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.background,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  Widget _buildPage(OnboardingPage page) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Emoji icon
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                page.emoji,
                style: TextStyle(fontSize: 64.sp),
              ),
            ),
          ),
          SizedBox(height: 48.h),

          // Title
          Text(
            page.title,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),

          // Description
          Text(
            page.description,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.onSurfaceVariant,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

  Widget _buildIndicator(bool isActive) => AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: isActive ? 24.w : 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.onSurfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
}

class OnboardingPage {

  OnboardingPage({
    required this.emoji,
    required this.title,
    required this.description,
  });
  final String emoji;
  final String title;
  final String description;
}
