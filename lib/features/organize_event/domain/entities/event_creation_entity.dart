import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_creation_entity.freezed.dart';

/// Entity representing the event creation data across all steps
@freezed
class EventCreationEntity with _$EventCreationEntity {
  const factory EventCreationEntity({
    // Step 0: Event Type
    String? eventType,
    
    // Step 1: Event Details
    String? title,
    String? description,
    String? category, // Added category field
    String? imageUrl, // Cloudinary image URL (replaces poster/theme)
    String? localImagePath, // Local file path before upload
    DateTime? eventDate,
    String? eventTime,
    String? location,
    int? totalSeats,
    double? ticketPrice,
    
    // Step 2: Event Configuration
    int? expectedGuests,
    double? budget,
    @Default(false) bool enableWishlist,
    @Default(false) bool enableBudgetTracking,
    @Default(false) bool enableCohostMarketplace,
    
    // Step 3: Location Data
    double? latitude,
    double? longitude,
    
    // Co-host data (if enabled)
    List<String>? selectedCohostIds,
  }) = _EventCreationEntity;
}
