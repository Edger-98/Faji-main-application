import 'package:dio/src/response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/services/api_service.dart';
import 'package:fajimobileapp/core/models/guest_model.dart';

class GuestRepository {
  
  GuestRepository(this._api);
  final ApiService _api;
  
  Future<GuestListResponse> getGuests(
    String eventId, {
    String? status,
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final Map<String, dynamic> params = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      
      if (status != null && status != 'all') params['status'] = status;
      if (search != null && search.isNotEmpty) params['search'] = search;
      
      final Response response = await _api.get('/events/$eventId/guests', params: params);
      
      final data = response.data['data'];
      final List<GuestModel> guests = (data['guests'] as List)
          .map((e) => GuestModel.fromJson(e as Map<String, dynamic>))
          .toList();
      
      final GuestStatsModel stats = GuestStatsModel.fromJson(data['stats'] as Map<String, dynamic>);
      
      return GuestListResponse(guests: guests, stats: stats);
    } catch (e) {
      throw Exception('Failed to load guests: $e');
    }
  }
  
  Future<GuestModel> addGuest(
    String eventId, {
    required String name,
    String? phone,
    String? email,
  }) async {
    try {
      final Response response = await _api.post('/events/$eventId/guests', data: <String, String?>{
        'name': name,
        'phone': phone,
        'email': email,
      });
      
      return GuestModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to add guest: $e');
    }
  }
}

class GuestListResponse {

  GuestListResponse({
    required this.guests,
    required this.stats,
  });
  final List<GuestModel> guests;
  final GuestStatsModel stats;
}

final Provider<GuestRepository> guestRepositoryProvider = Provider<GuestRepository>((ProviderRef<GuestRepository> ref) => GuestRepository(ref.read(apiServiceProvider)));
