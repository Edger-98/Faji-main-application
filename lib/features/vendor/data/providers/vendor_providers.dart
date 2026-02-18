import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fajimobileapp/core/services/api_service.dart';
import 'package:fajimobileapp/core/config/api_config.dart';
import 'package:fajimobileapp/features/vendor/data/datasources/vendor_remote_datasource.dart';

/// Dio provider for vendor feature
final Provider<Dio> vendorDioProvider = Provider<Dio>((ProviderRef<Dio> ref) {
  final Dio dio = Dio();
  dio.options.baseUrl = ApiConfig.baseUrl;
  dio.options.connectTimeout = const Duration(milliseconds: ApiConfig.connectTimeout);
  dio.options.receiveTimeout = const Duration(milliseconds: ApiConfig.receiveTimeout);
  dio.options.sendTimeout = const Duration(milliseconds: ApiConfig.sendTimeout);
  
  // Add default headers
  dio.options.headers = <String, dynamic>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  
  // Add interceptors
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        // Try to get auth token from secure storage
        try {
          const FlutterSecureStorage storage = FlutterSecureStorage();
          final String? token = await storage.read(key: 'auth_token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        } catch (e) {
          print('⚠️ Could not read auth token: $e');
        }
        
        print('🚀 VENDOR REQUEST[${options.method}] => ${options.uri}');
        print('   Headers: ${options.headers}');
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        print('✅ VENDOR RESPONSE[${response.statusCode}] => ${response.requestOptions.uri}');
        return handler.next(response);
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        print('❌ VENDOR ERROR[${error.response?.statusCode}] => ${error.requestOptions.uri}');
        print('   Error: ${error.response?.data}');
        return handler.next(error);
      },
    ),
  );
  
  return dio;
});

/// Vendor remote datasource provider
final Provider<VendorRemoteDataSource> vendorRemoteDataSourceProvider = Provider<VendorRemoteDataSource>((ProviderRef<VendorRemoteDataSource> ref) {
  final Dio dio = ref.watch(vendorDioProvider);
  return VendorRemoteDataSource(dio);
});
