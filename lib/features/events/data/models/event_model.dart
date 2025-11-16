import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';

class EventModel {
  final String id;
  final String title;
  final String description;
  final String organizerId;
  final String organizerName;
  final String? organizerImage;
  final String category;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final List<String>? images;
  final double price;
  final String? currency;
  final int totalTickets;
  final int availableTickets;
  final bool? isFeatured;
  final bool? isTrending;
  final bool? isFlashDeal;
  final bool isCancelled;
  final double? discountPercentage;
  final double? rating;
  final int? reviewCount;
  final List<String>? tags;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.organizerId,
    required this.organizerName,
    this.organizerImage,
    required this.category,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    this.images,
    required this.price,
    this.currency,
    required this.totalTickets,
    required this.availableTickets,
    this.isFeatured,
    this.isTrending,
    this.isFlashDeal,
    this.isCancelled = false,
    this.discountPercentage,
    this.rating,
    this.reviewCount,
    this.tags,
    this.createdAt,
    this.updatedAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    // Parse date and time
    final dateStr = json['date'] as String?;
    final timeStr = json['time'] as String?;
    
    DateTime startDate = DateTime.now();
    DateTime endDate = DateTime.now();
    
    if (dateStr != null) {
      try {
        // Parse the date (handles both "2025-11-20" and "2025-11-20T00:00:00.000Z")
        startDate = DateTime.parse(dateStr);
        
        // If time is provided separately, update the time part
        if (timeStr != null && timeStr.isNotEmpty) {
          final timeParts = timeStr.split(':');
          if (timeParts.length >= 2) {
            final hour = int.tryParse(timeParts[0]) ?? 0;
            final minute = int.tryParse(timeParts[1]) ?? 0;
            startDate = DateTime(
              startDate.year,
              startDate.month,
              startDate.day,
              hour,
              minute,
            );
          }
        }
        // Assume event lasts 3 hours
        endDate = startDate.add(const Duration(hours: 3));
      } catch (e) {
        // If parsing fails, use current date
        startDate = DateTime.now();
        endDate = DateTime.now().add(const Duration(hours: 3));
      }
    }
    
    // Get first image from images array
    final imagesList = json['images'] as List<dynamic>?;
    final imageUrl = imagesList != null && imagesList.isNotEmpty
        ? imagesList[0].toString()
        : 'https://via.placeholder.com/400x300';
    
    // Calculate available tickets
    final seats = (json['seats'] as num?)?.toInt() ?? 0;
    final ticketsSold = (json['ticketsSold'] as num?)?.toInt() ?? 0;
    final ticketsLeft = (json['ticketsLeft'] as num?)?.toInt() ?? (seats - ticketsSold);
    
    return EventModel(
      id: (json['_id'] ?? json['id'] ?? '').toString(),
      title: (json['eventTitle'] ?? json['title'] as String?) ?? '',
      description: (json['description'] as String?) ?? 'No description available',
      organizerId: (json['userId'] ?? json['organizer_id'] ?? '').toString(),
      organizerName: (json['event_organizer'] ?? json['organizerName'] as String?) ?? 'Unknown Organizer',
      organizerImage: null, // Not provided in API
      category: (json['category'] as String?) ?? 'General',
      startDate: startDate,
      endDate: endDate,
      location: (json['location'] as String?) ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      imageUrl: imageUrl,
      images: imagesList?.map((dynamic x) => x.toString()).toList(),
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] as String? ?? 'USD',
      totalTickets: seats,
      availableTickets: ticketsLeft,
      isFeatured: (json['is_featured'] ?? json['isFeatured']) as bool? ?? false,
      isTrending: (json['is_trending'] ?? json['isTrending']) as bool? ?? false,
      isFlashDeal: (json['is_flash_deal'] ?? json['isFlashDeal']) as bool? ?? false,
      isCancelled: (json['status'] as String?) == 'cancelled',
      discountPercentage: (json['discount_percentage'] ?? json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['review_count'] ?? json['reviewCount']) as int?,
      tags: json['tags'] == null
          ? null
          : List<String>.from((json['tags'] as List<dynamic>).map((dynamic x) => x.toString())),
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt'].toString())
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'].toString())
          : null,
    );
  }

  EventEntity toEntity() => EventEntity(
        id: id,
        title: title,
        description: description,
        organizerId: organizerId,
        organizerName: organizerName,
        organizerImage: organizerImage,
        category: category,
        startDate: startDate,
        endDate: endDate,
        location: location,
        latitude: latitude,
        longitude: longitude,
        imageUrl: imageUrl,
        images: images,
        price: price,
        currency: currency,
        totalTickets: totalTickets,
        availableTickets: availableTickets,
        isFeatured: isFeatured,
        isTrending: isTrending,
        isFlashDeal: isFlashDeal,
        isCancelled: isCancelled,
        discountPercentage: discountPercentage,
        rating: rating,
        reviewCount: reviewCount,
        tags: tags,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'organizer_id': organizerId,
        'organizer_name': organizerName,
        'organizer_image': organizerImage,
        'category': category,
        'start_date': startDate.toIso8601String(),
        'end_date': endDate.toIso8601String(),
        'location': location,
        'latitude': latitude,
        'longitude': longitude,
        'image_url': imageUrl,
        'images': images == null ? null : List<dynamic>.from(images!.map((dynamic x) => x)),
        'price': price,
        'currency': currency,
        'total_tickets': totalTickets,
        'available_tickets': availableTickets,
        'is_featured': isFeatured,
        'is_trending': isTrending,
        'is_flash_deal': isFlashDeal,
        'is_cancelled': isCancelled,
        'discount_percentage': discountPercentage,
        'rating': rating,
        'review_count': reviewCount,
        'tags': tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

