import 'package:dio/src/response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/services/api_service.dart';
import 'package:fajimobileapp/core/models/event_model.dart';

class EventRepository {
  
  EventRepository(this._api);
  final ApiService _api;
  
  Future<List<EventModel>> getEvents({
    String? status,
    String? role,
    bool? bookmarked,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final Map<String, dynamic> params = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      
      if (status != null) params['status'] = status;
      if (role != null) params['role'] = role;
      if (bookmarked != null) params['bookmarked'] = bookmarked.toString();
      
      final Response response = await _api.get('/events', params: params);
      
      final data = response.data['data'];
      final List events = data['events'] as List;
      
      return events.map((e) => EventModel.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to load events: $e');
    }
  }
  
  Future<EventModel> getEventDetails(String eventId) async {
    try {
      final Response response = await _api.get('/events/$eventId');
      return EventModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to load event details: $e');
    }
  }
  
  Future<void> toggleBookmark(String eventId, bool bookmarked) async {
    try {
      await _api.post('/events/$eventId/bookmark', data: <String, bool>{
        'bookmarked': bookmarked,
      });
    } catch (e) {
      throw Exception('Failed to update bookmark: $e');
    }
  }
  
  Future<EventModel> updateEvent(String eventId, Map<String, dynamic> data) async {
    try {
      final Response response = await _api.patch('/events/$eventId', data: data);
      // API returns {id, updatedAt} not full event, so fetch the updated event
      return await getEventDetails(eventId);
    } catch (e) {
      throw Exception('Failed to update event: $e');
    }
  }
  
  Future<void> updateSettings(String eventId, EventSettingsModel settings) async {
    try {
      await _api.patch('/events/$eventId/settings', data: settings.toJson());
    } catch (e) {
      throw Exception('Failed to update settings: $e');
    }
  }
  
  Future<String> uploadMedia(String eventId, String filePath, String type) async {
    try {
      final Response response = await _api.uploadFile(
        '/events/$eventId/media',
        filePath,
        data: <String, dynamic>{'type': type},
      );
      return response.data['data']['url'] as String;
    } catch (e) {
      throw Exception('Failed to upload media: $e');
    }
  }
  
  Future<void> deleteEvent(String eventId) async {
    try {
      await _api.delete('/events/$eventId');
    } catch (e) {
      throw Exception('Failed to delete event: $e');
    }
  }
}

final Provider<EventRepository> eventRepositoryProvider = Provider<EventRepository>((ProviderRef<EventRepository> ref) => EventRepository(ref.read(apiServiceProvider)));
