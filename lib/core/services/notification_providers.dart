import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_notification_service.dart';

/// Provider for Firebase Notification Service
final firebaseNotificationServiceProvider = Provider<FirebaseNotificationService>((ref) {
  return FirebaseNotificationService();
});

/// Provider for FCM token
final fcmTokenProvider = FutureProvider<String?>((ref) async {
  final service = ref.watch(firebaseNotificationServiceProvider);
  return service.fcmToken;
});

/// Provider for notification permission status
final notificationPermissionProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(firebaseNotificationServiceProvider);
  return await service.isPermissionGranted();
});
