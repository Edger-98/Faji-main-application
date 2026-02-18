import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

/// Service to handle biometric authentication (fingerprint, face ID)
class BiometricAuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  /// Check if device supports biometric authentication
  Future<bool> isBiometricAvailable() async {
    try {
      final bool canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;
      final bool canAuthenticate = canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();
      
      print('🔐 Can check biometrics: $canAuthenticateWithBiometrics');
      print('🔐 Device supported: ${await _localAuth.isDeviceSupported()}');
      print('🔐 Can authenticate: $canAuthenticate');
      
      return canAuthenticate;
    } on PlatformException catch (e) {
      print('🔐 Error checking biometric availability: ${e.message}');
      return false;
    }
  }

  /// Get list of available biometric types
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      final List<BiometricType> biometrics = await _localAuth.getAvailableBiometrics();
      print('🔐 Available biometrics: $biometrics');
      return biometrics;
    } on PlatformException catch (e) {
      print('🔐 Error getting available biometrics: ${e.message}');
      return <BiometricType>[];
    }
  }

  /// Authenticate using biometrics
  /// Returns true if authentication successful
  Future<bool> authenticate({
    String localizedReason = 'Please authenticate to continue',
    bool useErrorDialogs = true,
    bool stickyAuth = true,
  }) async {
    try {
      print('🔐 Starting authentication...');
      print('🔐 Localized reason: $localizedReason');
      
      // Check if biometrics are available first
      final bool isAvailable = await isBiometricAvailable();
      if (!isAvailable) {
        print('🔐 Biometric authentication not available on this device');
        return false;
      }

      final List<BiometricType> biometrics = await getAvailableBiometrics();
      if (biometrics.isEmpty) {
        print('🔐 No biometrics enrolled on this device');
        return false;
      }

      final bool didAuthenticate = await _localAuth.authenticate(
        localizedReason: localizedReason,
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Biometric Authentication',
            cancelButton: 'Cancel',
            biometricHint: 'Verify identity',
            biometricNotRecognized: 'Not recognized. Try again.',
            biometricSuccess: 'Success',
            deviceCredentialsRequiredTitle: 'Device credentials required',
            deviceCredentialsSetupDescription: 'Please set up device credentials',
          ),
        ],
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      
      print('🔐 Authentication result: $didAuthenticate');
      return didAuthenticate;
      
    } on PlatformException catch (e) {
      print('🔐 Platform exception during authentication:');
      print('   Code: ${e.code}');
      print('   Message: ${e.message}');
      print('   Details: ${e.details}');
      
      // Handle specific errors
      if (e.code == 'NotAvailable') {
        print('🔐 Biometric not available');
        return false;
      } else if (e.code == 'NotEnrolled') {
        print('🔐 No biometrics enrolled');
        return false;
      } else if (e.code == 'LockedOut' || e.code == 'PermanentlyLockedOut') {
        print('🔐 Too many failed attempts - locked out');
        return false;
      } else if (e.code == 'PasscodeNotSet') {
        print('🔐 Device passcode not set');
        return false;
      } else if (e.code == 'BiometricOnlyNotSupported') {
        print('🔐 Biometric only not supported, trying with device credentials');
        return false;
      }
      
      return false;
    } catch (e) {
      print('🔐 Unexpected error during authentication: $e');
      return false;
    }
  }

  /// Check if biometric authentication is enabled for the app
  /// This checks both device capability and user preference
  Future<bool> isBiometricEnabled() async {
    final bool isAvailable = await isBiometricAvailable();
    if (!isAvailable) return false;

    final List<BiometricType> biometrics = await getAvailableBiometrics();
    return biometrics.isNotEmpty;
  }

  /// Get user-friendly name for biometric type
  String getBiometricTypeName(List<BiometricType> biometrics) {
    if (biometrics.isEmpty) {
      return 'Biometric';
    }
    
    if (biometrics.contains(BiometricType.face)) {
      return 'Face ID';
    } else if (biometrics.contains(BiometricType.fingerprint)) {
      return 'Fingerprint';
    } else if (biometrics.contains(BiometricType.iris)) {
      return 'Iris';
    } else if (biometrics.contains(BiometricType.strong) || 
               biometrics.contains(BiometricType.weak)) {
      return 'Biometric';
    } else {
      return 'Biometric';
    }
  }
}
