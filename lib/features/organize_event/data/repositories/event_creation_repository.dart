import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/models/theme_model.dart';
import '../../../../core/models/poster_model.dart';
import '../../../../core/models/event_model.dart';

class EventCreationRepository {
  final ApiService _api;

  EventCreationRepository(this._api);

  Future<List<ThemeModel>> getThemes() async {
    final response = await _api.get('/event-themes');
    final themes = (response.data['data']['themes'] as List)
        .map((e) => ThemeModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return themes;
  }

  Future<List<PosterModel>> getPosters({String? category}) async {
    final params = category != null ? {'category': category} : null;
    final response = await _api.get('/event-posters', params: params);
    final posters = (response.data['data']['posters'] as List)
        .map((e) => PosterModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return posters;
  }

  Future<EventModel> createEvent({
    required String name,
    required String category,
    required DateTime startDate,
    required DateTime endDate,
    String? description,
    String? emoji,
    String? imageUrl, // NEW: Replaces themeId and posterId
    String? websiteLink,
    String? rsvpButtonText,
    int? expectedGuests,
    double? budget,
    Map<String, dynamic>? location,
    Map<String, dynamic>? settings,
    Map<String, dynamic>? ticketing, // NEW: Ticketing data
  }) async {
    try {
      final Map<String, dynamic> eventData = {
        'name': name,
        'category': category,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      };

      if (description != null && description.isNotEmpty) {
        eventData['description'] = description;
      }
      if (emoji != null) {
        eventData['emoji'] = emoji;
      }
      if (imageUrl != null && imageUrl.isNotEmpty) {
        eventData['imageUrl'] = imageUrl; // NEW: Send Cloudinary URL
      }
      if (websiteLink != null && websiteLink.isNotEmpty) {
        eventData['websiteLink'] = websiteLink;
      }
      if (rsvpButtonText != null && rsvpButtonText.isNotEmpty) {
        eventData['rsvpButtonText'] = rsvpButtonText;
      }
      if (expectedGuests != null && expectedGuests > 0) {
        eventData['expectedGuests'] = expectedGuests;
      }
      if (budget != null && budget > 0) {
        eventData['budget'] = budget;
      }
      if (location != null) {
        eventData['location'] = location;
      }
      if (settings != null) {
        eventData['settings'] = settings;
      }
      if (ticketing != null) {
        eventData['ticketing'] = ticketing; // NEW: Send ticketing data
      }

      print('📤 Posting to /events with data: $eventData');
      final response = await _api.post('/events', data: eventData);
      
      print('📥 Response received: ${response.statusCode}');
      print('   Response data: ${response.data}');
      
      final eventJson = response.data['data'] as Map<String, dynamic>;
      print('   Parsing event JSON...');
      
      final event = EventModel.fromJson(eventJson);
      print('✅ Event parsed successfully: ${event.id}');
      
      return event;
    } catch (e, stackTrace) {
      print('❌ Repository.createEvent error: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }
}

final eventCreationRepositoryProvider = Provider<EventCreationRepository>((ref) {
  return EventCreationRepository(ref.read(apiServiceProvider));
});
