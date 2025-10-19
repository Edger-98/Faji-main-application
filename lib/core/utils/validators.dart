import 'package:fajimobileapp/core/constants/app_constants.dart';

/// Comprehensive validation utilities for form inputs and data
class Validators {
  Validators._();

  /// Email validation with RFC 5322 compliance
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (value.length > AppConstants.maxEmailLength) {
      return 'Email is too long';
    }

    // RFC 5322 compliant email regex
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Password validation with strength requirements
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < AppConstants.minPasswordLength) {
      return 'Password must be at least ${AppConstants.minPasswordLength} characters';
    }

    if (value.length > AppConstants.maxPasswordLength) {
      return 'Password is too long';
    }

    // Check for at least one uppercase letter
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for at least one lowercase letter
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for at least one digit
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    // Check for at least one special character
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  /// Confirm password validation
  static String? confirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != originalPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

  /// Name validation (first name, last name, etc.)
  static String? name(String? value, {String fieldName = 'Name'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    if (value.length > AppConstants.maxNameLength) {
      return '$fieldName is too long';
    }

    // Check for valid name characters (letters, spaces, hyphens, apostrophes)
    if (!RegExp(r"^[a-zA-Z\s\-']+$").hasMatch(value)) {
      return '$fieldName can only contain letters, spaces, hyphens, and apostrophes';
    }

    // Check for minimum length
    if (value.trim().length < 2) {
      return '$fieldName must be at least 2 characters';
    }

    return null;
  }

  /// Phone number validation (international format)
  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Remove all non-digit characters for validation
    final String digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    // Check for minimum and maximum length
    if (digitsOnly.length < 10) {
      return 'Phone number is too short';
    }

    if (digitsOnly.length > 15) {
      return 'Phone number is too long';
    }

    // International phone number regex (with optional country code)
    final RegExp phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    
    if (!phoneRegex.hasMatch(digitsOnly)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  /// Required field validation
  static String? required(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Minimum length validation
  static String? minLength(String? value, int minLength, {String fieldName = 'Field'}) {
    if (value == null || value.isEmpty) {
      return null; // Let required validator handle empty values
    }

    if (value.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }

    return null;
  }

  /// Maximum length validation
  static String? maxLength(String? value, int maxLength, {String fieldName = 'Field'}) {
    if (value == null || value.isEmpty) {
      return null; // Let required validator handle empty values
    }

    if (value.length > maxLength) {
      return '$fieldName must be no more than $maxLength characters';
    }

    return null;
  }

  /// Numeric validation
  static String? numeric(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.isEmpty) {
      return null; // Let required validator handle empty values
    }

    if (double.tryParse(value) == null) {
      return '$fieldName must be a valid number';
    }

    return null;
  }

  /// Integer validation
  static String? integer(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.isEmpty) {
      return null; // Let required validator handle empty values
    }

    if (int.tryParse(value) == null) {
      return '$fieldName must be a valid integer';
    }

    return null;
  }

  /// URL validation
  static String? url(String? value, {String fieldName = 'URL'}) {
    if (value == null || value.isEmpty) {
      return null; // Let required validator handle empty values
    }

    final Uri? uri = Uri.tryParse(value);
    if (uri == null || !uri.hasScheme || (!uri.scheme.startsWith('http'))) {
      return 'Please enter a valid $fieldName';
    }

    return null;
  }

  /// Date validation (ISO 8601 format)
  static String? date(String? value, {String fieldName = 'Date'}) {
    if (value == null || value.isEmpty) {
      return null; // Let required validator handle empty values
    }

    try {
      DateTime.parse(value);
      return null;
    } catch (e) {
      return 'Please enter a valid $fieldName';
    }
  }

  /// Age validation
  static String? age(String? value, {int minAge = 0, int maxAge = 150}) {
    if (value == null || value.isEmpty) {
      return null; // Let required validator handle empty values
    }

    final int? ageValue = int.tryParse(value);
    if (ageValue == null) {
      return 'Please enter a valid age';
    }

    if (ageValue < minAge) {
      return 'Age must be at least $minAge';
    }

    if (ageValue > maxAge) {
      return 'Age must be no more than $maxAge';
    }

    return null;
  }

  /// Credit card number validation (Luhn algorithm)
  static String? creditCard(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Let required validator handle empty values
    }

    // Remove spaces and hyphens
    final String cleanValue = value.replaceAll(RegExp(r'[\s\-]'), '');

    // Check if all characters are digits
    if (!RegExp(r'^\d+$').hasMatch(cleanValue)) {
      return 'Credit card number can only contain digits';
    }

    // Check length (most cards are 13-19 digits)
    if (cleanValue.length < 13 || cleanValue.length > 19) {
      return 'Credit card number must be 13-19 digits';
    }

    // Luhn algorithm validation
    if (!_isValidLuhn(cleanValue)) {
      return 'Please enter a valid credit card number';
    }

    return null;
  }

  /// Postal code validation (flexible format)
  static String? postalCode(String? value, {String fieldName = 'Postal code'}) {
    if (value == null || value.isEmpty) {
      return null; // Let required validator handle empty values
    }

    // Allow alphanumeric characters, spaces, and hyphens
    if (!RegExp(r'^[a-zA-Z0-9\s\-]+$').hasMatch(value)) {
      return '$fieldName contains invalid characters';
    }

    if (value.length < 3 || value.length > 10) {
      return '$fieldName must be 3-10 characters';
    }

    return null;
  }

  /// Combine multiple validators
  static String? Function(String?) combine(List<String? Function(String?)> validators) {
    return (String? value) {
      for (final String? Function(String?) validator in validators) {
        final String? result = validator(value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }

  /// Luhn algorithm implementation for credit card validation
  static bool _isValidLuhn(String cardNumber) {
    int sum = 0;
    bool alternate = false;

    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);

      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }

      sum += digit;
      alternate = !alternate;
    }

    return sum % 10 == 0;
  }
}