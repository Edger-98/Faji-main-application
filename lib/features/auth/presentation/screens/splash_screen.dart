import 'package:fajimobileapp/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';

/// Splash screen matching Figma design (node-id=1-286)
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
    _navigateToIntro();
  }

  void _setupAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));
  }

  void _startAnimations() {
    _fadeController.forward();
    _scaleController.forward();
  }

  Future<void> _navigateToIntro() async {
    await Future.delayed(const Duration(seconds: 2));
    
    if (!mounted) return;
    
    // Check if user has saved credentials
    final localDataSource = ref.read(authLocalDataSourceProvider);
    final userData = await localDataSource.getUserData();
    final hasUserData = userData['email'] != null && userData['email']!.isNotEmpty;
    
    if (hasUserData) {
      // User has logged in before, show welcome back screen
      if (mounted) {
        context.go(RouteManager.welcomeBack);
      }
    } else {
      // First time user, show intro
      if (mounted) {
        context.go(RouteManager.intro);
      }
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.fajiSplash),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: Listenable.merge([_fadeAnimation, _scaleAnimation]),
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    width: 100.w, // Responsive width
                    height: 100.h, // Responsive height
                    decoration: BoxDecoration(
                      color: context.colors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: AppText.labelLarge(
                        'FAJI',
                        color: context.colors.surface,
                      ),
                    ),
                  ),
                  // TODO: Replace with actual logo when assets are available
                  // child: SizedBox(
                  //   width: 100.18,
                  //   height: 140.43,
                  //   child: Stack(
                  //     children: [
                  //       // Main logo
                  //       Positioned(
                  //         left: 6.99,
                  //         top: 0,
                  //         child: Image.asset(
                  //           'assets/images/faji_logo.svg',
                  //           width: 93.19,
                  //           height: 140.43,
                  //           color: context.colors.primary,
                  //         ),
                  //       ),
                  //       // Logo dot
                  //       Positioned(
                  //         left: 0,
                  //         top: 121.29,
                  //         child: Image.asset(
                  //           'assets/images/faji_logo_dot.svg',
                  //           width: 13.8,
                  //           height: 13.8,
                  //           color: context.colors.primary,
                  //         ),
                  //       ),
                  //       // Logo accent
                  //       Positioned(
                  //         left: 31.14,
                  //         top: 93.66,
                  //         child: Image.asset(
                  //           'assets/images/faji_logo_accent.svg',
                  //           width: 22.22,
                  //           height: 16.42,
                  //           color: context.colors.primary,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}