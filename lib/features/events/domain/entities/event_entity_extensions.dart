import 'package:fajimobileapp/core/config/app_config.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';

/// Extension methods for EventEntity to help with display formatting
extension EventEntityDisplay on EventEntity {
  /// Get a safe image URL with fallback
  String get displayImageUrl {
    if (imageUrl.isNotEmpty) {
      return imageUrl;
    }
    // Return empty string - UI will show gradient fallback
    return '';
  }
  
  /// Get formatted price string
  String get displayPrice {
    if (price > 0) {
      return 'From ${AppConfig.formatPriceFull(price)}';
    }
    return 'Free';
  }
  
  /// Check if event should show as "live" or trending
  bool get isLiveOrTrending => isTrending == true || isFeatured == true;
}
