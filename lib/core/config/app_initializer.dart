import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/app_constants.dart';
import '../utils/logger.dart';
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

      // Set preferred orientations
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      // Initialize configuration
      await _initializeConfiguration();

      // Initialize local storage
      await _initializeLocalStorage();

      // Initialize Firebase
      await _initializeFirebase();

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

  /// Initialize local storage (Hive)
  static Future<void> _initializeLocalStorage() async {
    try {
      await Hive.initFlutter();
      
      // Open required boxes
      await Future.wait([
        Hive.openBox(AppConstants.userBox),
        Hive.openBox(AppConstants.settingsBox),
        Hive.openBox(AppConstants.cacheBox),
      ]);

      Logger.info('Local storage initialized successfully');
    } catch (e) {
      Logger.error('Failed to initialize local storage', e);
      rethrow;
    }
  }

  /// Initialize Firebase services
  static Future<void> _initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      Logger.info('Firebase initialized successfully');
    } catch (e) {
      Logger.error('Failed to initialize Firebase', e);
      rethrow;
    }
  }

  /// Initialize error handling and crash reporting
  static Future<void> _initializeErrorHandling() async {
    try {
      if (Config.enableCrashlytics && !kDebugMode) {
        // Enable Crashlytics in production
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
        
        // Handle errors outside of Flutter
        PlatformDispatcher.instance.onError = (error, stack) {
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
          return true;
        };
      } else {
        // In debug mode, print errors to console
        FlutterError.onError = (FlutterErrorDetails details) {
          Logger.error('Flutter Error', details.exception, details.stack);
        };
      }

      Logger.info('Error handling initialized');
    } catch (e) {
      Logger.error('Failed to initialize error handling', e);
      rethrow;
    }
  }

  /// Initialize other services
  static Future<void> _initializeServices() async {
    try {
      // Initialize any additional services here
      // For example: notification services, analytics, etc.
      
      Logger.info('Additional services initialized');
    } catch (e) {
      Logger.error('Failed to initialize additional services', e);
      rethrow;
    }
  }

  /// Clean up resources when app is disposed
  static Future<void> dispose() async {
    try {
      await Hive.close();
      Logger.info('Application cleanup completed');
    } catch (e) {
      Logger.error('Error during application cleanup', e);
    }
  }
}