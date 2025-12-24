import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/config/api_config.dart';
import '../datasources/vendor_remote_datasource.dart';

/// Dio provider for vendor feature
final vendorDioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = ApiConfig.baseUrl;
  dio.options.connectTimeout = Duration(milliseconds: ApiConfig.connectTimeout);
  dio.options.receiveTimeout = Duration(milliseconds: ApiConfig.receiveTimeout);
  dio.options.sendTimeout = Duration(milliseconds: ApiConfig.sendTimeout);
  
  // Add default headers
  dio.options.headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  
  // Add interceptors
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Try to get auth token from secure storage
        try {
          final storage = FlutterSecureStorage();
          final token = await storage.read(key: 'auth_token');
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
      onResponse: (response, handler) {
        print('✅ VENDOR RESPONSE[${response.statusCode}] => ${response.requestOptions.uri}');
        return handler.next(response);
      },
      onError: (error, handler) {
        print('❌ VENDOR ERROR[${error.response?.statusCode}] => ${error.requestOptions.uri}');
        print('   Error: ${error.response?.data}');
        return handler.next(error);
      },
    ),
  );
  
  return dio;
});

/// Vendor remote datasource provider
final vendorRemoteDataSourceProvider = Provider<VendorRemoteDataSource>((ref) {
  final dio = ref.watch(vendorDioProvider);
  return VendorRemoteDataSource(dio);
});
