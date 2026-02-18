import 'package:dio/src/response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/services/api_service.dart';
import 'package:fajimobileapp/core/models/message_model.dart';

class MessageRepository {
  
  MessageRepository(this._api);
  final ApiService _api;
  
  Future<List<MessageModel>> getMessages(
    String eventId, {
    int page = 1,
    int limit = 50,
    String? before,
  }) async {
    try {
      final Map<String, dynamic> params = <String, dynamic>{
        'page': page,
        'limit': limit,
      };
      
      if (before != null) params['before'] = before;
      
      final Response response = await _api.get('/events/$eventId/messages', params: params);
      
      final data = response.data['data'];
      final List<MessageModel> messages = (data['messages'] as List)
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
      final Response response = await _api.post('/events/$eventId/messages', data: <String, String>{
        'content': content,
        'type': 'user',
      });
      
      return MessageModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }
}

final Provider<MessageRepository> messageRepositoryProvider = Provider<MessageRepository>((ProviderRef<MessageRepository> ref) => MessageRepository(ref.read(apiServiceProvider)));
