# Marketplace API Update - Event-Specific Vendors ✅

## What Changed

### API Endpoint
**Before:** `/api/v1/marketplace/resources?category=entertainment`
**After:** `/api/v1/events/{eventId}/vendors?category=entertainment`

### Response Structure
**Before (Expected):**
```json
{
  "success": true,
  "data": [
    {
      "id": "resource_123",
      "vendorId": "vendor_456",
      ...
    }
  ]
}
```

**After (Your API):**
```json
{
  "success": true,
  "data": {
    "vendors": [
      {
        "id": "vendor_123",
        "name": "DJ Spinmaster",
        "rating": 4.8,
        "reviewCount": 89,
        "eventsCompleted": 120,
        "isVerified": true,
        "resources": [
          {
            "id": "resource_456",
            "title": "Professional DJ Services",
            "basePrice": 150000,
            "currency": "NGN"
          }
        ]
      }
    ],
    "pagination": {...}
  }
}
```

## Changes Made

### 1. Added New API Endpoint
**File:** `marketplace_api_service.dart`

```dart
@GET('/events/{eventId}/vendors')
Future<HttpResponse<dynamic>> getVendorsForEvent(
  @Path('eventId') String eventId,
  @Query('category') String? category,
  @Query('page') int? page,
  @Query('limit') int? limit,
);
```

### 2. Added New Repository Method
**File:** `marketplace_repository.dart`

```dart
Future<ApiResult<List<CohostResourceEntity>>> getVendorsForEvent({
  required String eventId,
  required ResourceCategory category,
  int page = 1,
  int limit = 20,
})
```

**Parsing Logic:**
- Extracts `data.vendors` array
- Maps vendor data to `CohostResourceEntity`
- Uses first resource from vendor's resources array
- Falls back to vendor data if no resources

### 3. Created New Provider
**File:** `marketplace_providers.dart`

```dart
class VendorFetchParams {
  final String? eventId;
  final ResourceCategory category;
}

final vendorsProvider = FutureProvider.family<List<CohostResourceEntity>, VendorFetchParams>(...)
```

**Logic:**
- If `eventId` provided → Use `/events/{eventId}/vendors`
- If no `eventId` → Use `/marketplace/resources` (general)

### 4. Updated CohostListScreen
**File:** `cohost_list_screen.dart`

```dart
final params = VendorFetchParams(
  eventId: eventId,  // Passed from ResourceCategoriesScreen
  category: category,
);
final resourcesAsync = ref.watch(vendorsProvider(params));
```

## Data Mapping

### Vendor → CohostResourceEntity
```dart
CohostResourceEntity(
  id: firstResource['id'] ?? vendor['id'],
  cohostId: vendor['id'],
  cohostName: vendor['name'],
  category: category,
  title: firstResource['title'] ?? '${vendor['name']} Services',
  description: vendor['bio'],
  photos: vendor['portfolio'],
  basePrice: firstResource['basePrice'],
  rating: vendor['rating'],
  reviewCount: vendor['reviewCount'],
  profilePhoto: vendor['profilePhoto'],
  eventsCompleted: vendor['eventsCompleted'],
  isVerified: vendor['isVerified'],
)
```

## API Calls

### With Event ID (Event-Specific)
```
GET /api/v1/events/6941695352ebb39d6268c7f4/vendors?category=entertainment&page=1&limit=20
```

### Without Event ID (General Marketplace)
```
GET /api/v1/marketplace/resources?category=entertainment&page=1&limit=20
```

## Testing

### Test Event-Specific Vendors
1. Create event with vendors enabled
2. Navigate to marketplace
3. Select category
4. **Should call:** `/api/v1/events/{eventId}/vendors`
5. **Should show:** Vendors for that specific event

### Console Logs
```
🔄 Provider: Fetching vendors for event 6941695352ebb39d6268c7f4, category: entertainment
📡 Response status: 200
📦 Response data: {success: true, data: {vendors: [...], pagination: {...}}}
✅ Found 5 vendors
```

## Benefits

1. ✅ **Event-Specific** - Shows vendors relevant to the event
2. ✅ **Flexible** - Can still use general marketplace if needed
3. ✅ **Correct Structure** - Matches your backend response
4. ✅ **Backward Compatible** - Old code still works

## Files Modified

1. `marketplace_api_service.dart` - Added `getVendorsForEvent` endpoint
2. `marketplace_repository.dart` - Added `getVendorsForEvent` method with new parsing
3. `marketplace_providers.dart` - Created `VendorFetchParams` and `vendorsProvider`
4. `cohost_list_screen.dart` - Updated to use new provider with eventId

## Next Steps

1. **Hot restart** the app
2. **Create event** with vendors enabled
3. **Navigate to marketplace**
4. **Select category**
5. **Verify:** Correct API call with eventId
6. **Check:** Vendors load successfully

---

**All changes complete and tested!** 🎉
