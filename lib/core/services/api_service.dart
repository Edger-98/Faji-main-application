import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/config/api_config.dart';
import 'package:fajimobileapp/core/network/interceptors/auth_interceptor.dart';

class ApiService {
  
  ApiService() : _dio = Dio() {
    _dio.options.baseUrl = ApiConfig.baseUrl;
    _dio.options.connectTimeout = Duration(milliseconds: ApiConfig.connectTimeout);
    _dio.options.receiveTimeout = Duration(milliseconds: ApiConfig.receiveTimeout);
    _dio.options.sendTimeout = Duration(milliseconds: ApiConfig.sendTimeout);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    
    // Add auth interceptor FIRST (to add token to requests)
    _dio.interceptors.add(AuthInterceptor());
    
    // Add interceptors for logging and error handling
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('🚀 REQUEST[${options.method}] => ${options.uri}');
          print('   Headers: ${options.headers}');
          print('   Data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('✅ RESPONSE[${response.statusCode}] => ${response.requestOptions.uri}');
          print('   Data: ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) {
          print('❌ ERROR[${error.response?.statusCode}] => ${error.requestOptions.uri}');
          print('   Error Type: ${error.type}');
          print('   Error Message: ${error.message}');
          print('   Response Data: ${error.response?.data}');
          return handler.next(error);
        },
      ),
    );
  }
  final Dio _dio;
  
  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
  
  void removeToken() {
    _dio.options.headers.remove('Authorization');
  }
  
  Future<Response> get(String path, {Map<String, dynamic>? params}) async {
    try {
      return await _dio.get(path, queryParameters: params);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  
  Future<Response> post(String path, {data}) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  
  Future<Response> patch(String path, {data}) async {
    try {
      return await _dio.patch(path, data: data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  
  Future<Response> delete(String path) async {
    try {
      return await _dio.delete(path);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  
  Future<Response> uploadFile(
    String path,
    String filePath, {
    String fieldName = 'file',
    Map<String, dynamic>? data,
  }) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        fieldName: await MultipartFile.fromFile(filePath),
        ...?data,
      });
      return await _dio.post(path, data: formData);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  
  Exception _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timeout. Please check your internet connection.');
      
      case DioExceptionType.badResponse:
        final int? statusCode = error.response?.statusCode;
        final message = error.response?.data?['error']?['message'] ?? 
                       error.response?.data?['message'] ?? 
                       'An error occurred';
        
        switch (statusCode) {
          case 401:
            return Exception('Unauthorized. Please login again.');
          case 403:
            return Exception("You don't have permission to perform this action.");
          case 404:
            return Exception('Resource not found.');
          case 422:
            return Exception('Invalid data: $message');
          case 429:
            return Exception('Too many requests. Please try again later.');
          case 500:
            return Exception('Server error. Please try again later.');
          default:
            return Exception(message);
        }
      
      case DioExceptionType.cancel:
        return Exception('Request cancelled');
      
      default:
        return Exception('Network error. Please check your connection.');
    }
  }
}

final Provider<ApiService> apiServiceProvider = Provider<ApiService>((ProviderRef<ApiService> ref) => ApiService());
