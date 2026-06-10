import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:retrofit/dio.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/core/network/network_info.dart';
import 'package:fajimobileapp/features/auth/domain/entities/auth_token_entity.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_complete_entity.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_session_entity.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_token_entity.dart';
import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:fajimobileapp/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fajimobileapp/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fajimobileapp/features/auth/data/models/auth_token_model.dart';
import 'package:fajimobileapp/features/auth/data/models/registration_complete_model.dart';
import 'package:fajimobileapp/features/auth/data/models/registration_session_model.dart';
import 'package:fajimobileapp/features/auth/data/models/registration_token_model.dart';
import 'package:fajimobileapp/features/auth/data/models/user_model.dart';

/// Auth repository implementation
class AuthRepositoryImpl implements AuthRepository { // Add API service for token management

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.apiService,
  });
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final apiService;

  // ========== Multi-Step Registration Flow ==========

  @override
  Future<Either<Failure, RegistrationSessionEntity>> registerEmail({
    required String email,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.registerEmail(<String, dynamic>{'email': email});

      if (response.response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        final Map<String, dynamic> data = (responseData['data'] as Map<String, dynamic>?) ?? responseData;
        final RegistrationSessionModel model = RegistrationSessionModel.fromJson(data);
        return Right(model.toEntity());
      } else {
        return const Left(ServerFailure(message: 'Failed to register email'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegistrationTokenEntity>> verifyRegistrationOtp({
    required String email,
    required String otp,
    required String sessionId,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.verifyRegistrationOtp(<String, dynamic>{
        'email': email,
        'otp': otp,
        'sessionId': sessionId,
      });

      if (response.response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        final Map<String, dynamic> data = (responseData['data'] as Map<String, dynamic>?) ?? responseData;
        final RegistrationTokenModel model = RegistrationTokenModel.fromJson(data);
        return Right(model.toEntity());
      } else {
        return const Left(ServerFailure(message: 'Failed to verify OTP'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegistrationTokenEntity>> addPhone({
    required String phoneNo,
    required String registrationToken,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.addPhone(<String, dynamic>{
        'phoneNo': phoneNo,
        'registrationToken': registrationToken,
      });

      if (response.response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        final Map<String, dynamic> data = (responseData['data'] as Map<String, dynamic>?) ?? responseData;
        final RegistrationTokenModel model = RegistrationTokenModel.fromJson(data);
        return Right(model.toEntity());
      } else {
        return const Left(ServerFailure(message: 'Failed to add phone number'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegistrationTokenEntity>> addName({
    required String firstName,
    required String lastName,
    required String registrationToken,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.addName(<String, dynamic>{
        'firstName': firstName,
        'lastName': lastName,
        'registrationToken': registrationToken,
      });

      if (response.response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        final Map<String, dynamic> data = (responseData['data'] as Map<String, dynamic>?) ?? responseData;
        final RegistrationTokenModel model = RegistrationTokenModel.fromJson(data);
        return Right(model.toEntity());
      } else {
        return const Left(ServerFailure(message: 'Failed to add name'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegistrationCompleteEntity>> completeRegistration({
    required String password,
    required String role,
    required String registrationToken,
    bool pushNotificationsEnabled = false,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.completeRegistration(<String, dynamic>{
        'password': password,
        'role': role,
        'registrationToken': registrationToken,
        'pushNotificationsEnabled': pushNotificationsEnabled,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        
        // The normalizer wraps the response as: {success: true, message: "...", data: {...}}
        // Extract the data field which contains the actual registration response
        final Map<String, dynamic> data = responseData['data'] as Map<String, dynamic>? ?? responseData;
        
        // Parse the registration complete model
        final RegistrationCompleteModel model = RegistrationCompleteModel.fromJson(data);
        
        // Save auth data
        await saveAuthData(model.token, model.userId);
        
        // Save user data locally
        await localDataSource.saveUserData(
          model.user.firstName,
          model.user.lastName,
          model.user.email,
          phoneNo: model.user.phoneNo,
        );
        
        return Right(model.toEntity());
      } else {
        return const Left(ServerFailure(message: 'Failed to complete registration'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ========== Original Methods ==========


  @override
  Future<Either<Failure, AuthTokenEntity>> login({
    required String email,
    required String password,
    String? expoPushToken,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.login(<String, dynamic>{
        'email': email,
        'password': password,
        if (expoPushToken != null) 'expoPushToken': expoPushToken,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        // Parse the response data - handle both wrapped and direct responses
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        
        // Check if response has 'data' field (wrapped response)
        final Map<String, dynamic> actualData = responseData.containsKey('data') 
            ? responseData['data'] as Map<String, dynamic>
            : responseData;
        
        final AuthTokenModel authData = AuthTokenModel.fromJson(actualData);
        await saveAuthData(authData.token, authData.userId);
        
        // Save user data for quick access
        final Map<String, dynamic>? userObj = actualData['user'] as Map<String, dynamic>?;
        await localDataSource.saveUserData(
          (userObj?['firstName'] as String?) ?? '',
          (userObj?['lastName'] as String?) ?? '',
          authData.email,
          phoneNo: userObj?['phoneNo'] as String?,
        );
        
        return Right(authData.toEntity());
      } else {
        // Extract error message from response
        final Map<String, dynamic>? responseData = response.data as Map<String, dynamic>?;
        final String errorMessage = (responseData?['message'] ??
                           responseData?['msg'] ??
                           responseData?['error'] ??
                           'Login failed') as String;
        return Left(ServerFailure(message: errorMessage));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthTokenEntity>> signup({
    required String email,
    required String phoneNo,
    required String firstName,
    required String lastName,
    required String password,
    required String role,
    bool pushNotificationsEnabled = false,
    String? image,
    String? expoPushToken,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.signup(<String, dynamic>{
        'email': email,
        'phoneNo': phoneNo,
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
        'role': role,
        'pushNotificationsEnabled': pushNotificationsEnabled,
        if (image != null) 'image': image,
        if (expoPushToken != null) 'expoPushToken': expoPushToken,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        // Parse the response data directly
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        final AuthTokenModel authData = AuthTokenModel.fromJson(responseData);
        await saveAuthData(authData.token, authData.userId);
        return Right(authData.toEntity());
      } else {
        return const Left(ServerFailure(message: 'Signup failed'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendOtp({
    required String email,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.sendOtp(<String, dynamic>{
        'email': email,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        return const Right(true);
      } else {
        return const Left(ServerFailure(message: 'Failed to send OTP'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.verifyOtp(<String, dynamic>{
        'email': email,
        'otp': otp,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        return const Right(true);
      } else {
        return const Left(ServerFailure(message: 'Invalid OTP'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> forgetPassword({
    required String email,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.forgetPassword(<String, dynamic>{
        'email': email,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        return const Right(true);
      } else {
        return const Left(ServerFailure(message: 'Failed to send reset link'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> verifyPasswordResetOtp({
    required String email,
    required String otp,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.verifyPasswordResetOtp(<String, dynamic>{
        'email': email,
        'otp': otp,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        // Extract resetToken from response
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        final Map<String, dynamic> data = responseData['data'] as Map<String, dynamic>? ?? responseData;
        final String? resetToken = data['resetToken'] as String?;
        
        if (resetToken != null) {
          return Right(resetToken);
        } else {
          return const Left(ServerFailure(message: 'Reset token not received'));
        }
      } else {
        return const Left(ServerFailure(message: 'Invalid OTP'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword({
    required String resetToken,
    required String newPassword,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.resetPassword(<String, dynamic>{
        'resetToken': resetToken,
        'newPassword': newPassword,
        'confirmPassword': newPassword,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        return const Right(true);
      } else {
        return const Left(ServerFailure(message: 'Failed to reset password'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updatePassword({
    required String token,
    required String oldPassword,
    required String newPassword,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.updatePassword(
        token,
        <String, dynamic>{
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        },
      );

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        return const Right(true);
      } else {
        return const Left(ServerFailure(message: 'Failed to update password'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserById(String id) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.getUserById(id);

      if (response.response.statusCode == 200) {
        // Parse the response data - Response normalizer wraps it as {success, message, data}
        final Map<String, dynamic> responseData = response.data as Map<String, dynamic>;
        
        // Check if response is normalized (has 'data' field)
        final dataField = responseData['data'];
        Map<String, dynamic> userJson;
        
        if (dataField != null) {
          // Response is normalized, extract from data field
          if (dataField is Map<String, dynamic>) {
            // Check if data contains 'user' field or is the user object itself
            userJson = dataField['user'] as Map<String, dynamic>? ?? dataField;
          } else {
            return const Left(ServerFailure(message: 'Invalid user data format'));
          }
        } else {
          // Response is not normalized, check for 'user' field
          userJson = responseData['user'] as Map<String, dynamic>? ?? responseData;
        }
        
        final UserModel userData = UserModel.fromJson(userJson);
        
        // Save user data locally for offline access
        await localDataSource.saveUserData(
          userData.firstName,
          userData.lastName,
          userData.email,
          phoneNo: userData.phoneNo,
        );
        
        return Right(userData.toEntity());
      } else {
        return const Left(ServerFailure(message: 'Failed to get user'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: 'Error loading user: ${e}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateSettings({
    required String id,
    String? firstName,
    String? lastName,
    String? phoneNo,
    String? imageUrl,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final ApiResponse<UserModel> response = await remoteDataSource.updateSettings(
        id,
        firstName,
        lastName,
        phoneNo,
        imageUrl,
      );

      if (response.success && response.data != null) {
        return Right(response.data!.toEntity());
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAccount(String id) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      final HttpResponse response = await remoteDataSource.deleteAccount(id);

      if (response.response.statusCode == 200 || response.response.statusCode == 204) {
        await clearAuthData();
        return const Right(true);
      } else {
        return const Left(ServerFailure(message: 'Failed to delete account'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await clearAuthData();
      return const Right(true);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final String? token = await localDataSource.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<String?> getToken() async => await localDataSource.getToken();

  @override
  Future<String?> getUserId() async => await localDataSource.getUserId();

  @override
  Future<void> saveAuthData(String token, String userId) async {
    await localDataSource.saveToken(token);
    await localDataSource.saveUserId(userId);
    // CRITICAL: Immediately set token in API service for subsequent requests
    // This ensures the token is available right away without waiting for initialize()
    apiService.setToken(token);
    print('✅ Token saved and set in API service');
  }

  @override
  Future<void> clearAuthData() async {
    await localDataSource.clearAll();
  }

  Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure.timeout();
      case DioExceptionType.badResponse:
        final int? statusCode = error.response?.statusCode;
        // Try multiple possible error message fields from backend
        final responseData = error.response?.data;
        var message = 'An error occurred';
        
        if (responseData is Map<String, dynamic>) {
          message = responseData['message'] as String? ?? 
                   responseData['msg'] as String? ?? 
                   responseData['error'] as String? ?? 
                   responseData['detail'] as String? ?? 
                   'An error occurred';
        } else if (responseData is String) {
          message = responseData;
        }
        
        if (statusCode == 401) {
          return AuthFailure(message: message);
        } else if (statusCode == 422 || statusCode == 400) {
          return ValidationFailure(message: message);
        }
        return ServerFailure(message: message);
      case DioExceptionType.cancel:
        return const NetworkFailure(message: 'Request cancelled');
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return NetworkFailure.connectionError();
    }
  }
}
