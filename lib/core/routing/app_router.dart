import 'package:fajimobileapp/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/auth/auth_feature.dart';
import 'package:fajimobileapp/features/home/home_feature.dart';
import 'package:fajimobileapp/features/event_details/event_details_feature.dart';
import 'package:fajimobileapp/features/home/presentation/screens/search_screen.dart';
import 'package:fajimobileapp/features/tickets/tickets.dart';
import 'package:fajimobileapp/features/organize_event/organize_event.dart';
import 'package:fajimobileapp/features/favorites/favorites.dart';
import 'package:fajimobileapp/features/chat/chat.dart';
import 'package:fajimobileapp/features/profile/profile.dart';
import 'package:fajimobileapp/features/support/support.dart';
import 'package:fajimobileapp/features/terms/terms.dart';
import 'package:fajimobileapp/features/wallet/wallet.dart';

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
          const PinScreen(), // Using proper PIN screen with visual lines
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
      
      // Login route
      GoRoute(
        path: RouteManager.login,
        name: RouteManager.loginName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const LoginScreen(),
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
      
      // Event Details routes
      GoRoute(
        path: RouteManager.eventDetails,
        name: RouteManager.eventDetailsName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const EventDetailsScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.ticketInformation,
        name: RouteManager.ticketInformationName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const TicketInformationScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.eventDirection,
        name: RouteManager.eventDirectionName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const EventDirectionScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.buyTicket,
        name: RouteManager.buyTicketName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const BuyTicketScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.makePayment,
        name: RouteManager.makePaymentName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const MakePaymentScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.paymentSuccessful,
        name: RouteManager.paymentSuccessfulName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const PaymentSuccessfulScreen(),
        ),
      ),
      
      // Search route
      GoRoute(
        path: RouteManager.search,
        name: RouteManager.searchName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const SearchScreen(),
        ),
      ),
      
      // My Tickets route
      GoRoute(
        path: RouteManager.myTickets,
        name: RouteManager.myTicketsName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const MyTicketsScreen(),
        ),
      ),
      
      // Organize Event route
      GoRoute(
        path: RouteManager.organizeEvent,
        name: RouteManager.organizeEventName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const OrganizeEventScreen(),
        ),
      ),
      
      // Favorites route
      GoRoute(
        path: RouteManager.favorites,
        name: RouteManager.favoritesName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const FavoritesScreen(),
        ),
      ),
      
      // Chat routes
      GoRoute(
        path: RouteManager.chatList,
        name: RouteManager.chatListName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const ChatListScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.chatDetail,
        name: RouteManager.chatDetailName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const ChatDetailScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.organizerChat,
        name: RouteManager.organizerChatName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const OrganizerChatScreen(),
        ),
      ),
      
      // Profile route
      GoRoute(
        path: RouteManager.profile,
        name: RouteManager.profileName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const ProfileScreen(),
        ),
      ),
      
      // Support route
      GoRoute(
        path: RouteManager.support,
        name: RouteManager.supportName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const SupportScreen(),
        ),
      ),
      
      // Terms route
      GoRoute(
        path: RouteManager.terms,
        name: RouteManager.termsName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const TermsScreen(),
        ),
      ),
      
      // Wallet routes
      GoRoute(
        path: RouteManager.walletBalance,
        name: RouteManager.walletBalanceName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const BalanceDetailScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.walletEnterAmount,
        name: RouteManager.walletEnterAmountName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const EnterWithdrawalAmountScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.walletReview,
        name: RouteManager.walletReviewName,
        pageBuilder: (context, state) {
          final amount = state.extra as String? ?? '0.00';
          return _buildPageWithTransition(
            context,
            state,
            ReviewWithdrawalScreen(amount: amount),
          );
        },
      ),
      GoRoute(
        path: RouteManager.walletConfirmation,
        name: RouteManager.walletConfirmationName,
        pageBuilder: (context, state) {
          final amount = state.extra as String? ?? '0.00';
          return _buildPageWithTransition(
            context,
            state,
            WithdrawalConfirmationScreen(amount: amount),
          );
        },
      ),
      GoRoute(
        path: RouteManager.walletHistory,
        name: RouteManager.walletHistoryName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const TransactionHistoryScreen(),
        ),
      ),
    ],
  );
}