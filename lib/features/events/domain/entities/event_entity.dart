import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_entity.freezed.dart';

/// Event entity - domain layer
@freezed
class EventEntity with _$EventEntity {
  const factory EventEntity({
    required String id,
    required String title,
    required String description,
    required String organizerId,
    required String organizerName,
    String? organizerImage,
    required String category,
    required DateTime startDate,
    required DateTime endDate,
    required String location,
    required double latitude,
    required double longitude,
    required String imageUrl,
    List<String>? images,
    required double price,
    String? currency,
    required int totalTickets,
    required int availableTickets,
    bool? isFeatured,
    bool? isTrending,
    bool? isFlashDeal,
    @Default(false) bool isCancelled,
    double? discountPercentage,
    double? rating,
    int? reviewCount,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _EventEntity;

  const EventEntity._();

  bool get isSoldOut => availableTickets <= 0;
  bool get hasDiscount => discountPercentage != null && discountPercentage! > 0;
  double get discountedPrice => hasDiscount 
      ? price * (1 - (discountPercentage! / 100))
      : price;
}

