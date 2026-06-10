import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Auth local data source for storing tokens and user data
abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
  Future<void> saveRefreshToken(String token);
  Future<String?> getRefreshToken();
  Future<void> saveUserId(String userId);
  Future<String?> getUserId();
  Future<void> saveUserEmail(String email);
  Future<String?> getUserEmail();
  Future<void> saveUserData(String firstName, String lastName, String email, {String? phoneNo});
  Future<Map<String, String?>> getUserData();
  Future<void> saveProfileImageUrl(String? url);
  Future<String?> getProfileImageUrl();
  Future<void> savePassword(String password);
  Future<String?> getPassword();
  Future<void> clearAll();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {

  AuthLocalDataSourceImpl({
    required this.secureStorage,
    required this.sharedPreferences,
  });
  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _userEmailKey = 'user_email';
  static const String _userFirstNameKey = 'user_first_name';
  static const String _userLastNameKey = 'user_last_name';
  static const String _userPhoneKey = 'user_phone';
  static const String _passwordKey = 'user_password';
  static const String _profileImageUrlKey = 'user_profile_image_url';

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async => await secureStorage.read(key: _tokenKey);

  @override
  Future<void> clearToken() async {
    await secureStorage.delete(key: _tokenKey);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await secureStorage.write(key: _refreshTokenKey, value: token);
  }

  @override
  Future<String?> getRefreshToken() async => await secureStorage.read(key: _refreshTokenKey);

  @override
  Future<void> saveUserId(String userId) async {
    await sharedPreferences.setString(_userIdKey, userId);
  }

  @override
  Future<String?> getUserId() async => sharedPreferences.getString(_userIdKey);

  @override
  Future<void> saveUserEmail(String email) async {
    await sharedPreferences.setString(_userEmailKey, email);
  }

  @override
  Future<String?> getUserEmail() async => sharedPreferences.getString(_userEmailKey);

  @override
  Future<void> saveUserData(String firstName, String lastName, String email, {String? phoneNo}) async {
    await sharedPreferences.setString(_userFirstNameKey, firstName);
    await sharedPreferences.setString(_userLastNameKey, lastName);
    await sharedPreferences.setString(_userEmailKey, email);
    if (phoneNo != null) {
      await sharedPreferences.setString(_userPhoneKey, phoneNo);
    }
  }

  @override
  Future<Map<String, String?>> getUserData() async => {
      'firstName': sharedPreferences.getString(_userFirstNameKey),
      'lastName': sharedPreferences.getString(_userLastNameKey),
      'email': sharedPreferences.getString(_userEmailKey),
      'phoneNo': sharedPreferences.getString(_userPhoneKey),
    };

  @override
  Future<void> saveProfileImageUrl(String? url) async {
    if (url != null) {
      await sharedPreferences.setString(_profileImageUrlKey, url);
    } else {
      await sharedPreferences.remove(_profileImageUrlKey);
    }
  }

  @override
  Future<String?> getProfileImageUrl() async =>
      sharedPreferences.getString(_profileImageUrlKey);

  @override
  Future<void> savePassword(String password) async {
    await secureStorage.write(key: _passwordKey, value: password);
  }

  @override
  Future<String?> getPassword() async => await secureStorage.read(key: _passwordKey);

  @override
  Future<void> clearAll() async {
    await secureStorage.deleteAll();
    await sharedPreferences.clear();
  }
}
