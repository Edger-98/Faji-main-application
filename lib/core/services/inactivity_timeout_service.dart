import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';

/// Service to handle user inactivity timeout
class InactivityTimeoutService {
  factory InactivityTimeoutService() => _instance;
  InactivityTimeoutService._internal();
  static final InactivityTimeoutService _instance = InactivityTimeoutService._internal();

  // Configuration
  static const Duration _inactivityDuration = Duration(minutes: 10);
  static const Duration _warningDuration = Duration(seconds: 30);
  
  Timer? _inactivityTimer;
  Timer? _warningTimer;
  BuildContext? _context;
  bool _isDialogShowing = false;
  bool _isEnabled = true;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Initialize the service with app context
  void initialize(BuildContext context) {
    _context = context;
    _startInactivityTimer();
  }

  /// Update context when navigating
  void updateContext(BuildContext context) {
    _context = context;
  }

  /// Reset the inactivity timer (call on user interaction)
  void resetTimer() {
    if (!_isEnabled) return;
    
    // Only reset if timer exists (prevents excessive logging)
    if (_inactivityTimer != null && _inactivityTimer!.isActive) {
      _cancelTimers();
      _startInactivityTimer();
    }
  }

  /// Start the inactivity timer
  void _startInactivityTimer() {
    // Cancel existing timer first
    _inactivityTimer?.cancel();
    
    _inactivityTimer = Timer(_inactivityDuration, () {
      if (_isEnabled) {
        _showInactivityDialog();
      }
    });
  }

  /// Cancel all timers
  void _cancelTimers() {
    _inactivityTimer?.cancel();
    _warningTimer?.cancel();
    _inactivityTimer = null;
    _warningTimer = null;
  }

  /// Show inactivity warning dialog
  void _showInactivityDialog() {
    if (_isDialogShowing || _context == null || !_context!.mounted) {
      return;
    }

    _isDialogShowing = true;
    
    // Start countdown timer for auto-logout
    var remainingSeconds = _warningDuration.inSeconds;
    
    showDialog(
      context: _context!,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) => _InactivityDialog(
          remainingSeconds: remainingSeconds,
          onStayActive: () {
            _handleStayActive(dialogContext);
          },
          onLogout: () {
            _handleLogout(dialogContext);
          },
        ),
    ).then((_) {
      _isDialogShowing = false;
    });

    // Auto-logout after warning duration
    _warningTimer = Timer(_warningDuration, () {
      if (_isDialogShowing && _context != null && _context!.mounted) {
        Navigator.of(_context!, rootNavigator: true).pop();
        _performLogout();
      }
    });
  }

  /// Handle "Stay Active" button
  void _handleStayActive(BuildContext dialogContext) {
    _warningTimer?.cancel();
    Navigator.of(dialogContext).pop();
    _isDialogShowing = false;
    resetTimer();
  }

  /// Handle "Logout" button
  void _handleLogout(BuildContext dialogContext) {
    _warningTimer?.cancel();
    Navigator.of(dialogContext).pop();
    _isDialogShowing = false;
    _performLogout();
  }

  /// Perform logout
  Future<void> _performLogout() async {
    try {
      // Clear all auth data
      await _storage.delete(key: 'auth_token');
      await _storage.delete(key: 'refresh_token');
      await _storage.delete(key: 'user_id');
      
      // Clear shared preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      // Silent error handling
    }
    
    // Stop timers
    _cancelTimers();
    
    // Navigate to intro screen (not welcome back)
    if (_context != null && _context!.mounted) {
      // Use a delay to ensure cleanup is complete
      await Future<void>.delayed(const Duration(milliseconds: 200));
      if (_context != null && _context!.mounted) {
        _context!.go(RouteManager.intro);
      }
    }
  }

  /// Enable/disable inactivity timeout
  void setEnabled(bool enabled) {
    _isEnabled = enabled;
    if (!enabled) {
      _cancelTimers();
    } else if (_context != null) {
      resetTimer();
    }
  }

  /// Dispose the service
  void dispose() {
    _cancelTimers();
    _context = null;
  }
}

/// Inactivity warning dialog widget
class _InactivityDialog extends StatefulWidget {

  const _InactivityDialog({
    required this.remainingSeconds,
    required this.onStayActive,
    required this.onLogout,
  });
  final int remainingSeconds;
  final VoidCallback onStayActive;
  final VoidCallback onLogout;

  @override
  State<_InactivityDialog> createState() => _InactivityDialogState();
}

class _InactivityDialogState extends State<_InactivityDialog> {
  late int _remainingSeconds;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.remainingSeconds;
    _startCountdown();
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      
      setState(() {
        _remainingSeconds--;
      });

      if (_remainingSeconds <= 0) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Warning icon
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: AppColors.warning.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.access_time,
              size: 50.sp,
              color: AppColors.warning,
            ),
          ),
          
          SizedBox(height: 24.h),
          
          // Title
          Text(
            'Are you still there?',
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: 12.h),
          
          // Message
          Text(
            'You\'ve been inactive for a while. For your security, you\'ll be logged out in:',
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 14.sp,
              color: AppColors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: 16.h),
          
          // Countdown
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.warning.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.warning.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              '$_remainingSeconds seconds',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.warning,
              ),
            ),
          ),
          
          SizedBox(height: 24.h),
          
          // Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: widget.onLogout,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.surfaceContainerHighest,
                    foregroundColor: AppColors.onSurface,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              SizedBox(width: 12.w),
              
              Expanded(
                child: ElevatedButton(
                  onPressed: widget.onStayActive,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Stay Active',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
}
