import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/features/auth/data/models/user_model.dart';

part 'auth_remote_datasource.g.dart';

/// Auth remote data source using Retrofit
@RestApi()
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String baseUrl}) =
      _AuthRemoteDataSource;

  // ========== Multi-Step Registration Flow ==========

  /// Step 1: Register email
  @POST('/auth/register/email')
  Future<HttpResponse<dynamic>> registerEmail(
    @Body() Map<String, dynamic> body,
  );

  /// Step 2: Verify OTP
  @POST('/auth/register/verify-otp')
  Future<HttpResponse<dynamic>> verifyRegistrationOtp(
    @Body() Map<String, dynamic> body,
  );

  /// Step 3: Add phone number
  @POST('/auth/register/phone')
  Future<HttpResponse<dynamic>> addPhone(
    @Body() Map<String, dynamic> body,
  );

  /// Step 4: Add name
  @POST('/auth/register/name')
  Future<HttpResponse<dynamic>> addName(
    @Body() Map<String, dynamic> body,
  );

  /// Step 5: Complete registration
  @POST('/auth/register/complete')
  Future<HttpResponse<dynamic>> completeRegistration(
    @Body() Map<String, dynamic> body,
  );

  // ========== Original Methods ==========

  /// Sign in with email and password
  @POST('/auth/login')
  Future<HttpResponse<dynamic>> login(
    @Body() Map<String, dynamic> body,
  );

  /// Sign up new user
  @POST('/auth/signup')
  Future<HttpResponse<dynamic>> signup(
    @Body() Map<String, dynamic> body,
  );

  /// Send OTP to email
  @POST('/auth/send-otp')
  Future<HttpResponse<dynamic>> sendOtp(
    @Body() Map<String, dynamic> body,
  );

  /// Verify OTP
  @POST('/auth/verify-otp')
  Future<HttpResponse<dynamic>> verifyOtp(
    @Body() Map<String, dynamic> body,
  );

  /// Forget password
  @POST('/auth/forget-password')
  Future<HttpResponse<dynamic>> forgetPassword(
    @Body() Map<String, dynamic> body,
  );

  /// Verify password reset OTP
  @POST('/auth/verify-reset-otp')
  Future<HttpResponse<dynamic>> verifyPasswordResetOtp(
    @Body() Map<String, dynamic> body,
  );

  /// Reset password with OTP
  @POST('/auth/reset-password')
  Future<HttpResponse<dynamic>> resetPassword(
    @Body() Map<String, dynamic> body,
  );

  /// Update password with token
  @POST('/auth/update-password/{token}')
  Future<HttpResponse<dynamic>> updatePassword(
    @Path('token') String token,
    @Body() Map<String, dynamic> body,
  );

  /// Get user by ID
  @GET('/auth/users/{id}')
  Future<HttpResponse<dynamic>> getUserById(
    @Path('id') String id,
  );

  /// Update account settings
  @PUT('/auth/updateSettings/{id}')
  @MultiPart()
  Future<ApiResponse<UserModel>> updateSettings(
    @Path('id') String id,
    @Part(name: 'firstName') String? firstName,
    @Part(name: 'lastName') String? lastName,
    @Part(name: 'phoneNo') String? phoneNo,
    @Part(name: 'image') File? image,
  );

  /// Delete account
  @DELETE('/auth/deleteAccount/{id}')
  Future<HttpResponse<dynamic>> deleteAccount(
    @Path('id') String id,
  );
}
