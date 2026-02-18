import 'package:intl/intl.dart';

/// Formatting utilities for consistent data presentation
class Formatters {
  Formatters._();

  /// Format currency with locale support
  static String currency(
    double amount, {
    String locale = 'en_US',
    String symbol = r'$',
    int decimalDigits = 2,
  }) {
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: decimalDigits,
    );
    return formatter.format(amount);
  }

  /// Format percentage
  static String percentage(
    double value, {
    int decimalDigits = 1,
    String locale = 'en_US',
  }) {
    final formatter = NumberFormat.percentPattern(locale);
    formatter.maximumFractionDigits = decimalDigits;
    return formatter.format(value);
  }

  /// Format large numbers with abbreviations (K, M, B)
  static String compactNumber(
    num value, {
    String locale = 'en_US',
    int decimalDigits = 1,
  }) {
    final formatter = NumberFormat.compact(locale: locale);
    formatter.maximumFractionDigits = decimalDigits;
    return formatter.format(value);
  }

  /// Format phone number with standard formatting
  static String phoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    final digits = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    
    if (digits.length == 10) {
      // US format: (123) 456-7890
      return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    } else if (digits.length == 11 && digits.startsWith('1')) {
      // US format with country code: +1 (123) 456-7890
      return '+1 (${digits.substring(1, 4)}) ${digits.substring(4, 7)}-${digits.substring(7)}';
    } else if (digits.length > 10) {
      // International format: +XX XXX XXX XXXX
      final countryCode = digits.substring(0, digits.length - 10);
      final number = digits.substring(digits.length - 10);
      return '+$countryCode ${number.substring(0, 3)} ${number.substring(3, 6)} ${number.substring(6)}';
    }
    
    // Return original if can't format
    return phoneNumber;
  }

  /// Format credit card number with masking
  static String creditCard(String cardNumber, {bool maskDigits = true}) {
    final digits = cardNumber.replaceAll(RegExp(r'[^\d]'), '');
    
    if (digits.length < 13) return cardNumber;
    
    if (maskDigits) {
      // Show only last 4 digits: **** **** **** 1234
      final lastFour = digits.substring(digits.length - 4);
      final masked = '*' * (digits.length - 4);
      final combined = masked + lastFour;
      
      // Add spaces every 4 digits
      return combined.replaceAllMapped(
        RegExp('.{4}'),
        (Match match) => '${match.group(0)} ',
      ).trim();
    } else {
      // Format with spaces: 1234 5678 9012 3456
      return digits.replaceAllMapped(
        RegExp('.{4}'),
        (Match match) => '${match.group(0)} ',
      ).trim();
    }
  }

  /// Format date with various patterns
  static String date(
    DateTime date, {
    String pattern = 'MMM dd, yyyy',
    String locale = 'en_US',
  }) {
    final formatter = DateFormat(pattern, locale);
    return formatter.format(date);
  }

  /// Format time with various patterns
  static String time(
    DateTime time, {
    String pattern = 'hh:mm a',
    String locale = 'en_US',
  }) {
    final formatter = DateFormat(pattern, locale);
    return formatter.format(time);
  }

  /// Format relative time (e.g., "2 hours ago", "in 3 days")
  static String relativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.isNegative) {
      // Future time
      final futureDiff = dateTime.difference(now);
      
      if (futureDiff.inDays > 0) {
        return 'in ${futureDiff.inDays} ${futureDiff.inDays == 1 ? 'day' : 'days'}';
      } else if (futureDiff.inHours > 0) {
        return 'in ${futureDiff.inHours} ${futureDiff.inHours == 1 ? 'hour' : 'hours'}';
      } else if (futureDiff.inMinutes > 0) {
        return 'in ${futureDiff.inMinutes} ${futureDiff.inMinutes == 1 ? 'minute' : 'minutes'}';
      } else {
        return 'in a few seconds';
      }
    } else {
      // Past time
      if (difference.inDays > 0) {
        return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
      } else {
        return 'just now';
      }
    }
  }

  /// Format file size in human-readable format
  static String fileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
  }

  /// Format duration in human-readable format
  static String duration(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    
    final parts = <String>[];
    
    if (days > 0) {
      parts.add('${days}d');
    }
    if (hours > 0) {
      parts.add('${hours}h');
    }
    if (minutes > 0) {
      parts.add('${minutes}m');
    }
    if (seconds > 0 || parts.isEmpty) {
      parts.add('${seconds}s');
    }
    
    return parts.join(' ');
  }

  /// Format postal code based on country
  static String postalCode(String code, {String country = 'US'}) {
    final cleanCode = code.replaceAll(RegExp(r'[^\w]'), '').toUpperCase();
    
    switch (country.toUpperCase()) {
      case 'US':
        if (cleanCode.length == 5) {
          return cleanCode;
        } else if (cleanCode.length == 9) {
          return '${cleanCode.substring(0, 5)}-${cleanCode.substring(5)}';
        }
      case 'CA':
        if (cleanCode.length == 6) {
          return '${cleanCode.substring(0, 3)} ${cleanCode.substring(3)}';
        }
      case 'UK':
      case 'GB':
        if (cleanCode.length >= 5 && cleanCode.length <= 7) {
          final splitPoint = cleanCode.length - 3;
          return '${cleanCode.substring(0, splitPoint)} ${cleanCode.substring(splitPoint)}';
        }
    }
    
    return code; // Return original if can't format
  }

  /// Format name with proper capitalization
  static String name(String name) => name
        .trim()
        .split(' ')
        .where((String word) => word.isNotEmpty)
        .map((String word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');

  /// Format address for display
  static String address({
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
  }) {
    final parts = <String>[];
    
    if (street?.isNotEmpty ?? false) {
      parts.add(street!);
    }
    
    final cityStateParts = <String>[];
    if (city?.isNotEmpty ?? false) {
      cityStateParts.add(city!);
    }
    if (state?.isNotEmpty ?? false) {
      cityStateParts.add(state!);
    }
    if (postalCode?.isNotEmpty ?? false) {
      cityStateParts.add(postalCode!);
    }
    
    if (cityStateParts.isNotEmpty) {
      parts.add(cityStateParts.join(', '));
    }
    
    if (country?.isNotEmpty ?? false) {
      parts.add(country!);
    }
    
    return parts.join('\n');
  }

  /// Format list of items with proper grammar
  static String list(List<String> items, {String conjunction = 'and'}) {
    if (items.isEmpty) return '';
    if (items.length == 1) return items.first;
    if (items.length == 2) return '${items.first} $conjunction ${items.last}';
    
    final allButLast = items.sublist(0, items.length - 1);
    return '${allButLast.join(', ')}, $conjunction ${items.last}';
  }

  /// Format initials from name
  static String initials(String name, {int maxInitials = 2}) {
    final words = name.trim().split(' ');
    final initials = words
        .where((String word) => word.isNotEmpty)
        .take(maxInitials)
        .map((String word) => word[0].toUpperCase())
        .toList();
    
    return initials.join();
  }

  /// Format decimal number with specific precision
  static String decimal(
    double value, {
    int decimalPlaces = 2,
    bool removeTrailingZeros = false,
  }) {
    var formatted = value.toStringAsFixed(decimalPlaces);
    
    if (removeTrailingZeros) {
      formatted = formatted.replaceAll(RegExp(r'\.?0+$'), '');
    }
    
    return formatted;
  }
}