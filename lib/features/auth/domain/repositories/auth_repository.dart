import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/entities/auth_token_entity.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_complete_entity.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_session_entity.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_token_entity.dart';
import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';

/// Auth repository interface - domain layer
abstract class AuthRepository {
  // ========== Multi-Step Registration Flow ==========
  
  /// Step 1: Register email and get session ID
  Future<Either<Failure, RegistrationSessionEntity>> registerEmail({
    required String email,
  });

  /// Step 2: Verify OTP and get registration token
  Future<Either<Failure, RegistrationTokenEntity>> verifyRegistrationOtp({
    required String email,
    required String otp,
    required String sessionId,
  });

  /// Step 3: Add phone number
  Future<Either<Failure, RegistrationTokenEntity>> addPhone({
    required String phoneNo,
    required String registrationToken,
  });

  /// Step 4: Add name
  Future<Either<Failure, RegistrationTokenEntity>> addName({
    required String firstName,
    required String lastName,
    required String registrationToken,
  });

  /// Step 5: Complete registration with password
  Future<Either<Failure, RegistrationCompleteEntity>> completeRegistration({
    required String password,
    required String role,
    required String registrationToken,
    bool pushNotificationsEnabled,
  });

  // ========== Original Methods ==========
  
  /// Login with email and password
  Future<Either<Failure, AuthTokenEntity>> login({
    required String email,
    required String password,
    String? expoPushToken,
  });

  /// Sign up new user
  Future<Either<Failure, AuthTokenEntity>> signup({
    required String email,
    required String phoneNo,
    required String firstName,
    required String lastName,
    required String password,
    required String role,
    bool pushNotificationsEnabled,
    String? image,
    String? expoPushToken,
  });

  /// Send OTP to email
  Future<Either<Failure, bool>> sendOtp({
    required String email,
  });

  /// Verify OTP
  Future<Either<Failure, bool>> verifyOtp({
    required String email,
    required String otp,
  });

  /// Forget password
  Future<Either<Failure, bool>> forgetPassword({
    required String email,
  });

  /// Verify password reset OTP
  Future<Either<Failure, String>> verifyPasswordResetOtp({
    required String email,
    required String otp,
  });

  /// Reset password with reset token
  Future<Either<Failure, bool>> resetPassword({
    required String resetToken,
    required String newPassword,
  });

  /// Update password with token
  Future<Either<Failure, bool>> updatePassword({
    required String token,
    required String oldPassword,
    required String newPassword,
  });

  /// Get user by ID
  Future<Either<Failure, UserEntity>> getUserById(String id);

  /// Update account settings
  Future<Either<Failure, UserEntity>> updateSettings({
    required String id,
    String? firstName,
    String? lastName,
    String? phoneNo,
    String? imagePath,
  });

  /// Delete account
  Future<Either<Failure, bool>> deleteAccount(String id);

  /// Logout user
  Future<Either<Failure, bool>> logout();

  /// Check if user is logged in
  Future<bool> isLoggedIn();

  /// Get stored token
  Future<String?> getToken();

  /// Get stored user ID
  Future<String?> getUserId();

  /// Save token and user ID
  Future<void> saveAuthData(String token, String userId);

  /// Clear auth data
  Future<void> clearAuthData();
}
