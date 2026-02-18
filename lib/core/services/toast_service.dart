import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

/// Toast Service for showing notifications
/// Uses toastification package for beautiful toast messages
class ToastService {
  ToastService._();

  /// Show success toast
  static void showSuccess({
    required BuildContext context,
    required String message,
    String? title,
    Duration? duration,
    ToastificationCallbacks? callbacks,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      title: title != null ? Text(title) : null,
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (BuildContext context, Animation<double> animation, Alignment alignment, Widget child) => FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      icon: const Icon(Icons.check_circle, color: Colors.white),
      primaryColor: const Color(0xFF4CAF50),
      backgroundColor: const Color(0xFF4CAF50),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
      callbacks: callbacks ?? const ToastificationCallbacks(),
    );
  }

  /// Show error toast
  static void showError({
    required BuildContext context,
    required String message,
    String? title,
    Duration? duration,
    ToastificationCallbacks? callbacks,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      title: title != null ? Text(title) : null,
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: duration ?? const Duration(seconds: 4),
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (BuildContext context, Animation<double> animation, Alignment alignment, Widget child) => FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      icon: const Icon(Icons.error),
      primaryColor: Colors.red,
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
      callbacks: callbacks ?? const ToastificationCallbacks(),
    );
  }

  /// Show warning toast
  static void showWarning({
    required BuildContext context,
    required String message,
    String? title,
    Duration? duration,
    ToastificationCallbacks? callbacks,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.fillColored,
      title: title != null ? Text(title) : null,
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (BuildContext context, Animation<double> animation, Alignment alignment, Widget child) => FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      icon: const Icon(Icons.warning),
      primaryColor: Colors.orange,
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
      callbacks: callbacks ?? const ToastificationCallbacks(),
    );
  }

  /// Show info toast
  static void showInfo({
    required BuildContext context,
    required String message,
    String? title,
    Duration? duration,
    ToastificationCallbacks? callbacks,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      title: title != null ? Text(title) : null,
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (BuildContext context, Animation<double> animation, Alignment alignment, Widget child) => FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      icon: const Icon(Icons.info),
      primaryColor: Colors.blue,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
      callbacks: callbacks ?? const ToastificationCallbacks(),
    );
  }

  /// Show custom toast with custom styling
  static void showCustom({
    required BuildContext context,
    required String message,
    String? title,
    Duration? duration,
    Color? backgroundColor,
    Color? foregroundColor,
    IconData? icon,
    ToastificationType type = ToastificationType.info,
    ToastificationCallbacks? callbacks,
  }) {
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.fillColored,
      title: title != null ? Text(title) : null,
      description: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (BuildContext context, Animation<double> animation, Alignment alignment, Widget child) => FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
      icon: icon != null ? Icon(icon) : null,
      primaryColor: backgroundColor,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor ?? Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,   
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
      callbacks: callbacks ?? const ToastificationCallbacks(),
    );
  }

  /// Show loading toast (doesn't auto-close)
  static ToastificationItem showLoading({
    required BuildContext context,
    required String message,
    String? title,
  }) => toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      title: title != null ? Text(title) : null,
      description: Row(
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(message)),
        ],
      ),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(days: 1), // Won't auto-close
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      primaryColor: Colors.blue,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.none,
      closeOnClick: false,
      pauseOnHover: false,
      dragToClose: false,
      applyBlurEffect: true,
    );

  /// Dismiss a specific toast
  static void dismiss(ToastificationItem item) {
    toastification.dismiss(item);
  }

  /// Dismiss all toasts
  static void dismissAll() {
    toastification.dismissAll();
  }
}
