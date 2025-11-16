import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_response.dart';
import '../models/user_model.dart';

part 'auth_remote_datasource.g.dart';

/// Auth remote data source using Retrofit
@RestApi()
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String baseUrl}) =
      _AuthRemoteDataSource;

  /// Sign in with email and password
  @POST('/api/auth/login')
  Future<HttpResponse<dynamic>> login(
    @Body() Map<String, dynamic> body,
  );

  /// Sign up new user
  @POST('/api/auth/signup')
  Future<HttpResponse<dynamic>> signup(
    @Body() Map<String, dynamic> body,
  );

  /// Send OTP to email
  @POST('/api/auth/send-otp')
  Future<HttpResponse<dynamic>> sendOtp(
    @Body() Map<String, dynamic> body,
  );

  /// Verify OTP
  @POST('/api/auth/verify-otp')
  Future<HttpResponse<dynamic>> verifyOtp(
    @Body() Map<String, dynamic> body,
  );

  /// Forget password
  @POST('/api/auth/forget-password')
  Future<HttpResponse<dynamic>> forgetPassword(
    @Body() Map<String, dynamic> body,
  );

  /// Update password with token
  @POST('/api/auth/update-password/{token}')
  Future<HttpResponse<dynamic>> updatePassword(
    @Path('token') String token,
    @Body() Map<String, dynamic> body,
  );

  /// Get user by ID
  @GET('/api/auth/users/{id}')
  Future<HttpResponse<dynamic>> getUserById(
    @Path('id') String id,
  );

  /// Update account settings
  @PUT('/api/auth/updateSettings/{id}')
  @MultiPart()
  Future<ApiResponse<UserModel>> updateSettings(
    @Path('id') String id,
    @Part(name: 'firstName') String? firstName,
    @Part(name: 'lastName') String? lastName,
    @Part(name: 'phoneNo') String? phoneNo,
    @Part(name: 'image') File? image,
  );

  /// Delete account
  @DELETE('/api/auth/deleteAccount/{id}')
  Future<HttpResponse<dynamic>> deleteAccount(
    @Path('id') String id,
  );
}
