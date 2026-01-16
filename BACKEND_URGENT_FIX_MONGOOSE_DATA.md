# URGENT: Backend API Response Issue - Mongoose Internal Data Leak

## Problem
The backend is returning Mongoose internal data in API responses, causing the mobile app to crash with "Invalid events data format" error.

## Example of Bad Response
```json
{
  "success": true,
  "data": {
    "events": [
      {
        "id": "evt_123",
        "name": "Birthday Party",
        "stats": {
          "$__parent": {...},
          "$__": {...},
          "_doc": {
            "expectedGuests": 100,
            "confirmedGuests": 50
          },
          "$isNew": false,
          "guestCount": 0
        }
      }
    ]
  }
}
```

## What's Wrong
The `stats` field (and potentially other nested objects) contains:
- `$__parent` - Mongoose parent document reference
- `$__` - Mongoose internal state
- `_doc` - The actual data we need
- `$isNew` - Mongoose flag
- Other Mongoose internals

## Root Cause
The backend is likely doing something like:
```javascript
// BAD - Returns Mongoose document with internals
res.json({
  success: true,
  data: { events: mongooseDocuments }
});
```

## Solution
Convert Mongoose documents to plain JavaScript objects before sending:

### Option 1: Use `.lean()` (Recommended)
```javascript
// GOOD - Returns plain objects
const events = await Event.find().lean();
res.json({
  success: true,
  data: { events }
});
```

### Option 2: Use `.toJSON()` or `.toObject()`
```javascript
// GOOD - Converts to plain object
const events = await Event.find();
const plainEvents = events.map(event => event.toObject());
res.json({
  success: true,
  data: { events: plainEvents }
});
```

### Option 3: Configure Schema
```javascript
// In your Mongoose schema
const eventSchema = new Schema({
  // ... fields
}, {
  toJSON: {
    transform: function(doc, ret) {
      delete ret.$__parent;
      delete ret.$__;
      delete ret.$isNew;
      return ret;
    }
  }
});
```

## Affected Endpoints
Based on the error, these endpoints are affected:
- `GET /api/events/my-events` ✅ **CONFIRMED BROKEN**
- `GET /api/events` (likely affected)
- `GET /api/events/:id` (likely affected)
- Any endpoint returning nested Mongoose documents

## Expected Response Format
```json
{
  "success": true,
  "data": {
    "events": [
      {
        "id": "evt_123",
        "name": "Birthday Party",
        "description": "Join us!",
        "category": "Birthday",
        "emoji": "🎂",
        "startDate": "2025-12-31T18:00:00Z",
        "endDate": "2025-12-31T23:00:00Z",
        "host": {
          "id": "usr_789",
          "name": "John Doe",
          "email": "john@example.com",
          "avatar": "https://..."
        },
        "location": {
          "address": "123 Main St",
          "latitude": 6.5244,
          "longitude": 3.3792
        },
        "stats": {
          "expectedGuests": 100,
          "confirmedGuests": 50,
          "invitedGuests": 80,
          "taskCount": 5,
          "completedTasks": 3,
          "vendorCount": 2,
          "plannerCount": 1
        },
        "budget": {
          "total": 500000,
          "spent": 150000,
          "remaining": 350000,
          "currency": "NGN",
          "currencySymbol": "₦"
        },
        "imageUrl": "https://...",
        "status": "upcoming",
        "createdAt": "2025-12-26T10:00:00Z",
        "updatedAt": "2025-12-26T10:00:00Z"
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 1,
      "totalItems": 11,
      "itemsPerPage": 20
    }
  }
}
```

## Testing
After fixing, test with:
```bash
curl -H "Authorization: Bearer {token}" \
  https://api.faji.com/api/events/my-events
```

Verify the response does NOT contain:
- `$__parent`
- `$__`
- `_doc`
- `$isNew`
- Any other fields starting with `$`

## Mobile App Workaround
I've added a temporary fix in the mobile app to extract `_doc` when present, but this is NOT a permanent solution. The backend MUST be fixed.

## Priority
🔴 **CRITICAL** - This breaks the entire events listing feature

## Timeline
Please fix within 24 hours. This is blocking users from viewing their events.

---

**Reported by**: Mobile Development Team  
**Date**: December 26, 2024  
**Status**: 🔴 CRITICAL - Needs immediate attention
