import 'package:fajimobileapp/features/profile/presentation/screens/profile_screen.dart';
import 'package:fajimobileapp/features/profile/presentation/screens/account_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/core/routing/auth_guard.dart';
import 'package:fajimobileapp/features/auth/auth_feature.dart';
import 'package:fajimobileapp/features/auth/presentation/screens/welcome_back_screen.dart';
import 'package:fajimobileapp/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:fajimobileapp/features/auth/presentation/screens/forgot_password_otp_screen.dart';
import 'package:fajimobileapp/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:fajimobileapp/features/onboarding/presentation/screens/onboarding_screens.dart';
import 'package:fajimobileapp/features/home/home_feature.dart';
import 'package:fajimobileapp/features/dashboard/presentation/screens/main_dashboard_screen.dart';
import 'package:fajimobileapp/core/models/event_model.dart';
import 'package:fajimobileapp/features/event_details/event_details_feature.dart';
import 'package:fajimobileapp/features/home/presentation/screens/search_screen.dart';
import 'package:fajimobileapp/features/events/presentation/screens/events_list_screen.dart';
import 'package:fajimobileapp/features/events/presentation/screens/event_details_screen.dart' as events;
import 'package:fajimobileapp/features/events/presentation/screens/search_screen.dart' as events_search;
import 'package:fajimobileapp/features/events/presentation/screens/my_events_screen.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/tickets/tickets.dart';
import 'package:fajimobileapp/features/tickets/presentation/screens/checkout_screen.dart';
import 'package:fajimobileapp/features/tickets/presentation/screens/ticket_details_screen.dart';
import 'package:fajimobileapp/features/tickets/presentation/screens/my_tickets_screen_v2.dart';
import 'package:fajimobileapp/features/organize_event/organize_event.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_creation_flow_screen.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_creation_success_screen.dart';
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
  ) => CustomTransitionPage<T>(
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

  static final GoRouter router = GoRouter(
    initialLocation: RouteManager.splash,
    redirect: AuthGuard.redirect,
    routes: <RouteBase>[
      // Splash screen
      GoRoute(
        path: RouteManager.splash,
        name: RouteManager.splashName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const SplashScreen(),
        ),
      ),
      
      // Onboarding screen
      GoRoute(
        path: RouteManager.onboarding,
        name: RouteManager.onboardingName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const OnboardingScreen(),
        ),
      ),
      
      // Intro screen
      GoRoute(
        path: RouteManager.intro,
        name: RouteManager.introName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const IntroScreen(),
        ),
      ),
      
      // Authentication routes - Direct routes matching RouteManager paths
      GoRoute(
        path: RouteManager.authEmail,
        name: RouteManager.authEmailName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const EmailScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.authPin,
        name: RouteManager.authPinName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const PinScreen(), // Using proper PIN screen with visual lines
        ),
      ),
      GoRoute(
        path: RouteManager.authPhone,
        name: RouteManager.authPhoneName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const PhoneScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.authName,
        name: RouteManager.authNameName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const NameScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.authPassword,
        name: RouteManager.authPasswordName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const PasswordScreen(),
        ),
      ),
      
      // Login route
      GoRoute(
        path: RouteManager.login,
        name: RouteManager.loginName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const LoginScreen(),
        ),
      ),
      
      // Welcome back route
      GoRoute(
        path: RouteManager.welcomeBack,
        name: RouteManager.welcomeBackName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const WelcomeBackScreen(),
        ),
      ),
      
      // Forgot password route
      GoRoute(
        path: RouteManager.forgotPassword,
        name: RouteManager.forgotPasswordName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const ForgotPasswordScreen(),
        ),
      ),
      
      // Forgot password OTP route
      GoRoute(
        path: RouteManager.forgotPasswordOtp,
        name: RouteManager.forgotPasswordOtpName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final String email = state.extra! as String;
          return _buildPageWithTransition(
            context,
            state,
            ForgotPasswordOtpScreen(email: email),
          );
        },
      ),
      
      // Reset password route
      GoRoute(
        path: RouteManager.resetPassword,
        name: RouteManager.resetPasswordName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final Map<String, String> data = state.extra! as Map<String, String>;
          return _buildPageWithTransition(
            context,
            state,
            ResetPasswordScreen(
              email: data['email']!,
              otp: data['otp']!,
            ),
          );
        },
      ),
      
      // Home route (legacy - redirects to dashboard)
      GoRoute(
        path: RouteManager.home,
        name: RouteManager.homeName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const MainDashboardScreen(),
        ),
      ),
      
      // Main Dashboard route (new 5-tab navigation)
      GoRoute(
        path: RouteManager.dashboard,
        name: RouteManager.dashboardName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const MainDashboardScreen(),
        ),
      ),
      
      // Events List route
      GoRoute(
        path: RouteManager.eventsList,
        name: RouteManager.eventsListName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const EventsListScreen(),
        ),
      ),
      
      // Event Details with ID parameter
      GoRoute(
        path: '${RouteManager.eventDetails}/:id',
        name: RouteManager.eventDetailsName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final String eventId = state.pathParameters['id'] ?? '';
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
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const events_search.SearchScreen(),
        ),
      ),
      
      // My Events route
      GoRoute(
        path: RouteManager.myEvents,
        name: RouteManager.myEventsName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const MyEventsScreen(),
        ),
      ),
      
      // Legacy Event Details routes (keeping for backward compatibility with old feature)
      GoRoute(
        path: RouteManager.legacyEventDetails,
        name: RouteManager.legacyEventDetailsName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const EventDetailsScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.ticketInformation,
        name: RouteManager.ticketInformationName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const TicketInformationScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.eventDirection,
        name: RouteManager.eventDirectionName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const EventDirectionScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.buyTicket,
        name: RouteManager.buyTicketName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const BuyTicketScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.makePayment,
        name: RouteManager.makePaymentName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const MakePaymentScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.paymentSuccessful,
        name: RouteManager.paymentSuccessfulName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const PaymentSuccessfulScreen(),
        ),
      ),
      
      // Search route
      GoRoute(
        path: RouteManager.search,
        name: RouteManager.searchName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const SearchScreen(),
        ),
      ),
      
      // My Tickets route
      GoRoute(
        path: RouteManager.myTickets,
        name: RouteManager.myTicketsName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const MyTicketsScreenV2(),
        ),
      ),
      
      // Checkout route
      GoRoute(
        path: RouteManager.checkout,
        name: RouteManager.checkoutName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final event = state.extra as EventEntity;
          return _buildPageWithTransition(
            context,
            state,
            CheckoutScreen(event: event),
          );
        },
      ),
      
      // Ticket Details route
      GoRoute(
        path: '/ticket-details/:ticketId',
        name: 'ticketDetails',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final ticketId = state.pathParameters['ticketId'] ?? '';
          return _buildPageWithTransition(
            context,
            state,
            TicketDetailsScreen(ticketId: ticketId),
          );
        },
      ),
      
      // Organize Event route (legacy)
      GoRoute(
        path: RouteManager.organizeEvent,
        name: RouteManager.organizeEventName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const OrganizeEventScreen(),
        ),
      ),
      
      // Event Creation Flow route (new multi-step flow)
      GoRoute(
        path: RouteManager.eventCreationFlow,
        name: RouteManager.eventCreationFlowName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const EventCreationFlowScreen(),
        ),
      ),
      
      // Event Creation Success route
      GoRoute(
        path: RouteManager.eventCreationSuccess,
        name: RouteManager.eventCreationSuccessName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final EventModel? createdEvent = state.extra as EventModel?;
          if (createdEvent == null) {
            // Fallback to dashboard if no event data
            return _buildPageWithTransition(
              context,
              state,
              const MainDashboardScreen(),
            );
          }
          return _buildPageWithTransition(
            context,
            state,
            EventCreationSuccessScreen(createdEvent: createdEvent),
          );
        },
      ),
      
      // Resource Categories route (Co-host marketplace)
      GoRoute(
        path: RouteManager.resourceCategories,
        name: RouteManager.resourceCategoriesName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const ResourceCategoriesScreen(),
        ),
      ),
      
      // Co-host List route
      GoRoute(
        path: RouteManager.cohostList,
        name: RouteManager.cohostListName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final ResourceCategory category = state.extra! as ResourceCategory;
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
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const ChatListScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.chatDetail,
        name: RouteManager.chatDetailName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const ChatDetailScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.organizerChat,
        name: RouteManager.organizerChatName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const OrganizerChatScreen(),
        ),
      ),
      
      // Profile route
      GoRoute(
        path: RouteManager.profile,
        name: RouteManager.profileName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const ProfileScreen(),
        ),
      ),
      
      // Account Settings route
      GoRoute(
        path: RouteManager.accountSettings,
        name: RouteManager.accountSettingsName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const AccountSettingsScreen(),
        ),
      ),
      
      // Support route
      GoRoute(
        path: RouteManager.support,
        name: RouteManager.supportName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const SupportScreen(),
        ),
      ),
      
      // Terms route
      GoRoute(
        path: RouteManager.terms,
        name: RouteManager.termsName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const TermsScreen(),
        ),
      ),
      
      // Notification Settings route
      GoRoute(
        path: RouteManager.notificationSettings,
        name: RouteManager.notificationSettingsName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const NotificationSettingsScreen(),
        ),
      ),
      
      // Wallet routes
      GoRoute(
        path: RouteManager.walletBalance,
        name: RouteManager.walletBalanceName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const BalanceDetailScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.walletEnterAmount,
        name: RouteManager.walletEnterAmountName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const EnterWithdrawalAmountScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.walletReview,
        name: RouteManager.walletReviewName,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final String amount = state.extra as String? ?? '0.00';
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
        pageBuilder: (BuildContext context, GoRouterState state) {
          final String amount = state.extra as String? ?? '0.00';
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
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const TransactionHistoryScreen(),
        ),
      ),

      // Vendor routes
      GoRoute(
        path: RouteManager.vendorRegistration,
        name: RouteManager.vendorRegistrationName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const VendorRegistrationScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.vendorResourcesList,
        name: RouteManager.vendorResourcesListName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const VendorResourcesListScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.vendorAddResource,
        name: RouteManager.vendorAddResourceName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const VendorAddResourceScreenV2(),
        ),
      ),
      GoRoute(
        path: RouteManager.vendorBookingsList,
        name: RouteManager.vendorBookingsListName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const VendorBookingsListScreen(),
        ),
      ),
      GoRoute(
        path: RouteManager.vendorDashboardScreen,
        name: RouteManager.vendorDashboardScreenName,
        pageBuilder: (BuildContext context, GoRouterState state) => _buildPageWithTransition(
          context,
          state,
          const VendorDashboardScreen(),
        ),
      ),
    ],
  );
}