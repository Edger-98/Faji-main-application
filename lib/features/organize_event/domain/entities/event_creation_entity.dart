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
    String? coverPhotoPath,
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
    
    // Step 3: Poster Selection
    String? selectedPosterId,
    
    // Step 4: Theme Selection
    String? selectedThemeId,
    
    // Co-host data (if enabled)
    List<String>? selectedCohostIds,
  }) = _EventCreationEntity;
}
