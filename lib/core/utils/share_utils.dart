import 'package:flutter/services.dart';

class ShareUtils {
  /// Share event details
  static Future<void> shareEvent({
    required String eventName,
    required String eventDate,
    required String eventLocation,
    String? eventUrl,
  }) async {
    HapticFeedback.mediumImpact();
    
    final String text = '''
Check out this event: $eventName

📅 Date: $eventDate
📍 Location: $eventLocation
${eventUrl != null ? '\n🔗 $eventUrl' : ''}

Get your tickets now!
''';

    // In a real app, use share_plus package
    // await Share.share(text);
    
    // For now, copy to clipboard
    await Clipboard.setData(ClipboardData(text: text));
  }

  /// Share ticket
  static Future<void> shareTicket({
    required String eventName,
    required String ticketId,
  }) async {
    HapticFeedback.mediumImpact();
    
    final String text = '''
My ticket for $eventName

Ticket ID: $ticketId

See you there! 🎉
''';

    await Clipboard.setData(ClipboardData(text: text));
  }

  /// Share profile
  static Future<void> shareProfile({
    required String userName,
    String? profileUrl,
  }) async {
    HapticFeedback.mediumImpact();
    
    final String text = '''
Connect with me on Faji!

👤 $userName
${profileUrl != null ? '🔗 $profileUrl' : ''}
''';

    await Clipboard.setData(ClipboardData(text: text));
  }
}
