# Postman Collection Integration Notes

## Quick Setup

### 1. Import Collection
The backend team has provided a Postman collection with all endpoints ready.

### 2. Set Variables
```
baseUrl: http://localhost:5001/api/v1 (dev)
token: YOUR_JWT_TOKEN_HERE
eventId: (auto-set after creating event)
```

### 3. Test Flow
1. **Get Themes** → Returns 8 themes with colors
2. **Get Posters** → Returns 10 posters with colors
3. **Create Event** → Send themeId + posterId
4. **Get Event** → Returns full event with theme & poster objects

---

## Key Endpoints

### Public (No Auth)
```
GET  /event-themes          → 8 color themes
GET  /event-posters         → 10 poster templates
GET  /events/trending       → Trending events
GET  /events/upcoming       → Upcoming events
```

### Authenticated (Bearer Token)
```
POST   /events              → Create event
GET    /events/:id          → Get event details
PATCH  /events/:id          → Update event
DELETE /events/:id          → Delete event
GET    /events/my-events    → Get user's events
POST   /events/:id/media    → Upload media
GET    /events/:id/guests   → Get guests
POST   /events/:id/guests   → Add guest
```

---

## Important Notes

### 1. No Image URLs
- Backend returns `colors` array only
- Frontend generates gradients from colors
- Example: `["#B794F6", "#9F7AEA"]` → Purple gradient

### 2. Custom Poster Upload
Use `multipart/form-data` instead of JSON:
```
POST /events
Content-Type: multipart/form-data

Fields:
- name: "Event Name"
- category: "Birthday"
- startDate: "2025-12-15T18:00:00Z"
- endDate: "2025-12-15T23:00:00Z"
- themeId: "theme_purple"
- poster: [FILE] (custom image)
- expectedGuests: 50
- budget: 100000
```

### 3. Response Structure
Backend returns full objects (not just IDs):
```json
{
  "theme": {
    "id": "theme_purple",
    "name": "Royal Purple",
    "colors": ["#B794F6", "#9F7AEA"]
  },
  "poster": {
    "id": "poster_show_up_turn_up",
    "name": "Show Up & Turn Up",
    "colors": ["#6B4FBB", "#FF6B9D", "#FFA500"]
  }
}
```

### 4. Auto-Generated Fields
Backend auto-generates:
- `emoji` (based on category)
- `websiteLink` (from event name if not provided)
- `status` (upcoming/ongoing/past)
- `host` (from authenticated user)

---

## Mobile App Implementation

### Step 1: Fetch Themes & Posters on App Start
```dart
// Cache these for offline use
final themes = await apiService.get('/event-themes');
final posters = await apiService.get('/event-posters');
```

### Step 2: Display in Selection Grids
```dart
// Generate gradient from colors array
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: theme['colors'].map((c) => Color(int.parse(c.substring(1), radix: 16) + 0xFF000000)).toList(),
    ),
  ),
)
```

### Step 3: Create Event
```dart
final response = await apiService.post('/events', data: {
  'name': 'My Party',
  'category': 'Birthday',
  'startDate': '2025-12-15T18:00:00Z',
  'endDate': '2025-12-15T23:00:00Z',
  'themeId': selectedThemeId,
  'posterId': selectedPosterId,
  'expectedGuests': 50,
  'budget': 100000,
});

// Response includes full theme & poster objects
final event = EventModel.fromJson(response.data['data']);
```

---

## Testing Checklist

- [ ] Get themes (no auth)
- [ ] Get posters (no auth)
- [ ] Get posters by category
- [ ] Create event with minimal fields
- [ ] Create event with all fields
- [ ] Create event with custom poster upload
- [ ] Get event details
- [ ] Update event
- [ ] Delete event
- [ ] Get my events
- [ ] Add guest
- [ ] Upload media

---

## Error Handling

### Theme Not Found
```json
{
  "success": false,
  "error": {
    "code": "THEME_NOT_FOUND",
    "message": "The selected theme does not exist",
    "field": "themeId"
  }
}
```

### Poster Not Found
```json
{
  "success": false,
  "error": {
    "code": "POSTER_NOT_FOUND",
    "message": "The selected poster does not exist",
    "field": "posterId"
  }
}
```

### Validation Error
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Event name is required",
    "field": "name"
  }
}
```

---

## Cloudinary Integration

Backend uses Cloudinary for:
- Custom poster uploads
- Event media uploads
- Automatic optimization
- CDN delivery

Frontend doesn't need to handle Cloudinary directly - just send files via multipart/form-data.

---

**Ready to integrate!** 🚀
