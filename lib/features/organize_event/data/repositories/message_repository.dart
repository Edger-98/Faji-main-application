import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/models/message_model.dart';

class MessageRepository {
  final ApiService _api;
  
  MessageRepository(this._api);
  
  Future<List<MessageModel>> getMessages(
    String eventId, {
    int page = 1,
    int limit = 50,
    String? before,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      
      if (before != null) params['before'] = before;
      
      final response = await _api.get('/events/$eventId/messages', params: params);
      
      final data = response.data['data'];
      final messages = (data['messages'] as List)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList();
      
      return messages;
    } catch (e) {
      throw Exception('Failed to load messages: $e');
    }
  }
  
  Future<MessageModel> sendMessage(
    String eventId,
    String content,
  ) async {
    try {
      final response = await _api.post('/events/$eventId/messages', data: {
        'content': content,
        'type': 'user',
      });
      
      return MessageModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }
}

final messageRepositoryProvider = Provider<MessageRepository>((ref) {
  return MessageRepository(ref.read(apiServiceProvider));
});
