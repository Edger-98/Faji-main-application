class MessageModel {
  final String id;
  final String type;
  final String content;
  final String? senderId;
  final String senderName;
  final String? senderAvatar;
  final DateTime timestamp;
  final bool isRead;

  MessageModel({
    required this.id,
    required this.type,
    required this.content,
    this.senderId,
    required this.senderName,
    this.senderAvatar,
    required this.timestamp,
    required this.isRead,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as String,
      type: json['type'] as String,
      content: json['content'] as String,
      senderId: json['senderId'] as String?,
      senderName: json['senderName'] as String,
      senderAvatar: json['senderAvatar'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'content': content,
      'senderId': senderId,
      'senderName': senderName,
      'senderAvatar': senderAvatar,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }
}
