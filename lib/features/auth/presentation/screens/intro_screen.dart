import 'package:fajimobileapp/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_widgets.dart';

/// Intro screen matching Figma design (node-id=1-313)
class IntroScreen extends ConsumerStatefulWidget {
  const IntroScreen({super.key});

  @override
  ConsumerState<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _fadeController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _slideController.forward();
        _fadeController.forward();
      }
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 
                         MediaQuery.of(context).padding.top - 
                         MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              children: [
                // Hero image section - EXACT Figma positioning
                Container(
                  width: double.infinity,
                  height: 375.h, // Responsive height
                  padding: EdgeInsets.symmetric(horizontal: 9.w), // Responsive padding
                  child: Center(
                    child: Container(
                      width: 375.w, // Responsive width
                      height: 375.h, // Responsive height
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colors.surfaceContainerHighest,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppImages.fajiVoyage,
                          width: 375.w,
                          height: 375.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Content section
                AnimatedBuilder(
                animation: Listenable.merge([_slideAnimation, _fadeAnimation]),
                builder: (context, child) {
                  return SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w), // EXACT Figma padding
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 55.h), // EXACT from Figma (532px - 477px = 55px)
                            
                            // Main heading - EXACT Figma styling with "tickets" in primary color
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: AppTypography.neueHaasDisplay,
                                    fontSize: 37.sp, // Responsive font size from Figma
                                    fontWeight: FontWeight.w600, // EXACT from Figma
                                    height: 1.2,
                                    letterSpacing: 0,
                                    color: context.colors.onSurface,
                                  ),
                                  children: [
                                    const TextSpan(text: 'Voyage through\nvirtual '),
                                    TextSpan(
                                      text: 'tickets',
                                      style: TextStyle(
                                        color: context.colors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            
                            SizedBox(height: 55.h), // EXACT from Figma (630px - 575px = 55px)
                            
                            // Description - EXACT Figma styling with proper font
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 37.w), // EXACT from Figma (61px - 24px = 37px)
                              child: Text(
                                'Register for events subscribe to calendars\nand manage events you\'re going to',
                                style: TextStyle(
                                  fontFamily: AppTypography.ppNeueMontreal,
                                  fontSize: 16.sp, // Responsive font size from Figma
                                  fontWeight: FontWeight.w100, // EXACT from Figma
                                  height: 1.2,
                                  letterSpacing: 0,
                                  color: context.colors.onSurfaceVariant,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            
                            SizedBox(height: 27.h), // EXACT from Figma
                            
                            // Get Started button - exact positioning
                            AuthButton(
                              text: 'Get Started',
                              width: 190.w, // Responsive width from Figma
                              height: 59.h, // Responsive height from Figma
                              onPressed: () => context.goNamed(RouteManager.authEmailName),
                            ),
                            
                            SizedBox(height: 11.h), // EXACT from Figma
                            
                            // Sign in link - exact positioning
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 64.w), // EXACT from Figma (88px - 24px = 64px)
                              child: TextButton(
                                onPressed: () {
                                  // Navigate to login screen
                                  context.goNamed(RouteManager.loginName);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(217.w, 19.h), // Responsive size
                                ),
                                child: Text(
                                  'Already have an account? Sign in',
                                  style: TextStyle(
                                    fontFamily: AppTypography.ppNeueMontreal,
                                    fontSize: 16.sp, // Responsive font size from Figma
                                    fontWeight: FontWeight.w100, // EXACT from Figma
                                    height: 1.2,
                                    letterSpacing: 0,
                                    color: context.colors.onSurfaceVariant,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}