import 'theme_model.dart';
import 'poster_model.dart';
import 'ticketing_model.dart';

class EventModel {
  final String id;
  final String name;
  final String? description;
  final String category;
  final String emoji;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String status;
  final String role;
  final bool isBookmarked;
  final HostModel host;
  final LocationModel? location;
  final BudgetModel budget;
  final EventSettingsModel settings;
  final EventMediaModel media;
  final EventStatsModel stats;
  final String colorTheme;
  final ThemeModel? theme;
  final PosterModel? poster;
  final TicketingModel? ticketing; // NEW: Ticketing information

  EventModel({
    required this.id,
    required this.name,
    this.description,
    required this.category,
    required this.emoji,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.role,
    required this.isBookmarked,
    required this.host,
    this.location,
    required this.budget,
    required this.settings,
    required this.media,
    required this.stats,
    required this.colorTheme,
    this.theme,
    this.poster,
    this.ticketing, // NEW
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    try {
      print('🔍 Parsing EventModel from JSON...');
      print('   Raw JSON keys: ${json.keys.toList()}');
      
      // Parse each field with error handling
      final id = json['id'] as String;
      print('   ✓ id: $id');
      
      final name = json['name'] as String;
      print('   ✓ name: $name');
      
      final description = json['description'] as String?;
      final category = json['category'] as String? ?? 'Other';
      final emoji = json['emoji'] as String? ?? '🎉';
      
      print('   📅 Parsing dates...');
      print('      startDate type: ${json['startDate'].runtimeType}');
      print('      startDate value: ${json['startDate']}');
      final startDate = _parseDateTime(json['startDate']);
      print('   ✓ startDate: $startDate');
      
      final endDate = _parseDateTime(json['endDate']);
      print('   ✓ endDate: $endDate');
      
      final createdAt = _parseDateTime(json['createdAt']);
      print('   ✓ createdAt: $createdAt');
      
      final updatedAt = _parseDateTime(json['updatedAt']);
      print('   ✓ updatedAt: $updatedAt');
      
      final status = json['status'] as String? ?? 'upcoming';
      final role = json['role'] as String? ?? 'creator';
      final isBookmarked = json['isBookmarked'] as bool? ?? false;
      
      print('   👤 Parsing host...');
      final host = HostModel.fromJson(json['host'] as Map<String, dynamic>);
      print('   ✓ host: ${host.name}');
      
      print('   📍 Parsing location...');
      final location = json['location'] != null 
          ? LocationModel.fromJson(json['location'] as Map<String, dynamic>)
          : null;
      print('   ✓ location: ${location?.address ?? "none"}');
      
      print('   💰 Parsing budget...');
      final budget = json['budget'] != null
          ? BudgetModel.fromJson(json['budget'] as Map<String, dynamic>)
          : BudgetModel(
              total: 0,
              spent: 0,
              remaining: 0,
              currency: 'NGN',
              currencySymbol: '₦',
            );
      print('   ✓ budget: ${budget.total}');
      
      print('   ⚙️ Parsing settings...');
      final settings = json['settings'] != null
          ? EventSettingsModel.fromJson(json['settings'] as Map<String, dynamic>)
          : EventSettingsModel(
              isPublic: false,
              websiteLink: '',
              rsvpButtonText: 'RSVP',
              keepMemoriesPrivate: false,
              disableGuestMemories: false,
              acceptGuestContributions: true,
              disablePublicRSVP: false,
              enableWebhook: false,
            );
      print('   ✓ settings parsed');
      
      print('   🎬 Parsing media...');
      final media = json['media'] != null
          ? EventMediaModel.fromJson(json['media'] as Map<String, dynamic>)
          : EventMediaModel(preEventMedia: []);
      print('   ✓ media parsed');
      
      print('   📊 Parsing stats...');
      final stats = json['stats'] != null
          ? EventStatsModel.fromJson(json['stats'] as Map<String, dynamic>)
          : EventStatsModel(
              expectedGuests: 0,
              confirmedGuests: 0,
              invitedGuests: 0,
              taskCount: 0,
              completedTasks: 0,
              vendorCount: 0,
              plannerCount: 0,
            );
      print('   ✓ stats parsed');
      
      final colorTheme = json['colorTheme'] as String? ?? json['theme']?['id'] as String? ?? 'green';
      
      final theme = json['theme'] != null
          ? ThemeModel.fromJson(json['theme'] as Map<String, dynamic>)
          : null;
      
      final poster = json['poster'] != null
          ? PosterModel.fromJson(json['poster'] as Map<String, dynamic>)
          : null;
      print('   ✓ poster: ${poster != null ? "present" : "none"}');
      
      print('   🎫 Parsing ticketing...');
      final ticketing = json['ticketing'] != null
          ? TicketingModel.fromJson(json['ticketing'] as Map<String, dynamic>)
          : null;
      print('   ✓ ticketing: ${ticketing != null ? "enabled=${ticketing.enabled}, price=${ticketing.price}" : "none"}');
      
      print('✅ EventModel parsed successfully');
      
      return EventModel(
        id: id,
        name: name,
        description: description,
        category: category,
        emoji: emoji,
        startDate: startDate,
        endDate: endDate,
        createdAt: createdAt,
        updatedAt: updatedAt,
        status: status,
        role: role,
        isBookmarked: isBookmarked,
        host: host,
        location: location,
        budget: budget,
        settings: settings,
        media: media,
        stats: stats,
        colorTheme: colorTheme,
        theme: theme,
        poster: poster,
        ticketing: ticketing, // NEW
      );
    } catch (e, stackTrace) {
      print('❌ ERROR parsing EventModel: $e');
      print('   Stack trace: $stackTrace');
      print('   JSON data: $json');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'emoji': emoji,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
      'role': role,
      'isBookmarked': isBookmarked,
      'colorTheme': colorTheme,
    };
  }

  // Helper method to safely parse DateTime from various formats
  static DateTime _parseDateTime(dynamic value) {
    if (value == null) {
      return DateTime.now();
    }
    
    // If it's already a DateTime, return it
    if (value is DateTime) {
      return value;
    }
    
    // If it's a string, parse it
    if (value is String) {
      try {
        return DateTime.parse(value);
      } catch (e) {
        print('⚠️ Failed to parse date string: $value');
        return DateTime.now();
      }
    }
    
    // If it's a Map (empty object {}), return current time
    if (value is Map) {
      print('⚠️ Received empty date object, using current time');
      return DateTime.now();
    }
    
    // If it's a number (timestamp), convert it
    if (value is num) {
      try {
        return DateTime.fromMillisecondsSinceEpoch(value.toInt());
      } catch (e) {
        print('⚠️ Failed to parse timestamp: $value');
        return DateTime.now();
      }
    }
    
    // Fallback to current time
    print('⚠️ Unknown date format: $value (${value.runtimeType})');
    return DateTime.now();
  }
}

class HostModel {
  final String id;
  final String name;
  final String? avatar;

  HostModel({
    required this.id,
    required this.name,
    this.avatar,
  });

  factory HostModel.fromJson(Map<String, dynamic> json) {
    try {
      print('      🔍 Parsing HostModel...');
      print('         Raw host JSON: $json');
      
      // Handle various id formats (string, buffer object, etc.)
      String hostId;
      final idValue = json['id'];
      print('         id type: ${idValue.runtimeType}');
      print('         id value: $idValue');
      
      if (idValue is String) {
        hostId = idValue;
      } else if (idValue is Map && idValue.containsKey('buffer')) {
        // MongoDB ObjectId buffer - convert to hex string
        print('         Converting buffer to hex...');
        final buffer = idValue['buffer'] as Map<String, dynamic>;
        hostId = buffer.values.map((v) => v.toRadixString(16).padLeft(2, '0')).join();
        print('         Converted ID: $hostId');
      } else {
        hostId = idValue?.toString() ?? 'unknown';
        print('         Using fallback ID: $hostId');
      }
      
      final name = json['name'] as String? ?? json['email'] as String? ?? 'Unknown';
      final avatar = json['avatar'] as String?;
      
      print('      ✓ HostModel parsed: id=$hostId, name=$name');
      
      return HostModel(
        id: hostId,
        name: name,
        avatar: avatar,
      );
    } catch (e, stackTrace) {
      print('      ❌ ERROR parsing HostModel: $e');
      print('         Stack trace: $stackTrace');
      rethrow;
    }
  }
}

class LocationModel {
  final String address;
  final double latitude;
  final double longitude;
  final String? placeId;

  LocationModel({
    required this.address,
    required this.latitude,
    required this.longitude,
    this.placeId,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    // Handle empty location object
    if (json.isEmpty) {
      return LocationModel(
        address: '',
        latitude: 0.0,
        longitude: 0.0,
        placeId: null,
      );
    }
    
    return LocationModel(
      address: json['address'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      placeId: json['placeId'] as String?,
    );
  }
}

class BudgetModel {
  final double total;
  final double spent;
  final double remaining;
  final String currency;
  final String currencySymbol;
  final double? progress;

  BudgetModel({
    required this.total,
    required this.spent,
    required this.remaining,
    required this.currency,
    required this.currencySymbol,
    this.progress,
  });

  factory BudgetModel.fromJson(Map<String, dynamic> json) {
    return BudgetModel(
      total: (json['total'] as num).toDouble(),
      spent: (json['spent'] as num).toDouble(),
      remaining: (json['remaining'] as num).toDouble(),
      currency: json['currency'] as String,
      currencySymbol: json['currencySymbol'] as String,
      progress: json['progress'] != null ? (json['progress'] as num).toDouble() : null,
    );
  }
}

class EventSettingsModel {
  final bool isPublic;
  final String websiteLink;
  final String rsvpButtonText;
  final bool keepMemoriesPrivate;
  final bool disableGuestMemories;
  final bool acceptGuestContributions;
  final bool disablePublicRSVP;
  final bool enableWebhook;
  final String? webhookUrl;

  EventSettingsModel({
    required this.isPublic,
    required this.websiteLink,
    required this.rsvpButtonText,
    required this.keepMemoriesPrivate,
    required this.disableGuestMemories,
    required this.acceptGuestContributions,
    required this.disablePublicRSVP,
    required this.enableWebhook,
    this.webhookUrl,
  });

  factory EventSettingsModel.fromJson(Map<String, dynamic> json) {
    return EventSettingsModel(
      isPublic: json['isPublic'] as bool,
      websiteLink: json['websiteLink'] as String,
      rsvpButtonText: json['rsvpButtonText'] as String,
      keepMemoriesPrivate: json['keepMemoriesPrivate'] as bool,
      disableGuestMemories: json['disableGuestMemories'] as bool,
      acceptGuestContributions: json['acceptGuestContributions'] as bool,
      disablePublicRSVP: json['disablePublicRSVP'] as bool,
      enableWebhook: json['enableWebhook'] as bool,
      webhookUrl: json['webhookUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isPublic': isPublic,
      'websiteLink': websiteLink,
      'rsvpButtonText': rsvpButtonText,
      'keepMemoriesPrivate': keepMemoriesPrivate,
      'disableGuestMemories': disableGuestMemories,
      'acceptGuestContributions': acceptGuestContributions,
      'disablePublicRSVP': disablePublicRSVP,
      'enableWebhook': enableWebhook,
      'webhookUrl': webhookUrl,
    };
  }
}

class EventMediaModel {
  final String? poster;
  final List<String> preEventMedia;

  EventMediaModel({
    this.poster,
    required this.preEventMedia,
  });

  factory EventMediaModel.fromJson(Map<String, dynamic> json) {
    return EventMediaModel(
      poster: json['poster'] as String?,
      preEventMedia: json['preEventMedia'] != null
          ? List<String>.from(json['preEventMedia'] as List)
          : [],
    );
  }
}

class EventStatsModel {
  final int expectedGuests;
  final int confirmedGuests;
  final int invitedGuests;
  final int taskCount;
  final int completedTasks;
  final int vendorCount;
  final int plannerCount;

  EventStatsModel({
    required this.expectedGuests,
    required this.confirmedGuests,
    required this.invitedGuests,
    required this.taskCount,
    required this.completedTasks,
    required this.vendorCount,
    required this.plannerCount,
  });

  factory EventStatsModel.fromJson(Map<String, dynamic> json) {
    // Handle Mongoose internal structure - check if data is in _doc
    final data = json.containsKey('_doc') ? json['_doc'] as Map<String, dynamic> : json;
    
    return EventStatsModel(
      expectedGuests: data['expectedGuests'] as int? ?? 0,
      confirmedGuests: data['confirmedGuests'] as int? ?? 0,
      invitedGuests: data['invitedGuests'] as int? ?? 0,
      taskCount: data['taskCount'] as int? ?? 0,
      completedTasks: data['completedTasks'] as int? ?? 0,
      vendorCount: data['vendorCount'] as int? ?? 0,
      plannerCount: data['plannerCount'] as int? ?? 0,
    );
  }
}
