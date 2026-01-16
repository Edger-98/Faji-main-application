import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/services/api_service.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/add_name_usecase.dart';
import '../../domain/usecases/add_phone_usecase.dart';
import '../../domain/usecases/complete_registration_usecase.dart';
import '../../domain/usecases/delete_account_usecase.dart';
import '../../domain/usecases/forget_password_usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/get_user_by_id_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_email_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/send_otp_usecase.dart';
import '../../domain/usecases/update_password_usecase.dart';
import '../../domain/usecases/update_settings_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import '../../domain/usecases/verify_registration_otp_usecase.dart';

// ============================================================================
// Data Sources
// ============================================================================

/// Secure Storage Provider
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

/// Shared Preferences Provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be initialized in main.dart');
});

/// Auth Remote Data Source Provider
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSource(dio);
});

/// Auth Local Data Source Provider
final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return AuthLocalDataSourceImpl(
    secureStorage: secureStorage,
    sharedPreferences: sharedPreferences,
  );
});

// ============================================================================
// Repository
// ============================================================================

/// Auth Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = ref.watch(authLocalDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  final apiService = ref.watch(apiServiceProvider);
  
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
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});

/// Register Use Case Provider
final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterUseCase(repository);
});

/// Get Current User Use Case Provider
final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return GetCurrentUserUseCase(repository);
});

/// Logout Use Case Provider
final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LogoutUseCase(repository);
});

/// Send OTP Use Case Provider
final sendOtpUseCaseProvider = Provider<SendOtpUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SendOtpUseCase(repository);
});

/// Verify OTP Use Case Provider
final verifyOtpUseCaseProvider = Provider<VerifyOtpUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return VerifyOtpUseCase(repository);
});

/// Forget Password Use Case Provider
final forgetPasswordUseCaseProvider = Provider<ForgetPasswordUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return ForgetPasswordUseCase(repository);
});

/// Update Password Use Case Provider
final updatePasswordUseCaseProvider = Provider<UpdatePasswordUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return UpdatePasswordUseCase(repository);
});

/// Get User By ID Use Case Provider
final getUserByIdUseCaseProvider = Provider<GetUserByIdUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return GetUserByIdUseCase(repository);
});

/// Update Settings Use Case Provider
final updateSettingsUseCaseProvider = Provider<UpdateSettingsUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return UpdateSettingsUseCase(repository);
});

/// Delete Account Use Case Provider
final deleteAccountUseCaseProvider = Provider<DeleteAccountUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return DeleteAccountUseCase(repository);
});

// ============================================================================
// Multi-Step Registration Use Cases
// ============================================================================

/// Register Email Use Case Provider (Step 1)
final registerEmailUseCaseProvider = Provider<RegisterEmailUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterEmailUseCase(repository);
});

/// Verify Registration OTP Use Case Provider (Step 2)
final verifyRegistrationOtpUseCaseProvider = Provider<VerifyRegistrationOtpUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return VerifyRegistrationOtpUseCase(repository);
});

/// Add Phone Use Case Provider (Step 3)
final addPhoneUseCaseProvider = Provider<AddPhoneUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AddPhoneUseCase(repository);
});

/// Add Name Use Case Provider (Step 4)
final addNameUseCaseProvider = Provider<AddNameUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AddNameUseCase(repository);
});

/// Complete Registration Use Case Provider (Step 5)
final completeRegistrationUseCaseProvider = Provider<CompleteRegistrationUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return CompleteRegistrationUseCase(repository);
});
