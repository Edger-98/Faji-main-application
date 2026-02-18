/// Application-wide configuration
class AppConfig {
  AppConfig._();

  // Currency Configuration
  static const String currencyCode = 'USD';
  static const String currencySymbol = r'$';
  static const String currencyName = 'US Dollar';

  /// Format price with configured currency
  static String formatPrice(double price, {int decimals = 2}) {
    if (price >= 1000000) {
      return '$currencySymbol${(price / 1000000).toStringAsFixed(1)}M';
    } else if (price >= 1000) {
      return '$currencySymbol${(price / 1000).toStringAsFixed(1)}K';
    }
    return '$currencySymbol${price.toStringAsFixed(decimals)}';
  }

  /// Format price without abbreviation
  static String formatPriceFull(double price, {int decimals = 2}) => '$currencySymbol${price.toStringAsFixed(decimals)}';

  /// Get currency display (e.g., "USD ($)")
  static String get currencyDisplay => '$currencyCode ($currencySymbol)';
}
