import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/auth/auth_feature.dart';
import 'package:fajimobileapp/features/home/home_feature.dart';

/// Application router configuration
class AppRouter {
  /// Custom page transition builder with enhanced animations
  static Page<T> _buildPageWithTransition<T extends Object?>(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Enhanced slide and fade transition
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        // Scale animation for more dynamic feel
        var scaleAnimation = Tween<double>(
          begin: 0.95,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ));

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: ScaleTransition(
            scale: scaleAnimation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        );
      },
    );
  }

  static final GoRouter router = GoRouter(
    initialLocation: RouteManager.splash,
    routes: [
      // Splash screen
      GoRoute(
        path: RouteManager.splash,
        name: RouteManager.splashName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const SplashScreen(),
        ),
      ),
      
      // Intro screen
      GoRoute(
        path: RouteManager.intro,
        name: RouteManager.introName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const IntroScreen(),
        ),
      ),
      
      // Authentication routes - Direct routes matching RouteManager paths
      GoRoute(
        path: RouteManager.authEmail,
        name: RouteManager.authEmailName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const EmailScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.authPin,
        name: RouteManager.authPinName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const PinScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.authPhone,
        name: RouteManager.authPhoneName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const PhoneScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.authName,
        name: RouteManager.authNameName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const NameScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.authPassword,
        name: RouteManager.authPasswordName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const PasswordScreen(),
        ),
      ),
      
      // Home route
      GoRoute(
        path: RouteManager.home,
        name: RouteManager.homeName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const HomeScreen(),
        ),
      ),
    ],
  );
}