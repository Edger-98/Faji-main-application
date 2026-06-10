import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
// Firebase disabled — add GoogleService-Info.plist and uncomment to re-enable
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:fajimobileapp/core/services/firebase_notification_service.dart';

import 'package:fajimobileapp/core/config/config.dart';
import 'package:fajimobileapp/core/utils/logger.dart';

/// Handles application initialization and setup
class AppInitializer {
  AppInitializer._();

  static Future<void> initialize() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      // Firebase disabled — GoogleService-Info.plist not configured for iOS
      // await Firebase.initializeApp();
      // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      await _initializeConfiguration();
      await _initializeErrorHandling();
      await _initializeServices();

      Logger.info('Application initialization completed successfully');
    } catch (e, stackTrace) {
      Logger.error('Application initialization failed', e, stackTrace);
      rethrow;
    }
  }

  static Future<void> _initializeConfiguration() async {
    try {
      await Config.initialize();
      if (!Config.validateConfiguration()) {
        throw Exception('Invalid configuration: Missing required environment variables');
      }
      Logger.info('Configuration initialized: ${Config.getConfigSummary()}');
    } catch (e) {
      Logger.error('Failed to initialize configuration', e);
      rethrow;
    }
  }

  static Future<void> _initializeErrorHandling() async {
    try {
      FlutterError.onError = (FlutterErrorDetails details) {
        Logger.error('Flutter Error', details.exception, details.stack);
      };
      PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
        Logger.error('Platform Error', error, stack);
        return true;
      };
      Logger.info('Error handling initialized');
    } catch (e) {
      Logger.error('Failed to initialize error handling', e);
      rethrow;
    }
  }

  static Future<void> _initializeServices() async {
    try {
      // Firebase Notification Service disabled — re-enable when GoogleService-Info.plist is added
      // await FirebaseNotificationService().initialize();
      Logger.info('Services initialized');
    } catch (e) {
      Logger.error('Failed to initialize services', e);
      rethrow;
    }
  }

  static Future<void> dispose() async {
    try {
      Logger.info('Application cleanup completed');
    } catch (e) {
      Logger.error('Error during application cleanup', e);
    }
  }
}
