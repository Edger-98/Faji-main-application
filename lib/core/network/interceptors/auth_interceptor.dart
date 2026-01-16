import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Interceptor to add authentication token to requests
class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  
  // Callback for session timeout
  static void Function()? onSessionTimeout;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read(key: 'auth_token');
    
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Token expired or invalid - handle session timeout
      _handleUnauthorized();
    }
    handler.next(err);
  }

  Future<void> _handleUnauthorized() async {
    print('🔒 Session expired - clearing auth data');
    
    // Clear all auth data
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'refresh_token');
    
    // Trigger session timeout callback
    if (onSessionTimeout != null) {
      onSessionTimeout!();
    }
  }
}
