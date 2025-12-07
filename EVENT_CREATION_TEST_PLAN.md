# Event Creation Flow - Test Plan & Verification

## What Was Implemented

I've integrated the complete event creation flow with your backend API. Here's what happens:

### Flow Overview

1. **Event Type Selection** → User selects event category (Birthday, Wedding, etc.)
2. **Event Details** → User enters name, dates, description, website link, RSVP text
3. **Event Configuration** → User sets expected guests, budget
4. **Poster Selection** → User selects from API-loaded posters
5. **Theme Selection** → User selects from API-loaded themes → **CREATE EVENT**

### API Endpoints Used

```
GET  /api/v1/event-themes          (No auth required)
GET  /api/v1/event-posters         (No auth required)
POST /api/v1/events                (Auth required - Bearer token)
```

### Data Flow

#### Step 1: Event Details Screen
**Captures:**
- Event name (required)
- Description (optional)
- Start date & time (required or "set later")
- End date & time (optional)
- Website link (optional)
- RSVP button text (optional)

**Stores in ViewModel:**
```dart
viewModel.updateTitle(name)
viewModel.updateDescription(description)
viewModel.updateStartDate(startDate)
viewModel.updateEndDate(endDate)
viewModel.updateWebsiteLink(websiteLink)
viewModel.updateRsvpButtonText(rsvpButtonText)
```

#### Step 2: Event Configuration Screen
**Captures:**
- Expected guests
- Budget
- Feature toggles

**Stores in ViewModel:**
```dart
viewModel.updateExpectedGuests(guests)
viewModel.updateBudget(budget)
```

#### Step 3: Poster Selection Screen
**Loads from API:**
```dart
ref.watch(postersProvider(null))
```

**Stores selection:**
```dart
viewModel.selectPoster(posterId)
```

#### Step 4: Theme Selection Screen
**Loads from API:**
```dart
ref.watch(themesProvider)
```

**Creates event:**
```dart
viewModel.selectTheme(themeId)
final event = await viewModel.createEvent(
  startDate: startDate,
  endDate: endDate,
  websiteLink: websiteLink,
  rsvpButtonText: rsvpButtonText,
)
```

### API Request Format

When user clicks "Create Event", the app sends:

```json
{
  "name": "Sarah's Birthday Bash",
  "description": "Join us for celebration!",
  "category": "Birthday",
  "emoji": "🎂",
  "startDate": "2025-12-15T18:00:00.000Z",
  "endDate": "2025-12-15T21:00:00.000Z",
  "themeId": "theme_purple",
  "posterId": "poster_show_up_turn_up",
  "websiteLink": "sarahs-birthday-2025",
  "rsvpButtonText": "Celebrate With Us",
  "expectedGuests": 50,
  "budget": 150000,
  "settings": {
    "isPublic": false,
    "keepMemoriesPrivate": false,
    "disableGuestMemories": false,
    "acceptGuestContributions": true,
    "disablePublicRSVP": false
  }
}
```

### Expected API Response

```json
{
  "success": true,
  "data": {
    "id": "674f1234567890abcdef1234",
    "name": "Sarah's Birthday Bash",
    "category": "Birthday",
    "emoji": "🎂",
    "startDate": "2025-12-15T18:00:00.000Z",
    "endDate": "2025-12-15T21:00:00.000Z",
    "theme": {
      "id": "theme_purple",
      "name": "Royal Purple",
      "colors": ["#B794F6", "#9F7AEA"]
    },
    "poster": {
      "id": "poster_show_up_turn_up",
      "name": "Show Up & Turn Up",
      "colors": ["#6B4FBB", "#FF6B9D", "#FFA500"]
    },
    "host": {
      "id": "user_123",
      "name": "John Doe",
      "email": "john@example.com"
    },
    "status": "upcoming",
    "createdAt": "2025-12-04T10:30:00.000Z"
  },
  "message": "Event created successfully"
}
```

## Testing Checklist

### ✅ Pre-Test Setup
- [ ] Backend server running on `http://localhost:5001`
- [ ] User is logged in (has valid JWT token)
- [ ] API endpoints `/event-themes` and `/event-posters` return data
- [ ] API endpoint `/events` accepts POST requests

### 🧪 Test Scenarios

#### Test 1: Load Themes
**Steps:**
1. Navigate to theme selection screen
2. Observe loading indicator
3. Verify themes display in grid

**Expected:**
- Loading indicator shows
- Themes load from API
- Gradients render correctly
- Theme names display

**Debug:**
```
Check console for:
🚀 REQUEST[GET] => http://10.0.2.2:5001/api/v1/event-themes
✅ RESPONSE[200] => ...
```

#### Test 2: Load Posters
**Steps:**
1. Navigate to poster selection screen
2. Observe loading indicator
3. Verify posters display in grid

**Expected:**
- Loading indicator shows
- Posters load from API
- Gradients render correctly
- Poster names and descriptions display

**Debug:**
```
Check console for:
🚀 REQUEST[GET] => http://10.0.2.2:5001/api/v1/event-posters
✅ RESPONSE[200] => ...
```

#### Test 3: Create Event (Minimal)
**Steps:**
1. Enter event name: "Test Event"
2. Select start date: Tomorrow
3. Skip optional fields
4. Select a poster
5. Select a theme
6. Click "Create Event"

**Expected:**
- Loading dialog shows
- Event creates successfully
- Success message displays
- Navigates to event details screen

**Debug:**
```
Check console for:
🚀 REQUEST[POST] => http://10.0.2.2:5001/api/v1/events
   Data: {
     "name": "Test Event",
     "category": "Other",
     "startDate": "...",
     "endDate": "...",
     "themeId": "...",
     "posterId": "...",
     ...
   }
✅ RESPONSE[201] => ...
```

#### Test 4: Create Event (Complete)
**Steps:**
1. Enter event name: "Sarah's Birthday"
2. Enter description: "Join us!"
3. Select start date & time
4. Select end date & time
5. Enter website link: "sarahs-birthday"
6. Select RSVP text: "Celebrate With Us"
7. Set expected guests: 50
8. Set budget: 150000
9. Select a poster
10. Select a theme
11. Click "Create Event"

**Expected:**
- All fields included in API request
- Event creates successfully
- Success message displays
- Navigates to event details screen

#### Test 5: Error Handling
**Steps:**
1. Turn off backend server
2. Try to load themes
3. Observe error state

**Expected:**
- Error message displays
- User can retry

**Steps:**
1. Turn on backend server
2. Remove auth token
3. Try to create event

**Expected:**
- 401 error
- "Unauthorized" message displays

## Potential Issues & Solutions

### Issue 1: Themes/Posters Don't Load
**Symptoms:** Loading forever or error message

**Possible Causes:**
- Backend not running
- Wrong API endpoint
- CORS issues

**Debug:**
```dart
// Check console logs
🚀 REQUEST[GET] => http://10.0.2.2:5001/api/v1/event-themes
❌ ERROR[...] => ...
```

**Solution:**
- Verify backend is running: `curl http://localhost:5001/api/v1/event-themes`
- Check API config in `lib/core/config/api_config.dart`

### Issue 2: Event Creation Fails
**Symptoms:** Error message after clicking "Create Event"

**Possible Causes:**
- Missing auth token
- Invalid data format
- Backend validation errors

**Debug:**
```dart
// Check console logs
🚀 REQUEST[POST] => http://10.0.2.2:5001/api/v1/events
   Headers: { Authorization: Bearer ... }
   Data: { ... }
❌ ERROR[422] => Invalid data
   Response Data: { error: { message: "..." } }
```

**Solution:**
- Verify user is logged in
- Check request data format matches API spec
- Check backend validation rules

### Issue 3: Dates Not Sent Correctly
**Symptoms:** Backend rejects dates

**Possible Causes:**
- Wrong date format
- Timezone issues

**Debug:**
```dart
// Check request data
"startDate": "2025-12-15T18:00:00.000Z"  // Should be ISO 8601
```

**Solution:**
- Dates are converted to ISO 8601 in repository
- Verify `toIso8601String()` is called

### Issue 4: Navigation Fails After Creation
**Symptoms:** Event creates but doesn't navigate

**Possible Causes:**
- EventModel parsing error
- Missing event ID

**Debug:**
```dart
// Check if EventModel.fromJson succeeds
✅ RESPONSE[201] => { success: true, data: { id: "...", ... } }
```

**Solution:**
- Verify EventModel.fromJson handles all fields
- Check event ID is present in response

## Manual Testing Steps

### Quick Test (5 minutes)
1. Run app on emulator
2. Login
3. Navigate to create event
4. Enter name: "Quick Test"
5. Select tomorrow as date
6. Select any poster
7. Select any theme
8. Click "Create Event"
9. Verify success message
10. Verify navigation to event details

### Full Test (15 minutes)
1. Test theme loading
2. Test poster loading
3. Test event creation with minimal data
4. Test event creation with all fields
5. Test error handling (no network)
6. Test validation (empty name)
7. Verify created event appears in event list
8. Verify event details match input

## Success Criteria

✅ Themes load from API
✅ Posters load from API
✅ Event creates successfully
✅ All fields sent to backend
✅ Success message displays
✅ Navigates to event details
✅ Event appears in event list
✅ No console errors
✅ Proper error handling

## Current Status

**Implementation:** ✅ Complete
**Compilation:** ✅ No errors
**API Integration:** ✅ Matches Postman spec
**Ready for Testing:** ✅ Yes

## Next Steps

1. **Run the app** on Android emulator
2. **Login** with valid credentials
3. **Navigate** to create event flow
4. **Test** theme and poster loading
5. **Create** a test event
6. **Verify** it works end-to-end
7. **Report** any issues found

If you encounter any errors, check the console logs for the request/response details. The API service logs all requests with 🚀, responses with ✅, and errors with ❌.
