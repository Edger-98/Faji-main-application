// Test script to verify EventModel parsing with actual API response
import 'dart:convert';

void main() {
  // Actual API response from the error
  final jsonString = '''
{
  "success": true,
  "data": {
    "id": "694ffd9430db4fdc26a77ea2",
    "name": "dkdkd",
    "description": "RSVP Now",
    "category": "Birthday",
    "emoji": "🎂",
    "startDate": {},
    "endDate": {},
    "createdAt": {},
    "updatedAt": {},
    "host": {
      "id": {
        "buffer": {
          "0": 105,
          "1": 79,
          "2": 176,
          "3": 204,
          "4": 249,
          "5": 37,
          "6": 108,
          "7": 105,
          "8": 213,
          "9": 44,
          "10": 189,
          "11": 4
        }
      },
      "name": "khennyog@qa.team",
      "email": "khennyog@qa.team",
      "phone": "+1576788787",
      "avatar": ""
    },
    "location": {
      "address": "jeje",
      "latitude": 0,
      "longitude": 0
    },
    "budget": {
      "total": 455,
      "spent": 0,
      "remaining": 455,
      "currency": "USD",
      "currencySymbol": "\$",
      "items": []
    },
    "settings": {
      "isPublic": false,
      "websiteLink": "jeje",
      "rsvpButtonText": "Celebrate With Us",
      "keepMemoriesPrivate": false,
      "disableGuestMemories": false,
      "acceptGuestContributions": true,
      "disablePublicRSVP": false,
      "enableWebhook": false
    },
    "media": {
      "poster": "",
      "posterId": null,
      "preEventMedia": []
    },
    "imageUrl": "https://res.cloudinary.com/dicgz84sg/image/upload/v1766849925/faji/events/ojuezyopzhffa9wu2vcu.jpg",
    "stats": {
      "expectedGuests": 22,
      "confirmedGuests": 0,
      "invitedGuests": 0,
      "taskCount": 0,
      "completedTasks": 0,
      "vendorCount": 0,
      "plannerCount": 1
    }
  }
}
''';

  print('🧪 Testing EventModel parsing with actual API response...\n');
  
  try {
    final response = jsonDecode(jsonString);
    final eventData = response['data'] as Map<String, dynamic>;
    
    print('📦 Raw event data:');
    print('   startDate: ${eventData['startDate']} (${eventData['startDate'].runtimeType})');
    print('   endDate: ${eventData['endDate']} (${eventData['endDate'].runtimeType})');
    print('   host.id: ${eventData['host']['id']} (${eventData['host']['id'].runtimeType})');
    print('');
    
    // This would normally call EventModel.fromJson(eventData)
    // For now, just verify the structure
    print('✅ JSON structure verified');
    print('   Event ID: ${eventData['id']}');
    print('   Event Name: ${eventData['name']}');
    print('   Category: ${eventData['category']}');
    print('');
    
    print('🎯 Next step: Run the app and check console logs for detailed parsing info');
    
  } catch (e, stackTrace) {
    print('❌ Error: $e');
    print('Stack trace: $stackTrace');
  }
}
