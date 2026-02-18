import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/services/firebase_notification_service.dart';

/// Provider for Firebase Notification Service
final Provider<FirebaseNotificationService> firebaseNotificationServiceProvider = Provider<FirebaseNotificationService>((ProviderRef<FirebaseNotificationService> ref) => FirebaseNotificationService());

/// Provider for FCM token
final FutureProvider<String?> fcmTokenProvider = FutureProvider<String?>((FutureProviderRef<String?> ref) async {
  final FirebaseNotificationService service = ref.watch(firebaseNotificationServiceProvider);
  return service.fcmToken;
});

/// Provider for notification permission status
final FutureProvider<bool> notificationPermissionProvider = FutureProvider<bool>((FutureProviderRef<bool> ref) async {
  final FirebaseNotificationService service = ref.watch(firebaseNotificationServiceProvider);
  return service.isPermissionGranted();
});
