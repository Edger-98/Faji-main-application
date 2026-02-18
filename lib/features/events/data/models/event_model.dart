import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';

class EventModel {

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
    this.currencySymbol,
    required this.totalTickets,
    required this.availableTickets,
    this.soldTickets,
    this.isFree = false,
    this.ticketingEnabled = false,
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
    // Handle nested data structure (API returns {success: true, data: {...}})
    final data = json['data'] ?? json;
    
    // Parse dates - handle both old and new API formats
    DateTime startDate = DateTime.now();
    DateTime endDate = DateTime.now();
    
    final parsedStartDate = _parseDateSafely(data['startDate']) ?? _parseDateSafely(data['date']);
    if (parsedStartDate != null) {
      startDate = parsedStartDate;
    }
    
    final parsedEndDate = _parseDateSafely(data['endDate']);
    if (parsedEndDate != null) {
      endDate = parsedEndDate;
    } else {
      endDate = startDate.add(const Duration(hours: 3));
    }
    
    // Parse location - handle nested object
    String locationAddress = '';
    double latitude = 0.0;
    double longitude = 0.0;
    
    if (data['location'] is Map) {
      final locationMap = data['location'] as Map<String, dynamic>;
      locationAddress = (locationMap['address'] as String?) ?? '';
      latitude = (locationMap['latitude'] as num?)?.toDouble() ?? 0.0;
      longitude = (locationMap['longitude'] as num?)?.toDouble() ?? 0.0;
    } else if (data['location'] is String) {
      locationAddress = data['location'] as String;
      latitude = (data['latitude'] as num?)?.toDouble() ?? 0.0;
      longitude = (data['longitude'] as num?)?.toDouble() ?? 0.0;
    }
    
    // Parse host - handle nested object
    String hostId = '';
    String hostName = '';
    String? hostImage;
    
    if (data['host'] is Map) {
      final hostMap = data['host'] as Map<String, dynamic>;
      // Handle Mongoose ObjectId with buffer
      final rawId = hostMap['id'] ?? hostMap['_id'];
      if (rawId is String) {
        hostId = rawId;
      } else if (rawId is Map && rawId.containsKey('buffer')) {
        // Skip buffer objects - they can't be converted to string IDs easily
        hostId = '';
      } else if (rawId != null) {
        hostId = rawId.toString();
      }
      hostName = (hostMap['name'] ?? hostMap['email'] ?? 'Unknown Host').toString();
      hostImage = hostMap['avatar'] as String?;
      if (hostImage != null && hostImage.isEmpty) hostImage = null;
    } else {
      hostId = (data['userId'] ?? data['organizer_id'] ?? data['hostId'] ?? '').toString();
      hostName = (data['event_organizer'] ?? data['organizerName'] ?? data['hostName'] as String?) ?? 'Unknown Host';
      hostImage = data['organizerImage'] as String?;
    }
    
    // Get imageUrl
    final String imageUrl;
    if (data['imageUrl'] != null && (data['imageUrl'] as String).isNotEmpty) {
      imageUrl = data['imageUrl'] as String;
    } else if (data['media'] is Map && data['media']['poster'] != null) {
      imageUrl = data['media']['poster'] as String;
    } else if (data['images'] is List && (data['images'] as List).isNotEmpty) {
      imageUrl = (data['images'] as List)[0].toString();
    } else {
      imageUrl = '';
    }
    
    // Parse stats for tickets - handle Mongoose document objects
    int totalTickets = 0;
    int availableTickets = 0;
    int soldTickets = 0;
    bool isFree = false;
    bool ticketingEnabled = false;
    String? currencySymbol;
    double price = 0.0;
    String? currency;
    
    // Check if ticketing object exists (new backend format)
    if (data['ticketing'] is Map) {
      final ticketingMap = data['ticketing'] as Map<String, dynamic>;
      ticketingEnabled = ticketingMap['enabled'] as bool? ?? false;
      price = (ticketingMap['price'] as num?)?.toDouble() ?? 0.0;
      currency = ticketingMap['currency'] as String? ?? 'USD';
      currencySymbol = ticketingMap['currencySymbol'] as String? ?? '\$';
      totalTickets = ticketingMap['totalTickets'] as int? ?? 0;
      availableTickets = ticketingMap['availableTickets'] as int? ?? 0;
      soldTickets = ticketingMap['soldTickets'] as int? ?? 0;
      isFree = ticketingMap['isFree'] as bool? ?? false;
    } else {
      // Fallback to old format
      if (data['stats'] is Map) {
        var statsMap = data['stats'] as Map<String, dynamic>;
        
        // If stats contains Mongoose internal data, extract the actual document
        if (statsMap.containsKey('_doc')) {
          statsMap = statsMap['_doc'] as Map<String, dynamic>;
        }
        
        totalTickets = (statsMap['expectedGuests'] as num?)?.toInt() ?? 0;
        availableTickets = totalTickets - ((statsMap['confirmedGuests'] as num?)?.toInt() ?? 0);
      } else {
        totalTickets = (data['seats'] ?? data['totalTickets'] as num?)?.toInt() ?? 0;
        soldTickets = (data['ticketsSold'] as num?)?.toInt() ?? 0;
        availableTickets = (data['ticketsLeft'] ?? data['availableTickets'] as num?)?.toInt() ?? (totalTickets - soldTickets);
      }
      
      price = (data['price'] as num?)?.toDouble() ?? 0.0;
      currency = data['currency'] as String? ?? 'USD';
      currencySymbol = data['currencySymbol'] as String?;
      isFree = price == 0.0;
      ticketingEnabled = totalTickets > 0;
    }
    
    // Parse category - handle emoji format
    String category = '';
    if (data['category'] is String) {
      category = data['category'] as String;
    }
    if (data['emoji'] != null) {
      final emoji = data['emoji'] as String;
      category = category.isNotEmpty ? '$emoji $category' : emoji;
    }
    if (category.isEmpty) category = 'General';
    
    return EventModel(
      id: (data['_id'] ?? data['id'] ?? '').toString(),
      title: (data['name'] ?? data['eventTitle'] ?? data['title'] as String?) ?? '',
      description: (data['description'] as String?) ?? 'No description available',
      organizerId: hostId,
      organizerName: hostName,
      organizerImage: hostImage,
      category: category,
      startDate: startDate,
      endDate: endDate,
      location: locationAddress,
      latitude: latitude,
      longitude: longitude,
      imageUrl: imageUrl,
      images: data['images'] is List 
          ? (data['images'] as List).map((dynamic x) => x.toString()).toList()
          : null,
      price: price,
      currency: currency,
      currencySymbol: currencySymbol,
      totalTickets: totalTickets,
      availableTickets: availableTickets,
      soldTickets: soldTickets,
      isFree: isFree,
      ticketingEnabled: ticketingEnabled,
      isFeatured: (data['is_featured'] ?? data['isFeatured']) as bool? ?? false,
      isTrending: (data['is_trending'] ?? data['isTrending']) as bool? ?? false,
      isFlashDeal: (data['is_flash_deal'] ?? data['isFlashDeal']) as bool? ?? false,
      isCancelled: (data['status'] as String?) == 'cancelled',
      discountPercentage: (data['discount_percentage'] ?? data['discountPercentage'] as num?)?.toDouble(),
      rating: (data['rating'] as num?)?.toDouble(),
      reviewCount: (data['review_count'] ?? data['reviewCount']) as int?,
      tags: data['tags'] is List
          ? (data['tags'] as List).map((dynamic x) => x.toString()).toList()
          : null,
      createdAt: _parseDateSafely(data['createdAt']),
      updatedAt: _parseDateSafely(data['updatedAt']),
    );
  }
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
  final String? currencySymbol;
  final int totalTickets;
  final int availableTickets;
  final int? soldTickets;
  final bool isFree;
  final bool ticketingEnabled;
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

  /// Helper to safely parse dates that might be objects, strings, or null
  static DateTime? _parseDateSafely(dateValue) {
    if (dateValue == null) return null;
    
    try {
      // If it's already a DateTime
      if (dateValue is DateTime) return dateValue;
      
      // If it's a string
      if (dateValue is String) {
        if (dateValue.isEmpty) return null;
        return DateTime.parse(dateValue);
      }
      
      // If it's a Map (Mongoose date object), try to extract the value
      if (dateValue is Map) {
        // Check for common date object patterns
        if (dateValue.containsKey(r'$date')) {
          return DateTime.parse(dateValue[r'$date'].toString());
        }
        // If it's an empty object, return null
        if (dateValue.isEmpty) return null;
      }
      
      // Try to convert to string and parse
      final String dateStr = dateValue.toString();
      if (dateStr.isEmpty || dateStr == '{}') return null;
      return DateTime.parse(dateStr);
    } catch (e) {
      return null;
    }
  }

  EventEntity toEntity() => EventEntity(
        id: id,
        title: title,
        description: description,
        hostId: organizerId,
        hostName: organizerName,
        hostImage: organizerImage,
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
        currencySymbol: currencySymbol,
        totalTickets: totalTickets,
        availableTickets: availableTickets,
        soldTickets: soldTickets,
        isFree: isFree,
        ticketingEnabled: ticketingEnabled,
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
        'images': images == null ? null : List<dynamic>.from(images!.map((x) => x)),
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
        'tags': tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

