import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fajimobileapp/core/routing/route_manager.dart';

/// Auth guard to protect routes that require authentication
class AuthGuard {
  static Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userEmail = prefs.getString('user_email');
    final bool hasUserData = userEmail != null && userEmail.isNotEmpty;
    
    // Apple Guideline 5.1.1(v): browsing events does not require an account.
    // dashboard, eventDetails, eventDirection, eventsList are intentionally public.
    // Only account-based actions are protected.
    final List<String> protectedRoutes = <String>[
      RouteManager.profile,
      RouteManager.accountSettings,
      RouteManager.myTickets,
      RouteManager.myEvents,
      RouteManager.favorites,
      RouteManager.chatList,
      RouteManager.chatDetail,
      RouteManager.organizerChat,
      RouteManager.ticketInformation,
      RouteManager.buyTicket,
      RouteManager.makePayment,
      RouteManager.paymentSuccessful,
      RouteManager.organizeEvent,
      RouteManager.eventCreationFlow,
      RouteManager.walletBalance,
      RouteManager.walletEnterAmount,
      RouteManager.walletReview,
      RouteManager.walletConfirmation,
      RouteManager.walletHistory,
      RouteManager.walletBankConnect,
      RouteManager.vendorDashboardScreen,
      RouteManager.vendorResourcesList,
      RouteManager.vendorAddResource,
      RouteManager.vendorBookingsList,
    ];
    
    final bool isProtectedRoute = protectedRoutes.contains(state.matchedLocation);
    
    // If trying to access protected route without auth, redirect to welcome back or intro
    if (isProtectedRoute && !hasUserData) {
      return RouteManager.intro;
    }
    
    // Allow access
    return null;
  }
}
