import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_entity.freezed.dart';

/// Event entity - domain layer
@freezed
class EventEntity with _$EventEntity {
  const factory EventEntity({
    required String id,
    required String title,
    required String description,
    required String hostId,
    required String hostName,
    String? hostImage,
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
    String? currencySymbol,
    required int totalTickets,
    required int availableTickets,
    int? soldTickets,
    @Default(false) bool isFree,
    @Default(false) bool ticketingEnabled,
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

  bool get isSoldOut => ticketingEnabled && availableTickets <= 0;
  bool get hasDiscount => discountPercentage != null && discountPercentage! > 0;
  double get discountedPrice => hasDiscount 
      ? price * (1 - (discountPercentage! / 100))
      : price;
  String get formattedPrice => '${currencySymbol ?? '\$'}${price.toStringAsFixed(2)}';
  bool get hasTickets => ticketingEnabled && !isFree;
}

