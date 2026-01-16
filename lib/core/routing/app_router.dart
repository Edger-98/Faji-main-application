import 'package:fajimobileapp/features/profile/presentation/screens/profile_screen.dart';
import 'package:fajimobileapp/features/profile/presentation/screens/account_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/core/routing/auth_guard.dart';
import 'package:fajimobileapp/features/auth/auth_feature.dart';
import 'package:fajimobileapp/features/auth/presentation/screens/welcome_back_screen.dart';
import 'package:fajimobileapp/features/onboarding/presentation/screens/onboarding_screens.dart';
import 'package:fajimobileapp/features/home/home_feature.dart';
import 'package:fajimobileapp/features/dashboard/presentation/screens/main_dashboard_screen.dart';
import 'package:fajimobileapp/features/event_details/event_details_feature.dart';
import 'package:fajimobileapp/features/home/presentation/screens/search_screen.dart';
import 'package:fajimobileapp/features/events/presentation/screens/events_list_screen.dart';
import 'package:fajimobileapp/features/events/presentation/screens/event_details_screen.dart' as events;
import 'package:fajimobileapp/features/events/presentation/screens/search_screen.dart' as events_search;
import 'package:fajimobileapp/features/events/presentation/screens/my_events_screen.dart';
import 'package:fajimobileapp/features/events/presentation/screens/favorites_screen.dart' as events_favorites;
import 'package:fajimobileapp/features/tickets/tickets.dart';
import 'package:fajimobileapp/features/organize_event/organize_event.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_creation_flow_screen.dart';
import 'package:fajimobileapp/features/cohost_marketplace/presentation/screens/resource_categories_screen.dart';
import 'package:fajimobileapp/features/cohost_marketplace/presentation/screens/cohost_list_screen.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/resource_category.dart';
import 'package:fajimobileapp/features/chat/chat.dart';
import 'package:fajimobileapp/features/profile/profile.dart';
import 'package:fajimobileapp/features/support/support.dart';
import 'package:fajimobileapp/features/terms/terms.dart';
import 'package:fajimobileapp/features/notifications/presentation/screens/notification_settings_screen.dart';
import 'package:fajimobileapp/features/wallet/wallet.dart';
import 'package:fajimobileapp/features/vendor/presentation/screens/vendor_registration_screen.dart';
import 'package:fajimobileapp/features/vendor/presentation/screens/vendor_resources_list_screen.dart';
import 'package:fajimobileapp/features/vendor/presentation/screens/vendor_add_resource_screen_v2.dart';
import 'package:fajimobileapp/features/vendor/presentation/screens/vendor_bookings_list_screen.dart';
import 'package:fajimobileapp/features/vendor/presentation/screens/vendor_dashboard_screen.dart';

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
    redirect: AuthGuard.redirect,
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
      
      // Onboarding screen
      GoRoute(
        path: RouteManager.onboarding,
        name: RouteManager.onboardingName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const OnboardingScreen(),
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
      
      // Welcome back route
      GoRoute(
        path: RouteManager.welcomeBack,
        name: RouteManager.welcomeBackName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const WelcomeBackScreen(),
        ),
      ),
      
      // Home route (legacy - redirects to dashboard)
      GoRoute(
        path: RouteManager.home,
        name: RouteManager.homeName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const MainDashboardScreen(),
        ),
      ),
      
      // Main Dashboard route (new 5-tab navigation)
      GoRoute(
        path: RouteManager.dashboard,
        name: RouteManager.dashboardName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const MainDashboardScreen(),
        ),
      ),
      
      // Events List route
      GoRoute(
        path: RouteManager.eventsList,
        name: RouteManager.eventsListName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const EventsListScreen(),
        ),
      ),
      
      // Event Details with ID parameter
      GoRoute(
        path: '${RouteManager.eventDetails}/:id',
        name: RouteManager.eventDetailsName,
        pageBuilder: (context, state) {
          final eventId = state.pathParameters['id'] ?? '';
          return _buildPageWithTransition(
            context,
            state,
            events.EventDetailsScreen(eventId: eventId),
          );
        },
      ),
      
      // Search Events route
      GoRoute(
        path: RouteManager.searchEvents,
        name: RouteManager.searchEventsName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const events_search.SearchScreen(),
        ),
      ),
      
      // My Events route
      GoRoute(
        path: RouteManager.myEvents,
        name: RouteManager.myEventsName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const MyEventsScreen(),
        ),
      ),
      
      // Legacy Event Details routes (keeping for backward compatibility with old feature)
      GoRoute(
        path: RouteManager.legacyEventDetails,
        name: RouteManager.legacyEventDetailsName,
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
      
      // Organize Event route (legacy)
      GoRoute(
        path: RouteManager.organizeEvent,
        name: RouteManager.organizeEventName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const OrganizeEventScreen(),
        ),
      ),
      
      // Event Creation Flow route (new multi-step flow)
      GoRoute(
        path: RouteManager.eventCreationFlow,
        name: RouteManager.eventCreationFlowName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const EventCreationFlowScreen(),
        ),
      ),
      
      // Resource Categories route (Co-host marketplace)
      GoRoute(
        path: RouteManager.resourceCategories,
        name: RouteManager.resourceCategoriesName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const ResourceCategoriesScreen(),
        ),
      ),
      
      // Co-host List route
      GoRoute(
        path: RouteManager.cohostList,
        name: RouteManager.cohostListName,
        pageBuilder: (context, state) {
          final category = state.extra as ResourceCategory;
          return _buildPageWithTransition(
            context,
            state,
            CohostListScreen(category: category),
          );
        },
      ),
      
      // Favorites route - DISABLED (feature removed)
      // GoRoute(
      //   path: RouteManager.favorites,
      //   name: RouteManager.favoritesName,
      //   pageBuilder: (context, state) => _buildPageWithTransition(
      //     context,
      //     state,
      //     const events_favorites.FavoritesScreen(),
      //   ),
      // ),
      
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
      
      // Account Settings route
      GoRoute(
        path: RouteManager.accountSettings,
        name: RouteManager.accountSettingsName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const AccountSettingsScreen(),
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
      
      // Notification Settings route
      GoRoute(
        path: RouteManager.notificationSettings,
        name: RouteManager.notificationSettingsName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const NotificationSettingsScreen(),
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

      // Vendor routes
      GoRoute(
        path: RouteManager.vendorRegistration,
        name: RouteManager.vendorRegistrationName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const VendorRegistrationScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.vendorResourcesList,
        name: RouteManager.vendorResourcesListName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const VendorResourcesListScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.vendorAddResource,
        name: RouteManager.vendorAddResourceName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const VendorAddResourceScreenV2(),
        ),
      ),
      GoRoute(
        path: RouteManager.vendorBookingsList,
        name: RouteManager.vendorBookingsListName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const VendorBookingsListScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.vendorDashboardScreen,
        name: RouteManager.vendorDashboardScreenName,
        pageBuilder: (context, state) => _buildPageWithTransition(
          context,
          state,
          const VendorDashboardScreen(),
        ),
      ),
    ],
  );
}