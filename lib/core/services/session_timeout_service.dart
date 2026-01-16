import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routing/route_manager.dart';
import '../network/interceptors/auth_interceptor.dart';

/// Service to handle session timeout and redirect to welcome back screen
class SessionTimeoutService {
  static final SessionTimeoutService _instance = SessionTimeoutService._internal();
  factory SessionTimeoutService() => _instance;
  SessionTimeoutService._internal();

  BuildContext? _context;
  bool _isHandlingTimeout = false;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Initialize the service with app context
  void initialize(BuildContext context) {
    _context = context;
    
    // Set up the callback in AuthInterceptor
    AuthInterceptor.onSessionTimeout = _handleSessionTimeout;
  }

  /// Handle session timeout
  Future<void> _handleSessionTimeout() async {
    // Prevent multiple simultaneous timeout handlers
    if (_isHandlingTimeout) {
      print('⚠️ Session timeout already being handled');
      return;
    }

    _isHandlingTimeout = true;
    print('⏰ Session timeout detected - clearing auth and redirecting');

    if (_context == null || !_context!.mounted) {
      print('❌ Context not available for session timeout handling');
      _isHandlingTimeout = false;
      return;
    }

    // Clear all auth data
    await _clearAuthData();

    // Show notification
    _showSessionTimeoutNotification();

    // Navigate to welcome back screen after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (_context != null && _context!.mounted) {
        _context!.go(RouteManager.welcomeBack);
      }
      _isHandlingTimeout = false;
    });
  }
  
  /// Clear all authentication data
  Future<void> _clearAuthData() async {
    try {
      // Clear secure storage
      await _storage.delete(key: 'auth_token');
      await _storage.delete(key: 'refresh_token');
      await _storage.delete(key: 'user_id');
      
      // Clear shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('firstName');
      await prefs.remove('lastName');
      await prefs.remove('email');
      await prefs.remove('phoneNo');
      await prefs.remove('isAuthenticated');
      
      print('✅ Auth data cleared');
    } catch (e) {
      print('❌ Error clearing auth data: $e');
    }
  }

  /// Show session timeout notification
  void _showSessionTimeoutNotification() {
    if (_context == null || !_context!.mounted) return;

    toastification.show(
      context: _context,
      type: ToastificationType.warning,
      style: ToastificationStyle.fillColored,
      title: const Text(
        'Session Expired',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      description: const Text(
        'Your session has expired. Please log in again to continue.',
        style: TextStyle(fontSize: 14),
      ),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      animationDuration: const Duration(milliseconds: 300),
      icon: const Icon(Icons.lock_clock),
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
    );
  }

  /// Update context (useful when navigating between screens)
  void updateContext(BuildContext context) {
    _context = context;
  }

  /// Manually trigger session timeout (for testing or manual logout)
  Future<void> triggerSessionTimeout() async {
    await _handleSessionTimeout();
  }
}
