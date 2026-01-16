import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../utils/logger.dart';
import '../services/firebase_notification_service.dart';
import 'config.dart';

/// Handles application initialization and setup
class AppInitializer {
  // Private constructor to prevent instantiation
  AppInitializer._();

  /// Initialize the application
  static Future<void> initialize() async {
    try {
      // Ensure Flutter binding is initialized
      WidgetsFlutterBinding.ensureInitialized();

      // Initialize Firebase
      await Firebase.initializeApp();
      Logger.info('Firebase initialized');

      // Set up background message handler
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      // Set preferred orientations
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      // Initialize configuration
      await _initializeConfiguration();

      // Initialize error handling
      await _initializeErrorHandling();

      // Initialize other services
      await _initializeServices();

      Logger.info('Application initialization completed successfully');
    } catch (e, stackTrace) {
      Logger.error('Application initialization failed', e, stackTrace);
      rethrow;
    }
  }

  /// Initialize configuration and environment variables
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

  /// Initialize error handling
  static Future<void> _initializeErrorHandling() async {
    try {
      // Set up Flutter error handling to use Logger
      FlutterError.onError = (FlutterErrorDetails details) {
        Logger.error('Flutter Error', details.exception, details.stack);
      };

      // Handle errors outside of Flutter
      PlatformDispatcher.instance.onError = (error, stack) {
        Logger.error('Platform Error', error, stack);
        return true;
      };

      Logger.info('Error handling initialized');
    } catch (e) {
      Logger.error('Failed to initialize error handling', e);
      rethrow;
    }
  }

  /// Initialize other services
  static Future<void> _initializeServices() async {
    try {
      // Initialize Firebase Notification Service
      await FirebaseNotificationService().initialize();
      Logger.info('Firebase Notification Service initialized');
      
      // Initialize any additional services here
      // For example: analytics, etc.
      
      Logger.info('Additional services initialized');
    } catch (e) {
      Logger.error('Failed to initialize additional services', e);
      rethrow;
    }
  }

  /// Clean up resources when app is disposed
  static Future<void> dispose() async {
    try {
      Logger.info('Application cleanup completed');
    } catch (e) {
      Logger.error('Error during application cleanup', e);
    }
  }
}