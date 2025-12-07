import 'event_entity.dart';

/// Extension methods for EventEntity to help with display formatting
extension EventEntityDisplay on EventEntity {
  /// Get a safe image URL with fallback
  String get displayImageUrl {
    if (imageUrl.isNotEmpty) {
      return imageUrl;
    }
    return 'https://via.placeholder.com/300x200?text=${Uri.encodeComponent(title)}';
  }
  
  /// Get formatted price string
  String get displayPrice {
    if (price > 0) {
      final currencySymbol = currency ?? '\$';
      return 'From $currencySymbol${price.toStringAsFixed(2)}';
    }
    return 'Free';
  }
  
  /// Check if event should show as "live" or trending
  bool get isLiveOrTrending {
    return isTrending == true || isFeatured == true;
  }
}
