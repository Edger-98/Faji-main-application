import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/response_normalizer_interceptor.dart';

/// API Client configuration
class ApiClient {
  late final Dio _dio;

  ApiClient() {
    final baseUrl = dotenv.env['API_BASE_URL'] ?? dotenv.env['BASE_URL'] ?? 'http://10.0.2.2:5001';
    
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

  Dio get dio => _dio;
}

/// Provider for API client
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

/// Provider for Dio instance
final dioProvider = Provider<Dio>((ref) {
  return ref.watch(apiClientProvider).dio;
});
