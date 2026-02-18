import 'package:dio/src/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/core/network/network_info.dart';
import 'package:fajimobileapp/core/services/api_service.dart';
import 'package:fajimobileapp/core/services/biometric_auth_service.dart';
import 'package:fajimobileapp/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fajimobileapp/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fajimobileapp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/add_name_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/add_phone_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/complete_registration_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/get_user_by_id_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/logout_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/register_email_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/update_password_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/update_settings_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/verify_password_reset_otp_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/verify_registration_otp_usecase.dart';

// ============================================================================
// Data Sources
// ============================================================================

/// Secure Storage Provider
final Provider<FlutterSecureStorage> secureStorageProvider = Provider<FlutterSecureStorage>((ProviderRef<FlutterSecureStorage> ref) => const FlutterSecureStorage());

/// Shared Preferences Provider
final Provider<SharedPreferences> sharedPreferencesProvider = Provider<SharedPreferences>((ProviderRef<SharedPreferences> ref) {
  throw UnimplementedError('SharedPreferences must be initialized in main.dart');
});

/// Auth Remote Data Source Provider
final Provider<AuthRemoteDataSource> authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ProviderRef<AuthRemoteDataSource> ref) {
  final Dio dio = ref.watch(dioProvider);
  return AuthRemoteDataSource(dio);
});

/// Auth Local Data Source Provider
final Provider<AuthLocalDataSource> authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ProviderRef<AuthLocalDataSource> ref) {
  final FlutterSecureStorage secureStorage = ref.watch(secureStorageProvider);
  final SharedPreferences sharedPreferences = ref.watch(sharedPreferencesProvider);
  return AuthLocalDataSourceImpl(
    secureStorage: secureStorage,
    sharedPreferences: sharedPreferences,
  );
});

/// Biometric Auth Service Provider
final Provider<BiometricAuthService> biometricAuthServiceProvider = Provider<BiometricAuthService>((ProviderRef<BiometricAuthService> ref) => BiometricAuthService());

// ============================================================================
// Repository
// ============================================================================

/// Auth Repository Provider
final Provider<AuthRepository> authRepositoryProvider = Provider<AuthRepository>((ProviderRef<AuthRepository> ref) {
  final AuthRemoteDataSource remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final AuthLocalDataSource localDataSource = ref.watch(authLocalDataSourceProvider);
  final NetworkInfo networkInfo = ref.watch(networkInfoProvider);
  final ApiService apiService = ref.watch(apiServiceProvider);
  
  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    networkInfo: networkInfo,
    apiService: apiService,
  );
});

// ============================================================================
// Use Cases
// ============================================================================

/// Login Use Case Provider
final Provider<LoginUseCase> loginUseCaseProvider = Provider<LoginUseCase>((ProviderRef<LoginUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});

/// Register Use Case Provider
final Provider<RegisterUseCase> registerUseCaseProvider = Provider<RegisterUseCase>((ProviderRef<RegisterUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return RegisterUseCase(repository);
});

/// Get Current User Use Case Provider
final Provider<GetCurrentUserUseCase> getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ProviderRef<GetCurrentUserUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return GetCurrentUserUseCase(repository);
});

/// Logout Use Case Provider
final Provider<LogoutUseCase> logoutUseCaseProvider = Provider<LogoutUseCase>((ProviderRef<LogoutUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return LogoutUseCase(repository);
});

/// Send OTP Use Case Provider
final Provider<SendOtpUseCase> sendOtpUseCaseProvider = Provider<SendOtpUseCase>((ProviderRef<SendOtpUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return SendOtpUseCase(repository);
});

/// Verify OTP Use Case Provider
final Provider<VerifyOtpUseCase> verifyOtpUseCaseProvider = Provider<VerifyOtpUseCase>((ProviderRef<VerifyOtpUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return VerifyOtpUseCase(repository);
});

/// Forget Password Use Case Provider
final Provider<ForgetPasswordUseCase> forgetPasswordUseCaseProvider = Provider<ForgetPasswordUseCase>((ProviderRef<ForgetPasswordUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return ForgetPasswordUseCase(repository);
});

/// Verify Password Reset OTP Use Case Provider
final Provider<VerifyPasswordResetOtpUseCase> verifyPasswordResetOtpUseCaseProvider = Provider<VerifyPasswordResetOtpUseCase>((ProviderRef<VerifyPasswordResetOtpUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return VerifyPasswordResetOtpUseCase(repository);
});

/// Reset Password Use Case Provider
final Provider<ResetPasswordUseCase> resetPasswordUseCaseProvider = Provider<ResetPasswordUseCase>((ProviderRef<ResetPasswordUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return ResetPasswordUseCase(repository);
});

/// Update Password Use Case Provider
final Provider<UpdatePasswordUseCase> updatePasswordUseCaseProvider = Provider<UpdatePasswordUseCase>((ProviderRef<UpdatePasswordUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return UpdatePasswordUseCase(repository);
});

/// Get User By ID Use Case Provider
final Provider<GetUserByIdUseCase> getUserByIdUseCaseProvider = Provider<GetUserByIdUseCase>((ProviderRef<GetUserByIdUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return GetUserByIdUseCase(repository);
});

/// Update Settings Use Case Provider
final Provider<UpdateSettingsUseCase> updateSettingsUseCaseProvider = Provider<UpdateSettingsUseCase>((ProviderRef<UpdateSettingsUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return UpdateSettingsUseCase(repository);
});

/// Delete Account Use Case Provider
final Provider<DeleteAccountUseCase> deleteAccountUseCaseProvider = Provider<DeleteAccountUseCase>((ProviderRef<DeleteAccountUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return DeleteAccountUseCase(repository);
});

// ============================================================================
// Multi-Step Registration Use Cases
// ============================================================================

/// Register Email Use Case Provider (Step 1)
final Provider<RegisterEmailUseCase> registerEmailUseCaseProvider = Provider<RegisterEmailUseCase>((ProviderRef<RegisterEmailUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return RegisterEmailUseCase(repository);
});

/// Verify Registration OTP Use Case Provider (Step 2)
final Provider<VerifyRegistrationOtpUseCase> verifyRegistrationOtpUseCaseProvider = Provider<VerifyRegistrationOtpUseCase>((ProviderRef<VerifyRegistrationOtpUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return VerifyRegistrationOtpUseCase(repository);
});

/// Add Phone Use Case Provider (Step 3)
final Provider<AddPhoneUseCase> addPhoneUseCaseProvider = Provider<AddPhoneUseCase>((ProviderRef<AddPhoneUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return AddPhoneUseCase(repository);
});

/// Add Name Use Case Provider (Step 4)
final Provider<AddNameUseCase> addNameUseCaseProvider = Provider<AddNameUseCase>((ProviderRef<AddNameUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return AddNameUseCase(repository);
});

/// Complete Registration Use Case Provider (Step 5)
final Provider<CompleteRegistrationUseCase> completeRegistrationUseCaseProvider = Provider<CompleteRegistrationUseCase>((ProviderRef<CompleteRegistrationUseCase> ref) {
  final AuthRepository repository = ref.watch(authRepositoryProvider);
  return CompleteRegistrationUseCase(repository);
});
