/// Input sanitization utilities for security and data consistency
class Sanitizers {
  Sanitizers._();

  /// Sanitize email input
  static String email(String input) => input.trim().toLowerCase();

  /// Sanitize name input (capitalize first letter of each word)
  static String name(String input) {
    if (input.isEmpty) return input;
    
    return input
        .trim()
        .split(' ')
        .where((String word) => word.isNotEmpty)
        .map((String word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  /// Sanitize phone number (remove all non-digit characters except +)
  static String phoneNumber(String input) {
    // Keep only digits and leading +
    var sanitized = input.replaceAll(RegExp(r'[^\d+]'), '');
    
    // Ensure + is only at the beginning
    if (sanitized.contains('+')) {
      final parts = sanitized.split('+');
      sanitized = '+${parts.where((String part) => part.isNotEmpty).join()}';
    }
    
    return sanitized;
  }

  /// Sanitize text input (remove dangerous characters, trim whitespace)
  static String text(String input, {bool allowHtml = false}) {
    var sanitized = input.trim();
    
    if (!allowHtml) {
      // Remove HTML tags
      sanitized = sanitized.replaceAll(RegExp('<[^>]*>'), '');
      
      // Remove potentially dangerous characters
   //   sanitized = sanitized.replaceAll(RegExp(r'[<>"\']'), '');
    }
    
    // Normalize whitespace
    sanitized = sanitized.replaceAll(RegExp(r'\s+'), ' ');
    
    return sanitized;
  }

  /// Sanitize URL input
  static String url(String input) {
    var sanitized = input.trim().toLowerCase();
    
    // Add protocol if missing
    if (!sanitized.startsWith('http://') && !sanitized.startsWith('https://')) {
      sanitized = 'https://$sanitized';
    }
    
    return sanitized;
  }

  /// Sanitize numeric input
  static String numeric(String input) {
    // Keep only digits, decimal point, and minus sign
    return input.replaceAll(RegExp(r'[^\d.\-]'), '');
  }

  /// Sanitize integer input
  static String integer(String input) {
    // Keep only digits and minus sign
    return input.replaceAll(RegExp(r'[^\d\-]'), '');
  }

  /// Sanitize credit card number
  static String creditCard(String input) {
    // Remove all non-digit characters
    return input.replaceAll(RegExp(r'[^\d]'), '');
  }

  /// Sanitize postal code
  static String postalCode(String input) {
    // Keep alphanumeric characters, spaces, and hyphens, convert to uppercase
    return input
        .replaceAll(RegExp(r'[^a-zA-Z0-9\s\-]'), '')
        .trim()
        .toUpperCase();
  }

  /// Remove SQL injection patterns
  static String sqlSafe(String input) {
    var sanitized = input.trim();
    
    // Remove common SQL injection patterns
    final sqlPatterns = <String>[
      "'",
      '"',
      ';',
      '--',
      r'/\*',
      r'\*/',
      'xp_',
      'sp_',
      'exec',
      'execute',
      'select',
      'insert',
      'update',
      'delete',
      'drop',
      'create',
      'alter',
      'union',
      'script',
    ];
    
    for (final pattern in sqlPatterns) {
      sanitized = sanitized.replaceAll(RegExp(pattern, caseSensitive: false), '');
    }
    
    return sanitized;
  }

  /// Remove XSS (Cross-Site Scripting) patterns
  static String xssSafe(String input) {
    var sanitized = input.trim();
    
    // Remove script tags and their content
    sanitized = sanitized.replaceAll(RegExp(r'<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>', caseSensitive: false), '');
    
    // Remove javascript: protocol
    sanitized = sanitized.replaceAll(RegExp('javascript:', caseSensitive: false), '');
    
    // Remove on* event handlers
    sanitized = sanitized.replaceAll(RegExp(r'on\w+\s*=', caseSensitive: false), '');
    
    // Remove potentially dangerous HTML tags
    final dangerousTags = <String>[
      'script',
      'iframe',
      'object',
      'embed',
      'form',
      'input',
      'textarea',
      'button',
      'select',
      'option',
      'link',
      'meta',
      'style',
    ];
    
    for (final tag in dangerousTags) {
      sanitized = sanitized.replaceAll(
        RegExp('</?$tag\\b[^>]*>', caseSensitive: false),
        '',
      );
    }
    
    return sanitized;
  }

  /// Sanitize filename for safe storage
  static String filename(String input) {
    var sanitized = input.trim();
    
    // Remove path separators and dangerous characters
    sanitized = sanitized.replaceAll(RegExp(r'[/\\:*?"<>|]'), '');
    
    // Remove leading/trailing dots and spaces
  //  sanitized = sanitized.replaceAll(RegExp(r'^[.\s]+|[.\s]+$'), '');$'), '');
    
    // Limit length
    if (sanitized.length > 255) {
      sanitized = sanitized.substring(0, 255);
    }
    
    // Ensure it's not empty
    if (sanitized.isEmpty) {
      sanitized = 'file';
    }
    
    return sanitized;
  }

  /// Sanitize search query
  static String searchQuery(String input) {
    var sanitized = input.trim();
    
    // Remove special characters that might cause issues
    sanitized = sanitized.replaceAll(RegExp(r'[^\w\s\-_.]'), '');
    
    // Normalize whitespace
    sanitized = sanitized.replaceAll(RegExp(r'\s+'), ' ');
    
    // Limit length
    if (sanitized.length > 100) {
      sanitized = sanitized.substring(0, 100);
    }
    
    return sanitized;
  }

  /// Sanitize JSON string
  static String json(String input) {
    var sanitized = input.trim();
    
    // Escape special JSON characters
    sanitized = sanitized
        .replaceAll(r'\', r'\\')
        .replaceAll('"', r'\"')
        .replaceAll('\n', r'\n')
        .replaceAll('\r', r'\r')
        .replaceAll('\t', r'\t');
    
    return sanitized;
  }

  /// General purpose sanitizer with multiple options
  static String general(
    String input, {
    bool trimWhitespace = true,
    bool removeHtml = true,
    bool removeSql = true,
    bool removeXss = true,
    int? maxLength,
    bool toLowerCase = false,
    bool toUpperCase = false,
  }) {
    var sanitized = input;
    
    if (trimWhitespace) {
      sanitized = sanitized.trim();
    }
    
    if (removeHtml) {
      sanitized = sanitized.replaceAll(RegExp('<[^>]*>'), '');
    }
    
    if (removeSql) {
      sanitized = sqlSafe(sanitized);
    }
    
    if (removeXss) {
      sanitized = xssSafe(sanitized);
    }
    
    if (maxLength != null && sanitized.length > maxLength) {
      sanitized = sanitized.substring(0, maxLength);
    }
    
    if (toLowerCase) {
      sanitized = sanitized.toLowerCase();
    } else if (toUpperCase) {
      sanitized = sanitized.toUpperCase();
    }
    
    return sanitized;
  }
}