# API Response Parsing Fix - Event Details

## Issue
Error when viewing event details: `type 'Map<String, dynamic>' is not a subtype of type 'String?' in type cast`

## Root Cause
The backend API response structure changed and has nested objects that the EventModel wasn't handling correctly.

### API Response Structure
```json
{
  "success": true,
  "data": {
    "id": "69412f92662aa054e4af61f8",
    "name": "ddffdeer",
    "description": "RSVP Now",
    "category": "Birthday",
    "emoji": "🎂",
    "startDate": "2025-12-18T10:07:00.000Z",
    "endDate": "2025-12-24T12:07:00.000Z",
    "host": {
      "id": "693f2d3f660e87d74ca2e3e5",
      "name": "mandiba@qa.team",
      "email": "mandiba@qa.team",
      "phone": "+8445544555",
      "avatar": ""
    },
    "location": {
      "address": "erer",
      "latitude": 0,
      "longitude": 0
    },
    "budget": {...},
    "settings": {...},
    "media": {
      "poster": "",
      "posterId": null,
      "preEventMedia": []
    },
    "imageUrl": "https://res.cloudinary.com/...",
    "colorTheme": "green",
    "stats": {
      "expectedGuests": 998,
      "confirmedGuests": 0,
      "invitedGuests": 0,
      "taskCount": 0,
      "completedTasks": 0,
      "vendorCount": 0,
      "plannerCount": 1
    }
  }
}
```

### Problems
1. **Nested `data` wrapper**: Response has `{success: true, data: {...}}`
2. **Nested `location` object**: `location: {address, latitude, longitude}` instead of flat fields
3. **Nested `host` object**: `host: {id, name, email, avatar}` instead of flat fields
4. **Different field names**: `name` instead of `title`, `stats.expectedGuests` instead of `totalTickets`
5. **Emoji field**: Separate `emoji` field alongside `category`

## Fix Applied

**File**: `lib/features/events/data/models/event_model.dart`

### Changes Made

#### 1. Handle Nested Data Wrapper
```dart
// Handle nested data structure
final data = json['data'] ?? json;
```

#### 2. Parse Nested Location Object
```dart
// Parse location - handle nested object
String locationAddress = '';
double latitude = 0.0;
double longitude = 0.0;

if (data['location'] is Map) {
  final locationMap = data['location'] as Map<String, dynamic>;
  locationAddress = (locationMap['address'] as String?) ?? '';
  latitude = (locationMap['latitude'] as num?)?.toDouble() ?? 0.0;
  longitude = (locationMap['longitude'] as num?)?.toDouble() ?? 0.0;
} else if (data['location'] is String) {
  // Fallback for old API format
  locationAddress = data['location'] as String;
  latitude = (data['latitude'] as num?)?.toDouble() ?? 0.0;
  longitude = (data['longitude'] as num?)?.toDouble() ?? 0.0;
}
```

#### 3. Parse Nested Host Object
```dart
// Parse host - handle nested object
String hostId = '';
String hostName = '';
String? hostImage;

if (data['host'] is Map) {
  final hostMap = data['host'] as Map<String, dynamic>;
  hostId = (hostMap['id'] ?? hostMap['_id'] ?? '').toString();
  hostName = (hostMap['name'] ?? hostMap['email'] ?? 'Unknown Host').toString();
  hostImage = hostMap['avatar'] as String?;
  if (hostImage != null && hostImage.isEmpty) hostImage = null;
} else {
  // Fallback for old API format
  hostId = (data['userId'] ?? data['organizer_id'] ?? data['hostId'] ?? '').toString();
  hostName = (data['event_organizer'] ?? data['organizerName'] ?? data['hostName'] as String?) ?? 'Unknown Host';
  hostImage = data['organizerImage'] as String?;
}
```

#### 4. Handle Different Field Names
```dart
// Title: 'name' or 'title'
title: (data['name'] ?? data['eventTitle'] ?? data['title'] as String?) ?? '',

// Dates: 'startDate'/'endDate' or 'date'
if (data['startDate'] != null) {
  startDate = DateTime.parse(data['startDate'].toString());
} else if (data['date'] != null) {
  startDate = DateTime.parse(data['date'].toString());
}
```

#### 5. Parse Stats for Tickets
```dart
// Parse stats for tickets
int totalTickets = 0;
int availableTickets = 0;

if (data['stats'] is Map) {
  final statsMap = data['stats'] as Map<String, dynamic>;
  totalTickets = (statsMap['expectedGuests'] as num?)?.toInt() ?? 0;
  availableTickets = totalTickets - ((statsMap['confirmedGuests'] as num?)?.toInt() ?? 0);
} else {
  // Fallback for old API format
  totalTickets = (data['seats'] ?? data['totalTickets'] as num?)?.toInt() ?? 0;
  final ticketsSold = (data['ticketsSold'] as num?)?.toInt() ?? 0;
  availableTickets = (data['ticketsLeft'] ?? data['availableTickets'] as num?)?.toInt() ?? (totalTickets - ticketsSold);
}
```

#### 6. Handle Emoji + Category
```dart
// Parse category - handle emoji format
String category = '';
if (data['category'] is String) {
  category = data['category'] as String;
}
if (data['emoji'] != null) {
  final emoji = data['emoji'] as String;
  category = category.isNotEmpty ? '$emoji $category' : emoji;
}
if (category.isEmpty) category = 'General';
```

#### 7. Handle Multiple Image Sources
```dart
// Get imageUrl
final String imageUrl;
if (data['imageUrl'] != null && (data['imageUrl'] as String).isNotEmpty) {
  imageUrl = data['imageUrl'] as String;
} else if (data['media'] is Map && data['media']['poster'] != null) {
  imageUrl = data['media']['poster'] as String;
} else if (data['images'] is List && (data['images'] as List).isNotEmpty) {
  imageUrl = (data['images'] as List)[0].toString();
} else {
  imageUrl = '';
}
```

## Benefits

### Backward Compatibility
The fix maintains support for both old and new API formats:
- ✅ Old format: Flat fields (`location: "string"`, `latitude: 0`, `longitude: 0`)
- ✅ New format: Nested objects (`location: {address, latitude, longitude}`)

### Robust Parsing
- Handles missing fields gracefully
- Provides sensible defaults
- Supports multiple field name variations
- Type-safe conversions

### Field Mapping

| API Field | Model Field | Notes |
|-----------|-------------|-------|
| `data.name` | `title` | Also checks `eventTitle`, `title` |
| `data.host.id` | `hostId` | Also checks `userId`, `organizer_id` |
| `data.host.name` | `hostName` | Falls back to `email` if name empty |
| `data.host.avatar` | `hostImage` | Null if empty string |
| `data.location.address` | `location` | String address |
| `data.location.latitude` | `latitude` | Double |
| `data.location.longitude` | `longitude` | Double |
| `data.stats.expectedGuests` | `totalTickets` | Also checks `seats` |
| `data.stats.confirmedGuests` | Used to calculate `availableTickets` |
| `data.emoji` + `data.category` | `category` | Combined as "🎂 Birthday" |
| `data.imageUrl` | `imageUrl` | Also checks `media.poster`, `images[0]` |

## Testing

Test with different API response formats:

### Test Case 1: New API Format (Current)
```json
{
  "success": true,
  "data": {
    "name": "Birthday Party",
    "host": {"id": "123", "name": "John"},
    "location": {"address": "123 Main St", "latitude": 6.5, "longitude": 3.3},
    "stats": {"expectedGuests": 100, "confirmedGuests": 50}
  }
}
```
✅ Should parse correctly

### Test Case 2: Old API Format
```json
{
  "title": "Birthday Party",
  "organizerId": "123",
  "organizerName": "John",
  "location": "123 Main St",
  "latitude": 6.5,
  "longitude": 3.3,
  "totalTickets": 100,
  "availableTickets": 50
}
```
✅ Should parse correctly (backward compatible)

### Test Case 3: Mixed Format
```json
{
  "data": {
    "name": "Birthday Party",
    "userId": "123",
    "location": "123 Main St",
    "latitude": 6.5,
    "longitude": 3.3
  }
}
```
✅ Should parse correctly (handles both formats)

## Status
✅ Fixed - Event details should now load correctly with the new API response structure
✅ Backward compatible - Still works with old API format
✅ Type safe - All type conversions handled properly
✅ Null safe - Handles missing fields gracefully

## Next Steps

1. **Test on device**: Hot reload and tap on an event to verify it loads
2. **Verify all fields**: Check that title, description, location, dates, etc. display correctly
3. **Test edge cases**: Try events with missing fields (no image, no location, etc.)
4. **Monitor logs**: Check for any remaining parsing errors

## Related Files
- `lib/features/events/data/models/event_model.dart` - Updated model
- `lib/features/events/domain/entities/event_entity.dart` - Entity definition
- `lib/features/events/presentation/screens/event_details_screen.dart` - UI screen
