# API Quick Reference - Event Management

## Base URL
```
https://api.example.com/api/v1
```

## Authentication
All requests require:
```
Authorization: Bearer {jwt_token}
```

---

## Quick Endpoint List

### Event Management
| Method | Endpoint | Purpose |
|--------|----------|---------|
| GET | `/events` | Get user's events list |
| GET | `/events/{id}` | Get event details |
| POST | `/events` | Create new event |
| PATCH | `/events/{id}` | Update event |
| DELETE | `/events/{id}` | Delete event |
| POST | `/events/{id}/bookmark` | Bookmark/unbookmark |
| PATCH | `/events/{id}/settings` | Update settings |
| POST | `/events/{id}/media` | Upload media |

### PLAN Tab
| Method | Endpoint | Purpose |
|--------|----------|---------|
| GET | `/events/{id}/budget` | Get budget details |
| GET | `/events/{id}/tasks` | Get task list |
| PATCH | `/events/{id}/tasks/{taskId}` | Update task |
| GET | `/events/{id}/vendors` | Get vendors |
| GET | `/events/{id}/planners` | Get planners |

### GUEST Tab
| Method | Endpoint | Purpose |
|--------|----------|---------|
| GET | `/events/{id}/guests` | Get guest list |
| POST | `/events/{id}/guests` | Add guest |
| PATCH | `/events/{id}/guests/{guestId}` | Update guest |
| DELETE | `/events/{id}/guests/{guestId}` | Remove guest |

### CHAT Tab
| Method | Endpoint | Purpose |
|--------|----------|---------|
| GET | `/events/{id}/messages` | Get messages |
| POST | `/events/{id}/messages` | Send message |
| WS | `wss://api.../events/{id}/chat` | Real-time chat |

---

## Priority Implementation Order

### Phase 1 (MVP - Week 1)
1. ✅ GET `/events` - Event list
2. ✅ GET `/events/{id}` - Event details
3. ✅ PATCH `/events/{id}` - Update event
4. ✅ GET `/events/{id}/guests` - Guest list
5. ✅ POST `/events/{id}/guests` - Add guest

### Phase 2 (Core Features - Week 2)
6. ✅ GET `/events/{id}/messages` - Chat history
7. ✅ POST `/events/{id}/messages` - Send message
8. ✅ GET `/events/{id}/budget` - Budget
9. ✅ GET `/events/{id}/tasks` - Tasks
10. ✅ PATCH `/events/{id}/settings` - Settings

### Phase 3 (Enhanced Features - Week 3)
11. ✅ POST `/events/{id}/media` - Media upload
12. ✅ WebSocket for real-time chat
13. ✅ GET `/events/{id}/vendors` - Vendors
14. ✅ GET `/events/{id}/planners` - Planners
15. ✅ POST `/events/{id}/bookmark` - Bookmarks

---

## Sample Responses

### Event List
```json
{
  "success": true,
  "data": {
    "events": [{
      "id": "evt_123",
      "name": "RonkeLols",
      "role": "creator",
      "startDate": "2025-11-30T11:40:00Z",
      "endDate": "2025-11-30T14:40:00Z",
      "host": {
        "id": "user_123",
        "name": "Oladapo"
      }
    }]
  }
}
```

### Event Details
```json
{
  "success": true,
  "data": {
    "id": "evt_123",
    "name": "RonkeLols",
    "budget": {
      "total": 251000,
      "spent": 0,
      "currency": "NGN"
    },
    "stats": {
      "expectedGuests": 1399,
      "taskCount": 1,
      "vendorCount": 2
    }
  }
}
```

---

## Testing Credentials

**Test User:**
- Email: `test@example.com`
- Password: `Test123!`
- Token: `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...`

**Test Event ID:** `evt_test_123`

---

## Postman Collection

Import this collection for quick testing:
```
https://api.example.com/postman/event-management.json
```

---

## Support

- **Documentation:** See `BACKEND_API_REQUIREMENTS.md` for full details
- **Slack:** #mobile-backend-integration
- **Issues:** Create ticket in JIRA with label `api-integration`
