import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/auth_token_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/auth_token_model.dart';
import '../models/user_model.dart';

/// Auth repository implementation
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

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
      final response = await remoteDataSource.login({
        'email': email,
        'password': password,
        if (expoPushToken != null) 'expoPushToken': expoPushToken,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        // Parse the response data - handle both wrapped and direct responses
        final responseData = response.data as Map<String, dynamic>;
        
        // Check if response has 'data' field (wrapped response)
        final actualData = responseData.containsKey('data') 
            ? responseData['data'] as Map<String, dynamic>
            : responseData;
        
        final authData = AuthTokenModel.fromJson(actualData);
        await saveAuthData(authData.token, authData.userId);
        
        // Save user data for quick access
        final userObj = actualData['user'] as Map<String, dynamic>?;
        await localDataSource.saveUserData(
          (userObj?['firstName'] as String?) ?? '',
          (userObj?['lastName'] as String?) ?? '',
          authData.email,
          phoneNo: userObj?['phoneNo'] as String?,
        );
        
        return Right(authData.toEntity());
      } else {
        // Extract error message from response
        final responseData = response.data as Map<String, dynamic>?;
        final errorMessage = responseData?['message'] ?? 
                           responseData?['msg'] ?? 
                           responseData?['error'] ?? 
                           'Login failed';
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
      final response = await remoteDataSource.signup({
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
        final responseData = response.data as Map<String, dynamic>;
        final authData = AuthTokenModel.fromJson(responseData);
        await saveAuthData(authData.token, authData.userId);
        return Right(authData.toEntity());
      } else {
        return Left(ServerFailure(message: 'Signup failed'));
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
      final response = await remoteDataSource.sendOtp({
        'email': email,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(ServerFailure(message: 'Failed to send OTP'));
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
      final response = await remoteDataSource.verifyOtp({
        'email': email,
        'otp': otp,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(ServerFailure(message: 'Invalid OTP'));
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
      final response = await remoteDataSource.forgetPassword({
        'email': email,
      });

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(ServerFailure(message: 'Failed to send reset link'));
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
      final response = await remoteDataSource.updatePassword(
        token,
        {
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        },
      );

      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(ServerFailure(message: 'Failed to update password'));
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
      final response = await remoteDataSource.getUserById(id);

      if (response.response.statusCode == 200) {
        // Parse the response data - Response normalizer wraps it as {success, message, data}
        final responseData = response.data as Map<String, dynamic>;
        
        // Check if response is normalized (has 'data' field)
        final dataField = responseData['data'];
        Map<String, dynamic> userJson;
        
        if (dataField != null) {
          // Response is normalized, extract from data field
          if (dataField is Map<String, dynamic>) {
            // Check if data contains 'user' field or is the user object itself
            userJson = dataField['user'] as Map<String, dynamic>? ?? dataField;
          } else {
            return Left(ServerFailure(message: 'Invalid user data format'));
          }
        } else {
          // Response is not normalized, check for 'user' field
          userJson = responseData['user'] as Map<String, dynamic>? ?? responseData;
        }
        
        final userData = UserModel.fromJson(userJson);
        
        // Save user data locally for offline access
        await localDataSource.saveUserData(
          userData.firstName,
          userData.lastName,
          userData.email,
          phoneNo: userData.phoneNo,
        );
        
        return Right(userData.toEntity());
      } else {
        return Left(ServerFailure(message: 'Failed to get user'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: 'Error loading user: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateSettings({
    required String id,
    String? firstName,
    String? lastName,
    String? phoneNo,
    String? imagePath,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure.noConnection());
    }

    try {
      File? imageFile;
      if (imagePath != null) {
        imageFile = File(imagePath);
      }

      final response = await remoteDataSource.updateSettings(
        id,
        firstName,
        lastName,
        phoneNo,
        imageFile,
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
      final response = await remoteDataSource.deleteAccount(id);

      if (response.response.statusCode == 200 || response.response.statusCode == 204) {
        await clearAuthData();
        return const Right(true);
      } else {
        return Left(ServerFailure(message: 'Failed to delete account'));
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
    final token = await localDataSource.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<String?> getToken() async {
    return await localDataSource.getToken();
  }

  @override
  Future<String?> getUserId() async {
    return await localDataSource.getUserId();
  }

  @override
  Future<void> saveAuthData(String token, String userId) async {
    await localDataSource.saveToken(token);
    await localDataSource.saveUserId(userId);
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
        final statusCode = error.response?.statusCode;
        // Try multiple possible error message fields from backend
        final responseData = error.response?.data;
        String message = 'An error occurred';
        
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
