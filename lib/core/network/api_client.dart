import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/config/api_config.dart';

import 'package:fajimobileapp/core/network/interceptors/auth_interceptor.dart';
import 'package:fajimobileapp/core/network/interceptors/error_interceptor.dart';
import 'package:fajimobileapp/core/network/interceptors/logging_interceptor.dart';
import 'package:fajimobileapp/core/network/interceptors/response_normalizer_interceptor.dart';

/// API Client configuration
class ApiClient {

  ApiClient() {
    // Use ApiConfig for consistent URL across the app
    final baseUrl = ApiConfig.baseUrl;
    
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (status) {
          // Accept all status codes to handle them in interceptors
          return status != null && status < 500;
        },
      ),
    );

    _dio.interceptors.addAll([
      AuthInterceptor(),
      ResponseNormalizerInterceptor(), // Normalize responses before error handling
      ErrorInterceptor(),
      LoggingInterceptor(),
    ]);
  }
  late final Dio _dio;

  Dio get dio => _dio;
}

/// Provider for API client
final Provider<ApiClient> apiClientProvider = Provider<ApiClient>((ProviderRef<ApiClient> ref) => ApiClient());

/// Provider for Dio instance
final Provider<Dio> dioProvider = Provider<Dio>((ProviderRef<Dio> ref) => ref.watch(apiClientProvider).dio);
