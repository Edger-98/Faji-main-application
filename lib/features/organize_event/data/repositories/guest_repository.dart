import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/models/guest_model.dart';

class GuestRepository {
  final ApiService _api;
  
  GuestRepository(this._api);
  
  Future<GuestListResponse> getGuests(
    String eventId, {
    String? status,
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      
      if (status != null && status != 'all') params['status'] = status;
      if (search != null && search.isNotEmpty) params['search'] = search;
      
      final response = await _api.get('/events/$eventId/guests', params: params);
      
      final data = response.data['data'];
      final guests = (data['guests'] as List)
          .map((e) => GuestModel.fromJson(e as Map<String, dynamic>))
          .toList();
      
      final stats = GuestStatsModel.fromJson(data['stats'] as Map<String, dynamic>);
      
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
      final response = await _api.post('/events/$eventId/guests', data: {
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
  final List<GuestModel> guests;
  final GuestStatsModel stats;

  GuestListResponse({
    required this.guests,
    required this.stats,
  });
}

final guestRepositoryProvider = Provider<GuestRepository>((ref) {
  return GuestRepository(ref.read(apiServiceProvider));
});
