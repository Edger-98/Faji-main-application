# Backend API Requirements - Event Management System

## Overview
This document outlines the API endpoints and data structures needed to support the mobile app's event management features. The app has two main screens: **My Events** (event list) and **Event Details** (tabbed interface with 6 tabs).

---

## Table of Contents
1. [Authentication](#authentication)
2. [Event List APIs](#event-list-apis)
3. [Event Details APIs](#event-details-apis)
4. [Data Models](#data-models)
5. [Error Handling](#error-handling)
6. [Testing Checklist](#testing-checklist)

---

## Authentication

All API requests must include authentication:

```
Authorization: Bearer {jwt_token}
```

**Required Headers:**
- `Authorization`: JWT token
- `Content-Type`: application/json
- `Accept`: application/json

---

## Event List APIs

### 1. Get User Events

**Endpoint:** `GET /api/v1/events`

**Purpose:** Fetch all events for the authenticated user (as creator, guest, or co-planner)

**Query Parameters:**
- `status` (optional): `upcoming` | `past` | `all` (default: `all`)
- `role` (optional): `creator` | `guest` | `co-planner` | `all` (default: `all`)
- `bookmarked` (optional): `true` | `false`
- `page` (optional): Page number for pagination (default: 1)
- `limit` (optional): Items per page (default: 20)

**Example Request:**
```bash
GET /api/v1/events?status=upcoming&role=creator&page=1&limit=20
```


**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "events": [
      {
        "id": "evt_abc123",
        "name": "RonkeLols",
        "role": "creator",
        "emoji": "😊",
        "startDate": "2025-11-30T11:40:00Z",
        "endDate": "2025-11-30T14:40:00Z",
        "status": "upcoming",
        "isBookmarked": false,
        "host": {
          "id": "user_123",
          "name": "Oladapo",
          "avatar": "https://cdn.example.com/avatars/user_123.jpg"
        },
        "stats": {
          "guestCount": 150,
          "confirmedCount": 45
        }
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 5,
      "totalItems": 100,
      "itemsPerPage": 20
    }
  }
}
```

**What the App Does:**
- Displays events in tabs: UPCOMING, BOOKMARKED, PAST
- Shows filter chips: All, Guest, Creator, Co-Planner
- Each event card shows: role badge, name, date, countdown timer
- Tapping a card navigates to event details

---

### 2. Bookmark/Unbookmark Event

**Endpoint:** `POST /api/v1/events/{eventId}/bookmark`

**Purpose:** Toggle bookmark status for an event

**Request Body:**
```json
{
  "bookmarked": true
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "eventId": "evt_abc123",
    "isBookmarked": true
  }
}
```

---

## Event Details APIs

### 3. Get Event Details

**Endpoint:** `GET /api/v1/events/{eventId}`

**Purpose:** Fetch complete event information for the details screen

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "id": "evt_abc123",
    "name": "RonkeLols",
    "description": "Prepare for a day bursting with pure joy...",
    "category": "Wedding",
    "emoji": "😊",
    "startDate": "2025-11-30T11:40:00Z",
    "endDate": "2025-11-30T14:40:00Z",
    "createdAt": "2024-11-24T11:42:00Z",
    "updatedAt": "2024-11-24T11:42:00Z",
    "host": {
      "id": "user_123",
      "name": "Oladapo",
      "avatar": "https://cdn.example.com/avatars/user_123.jpg"
    },
    "location": {
      "address": "123 Main Street, City",
      "latitude": 6.5244,
      "longitude": 3.3792,
      "placeId": "ChIJ..."
    },
    "budget": {
      "total": 251000,
      "spent": 0,
      "remaining": 251000,
      "currency": "NGN",
      "currencySymbol": "₦"
    },
    "settings": {
      "isPublic": false,
      "websiteLink": "ronkelols",
      "rsvpButtonText": "Celebrate With Us",
      "keepMemoriesPrivate": false,
      "disableGuestMemories": false,
      "acceptGuestContributions": true,
      "disablePublicRSVP": false,
      "enableWebhook": false,
      "webhookUrl": null
    },
    "media": {
      "poster": "https://cdn.example.com/events/evt_abc123/poster.jpg",
      "preEventMedia": []
    },
    "stats": {
      "expectedGuests": 1399,
      "confirmedGuests": 45,
      "invitedGuests": 100,
      "taskCount": 1,
      "completedTasks": 0,
      "vendorCount": 2,
      "plannerCount": 1
    },
    "colorTheme": "green"
  }
}
```

**What the App Does:**
- Shows event name in header
- Displays 6 tabs: PLAN, GUEST, CHAT, SETTINGS, EDIT, PROMOTE
- Each tab uses different parts of this data

---

### 4. Update Event Details

**Endpoint:** `PATCH /api/v1/events/{eventId}`

**Purpose:** Update event information (used in EDIT tab)

**Request Body:**
```json
{
  "name": "Updated Event Name",
  "description": "New description",
  "category": "Birthday",
  "startDate": "2025-12-01T10:00:00Z",
  "endDate": "2025-12-01T18:00:00Z",
  "colorTheme": "blue",
  "expectedGuests": 200,
  "budget": 300000
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "id": "evt_abc123",
    "updatedAt": "2024-11-25T10:30:00Z"
  },
  "message": "Event updated successfully"
}
```

---

### 5. Update Event Settings

**Endpoint:** `PATCH /api/v1/events/{eventId}/settings`

**Purpose:** Update event privacy and configuration settings (used in SETTINGS tab)

**Request Body:**
```json
{
  "isPublic": true,
  "websiteLink": "my-awesome-party",
  "rsvpButtonText": "Join Us",
  "keepMemoriesPrivate": false,
  "disableGuestMemories": true,
  "acceptGuestContributions": false,
  "disablePublicRSVP": false,
  "enableWebhook": true,
  "webhookUrl": "https://myapp.com/webhook"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Settings updated successfully"
}
```

---

### 6. Upload Event Media

**Endpoint:** `POST /api/v1/events/{eventId}/media`

**Purpose:** Upload event poster or pre-event media

**Request:** `multipart/form-data`
```
file: [binary file]
type: "poster" | "pre-event"
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "id": "media_123",
    "url": "https://cdn.example.com/events/evt_abc123/poster.jpg",
    "type": "poster",
    "uploadedAt": "2024-11-25T10:30:00Z"
  }
}
```

**Requirements:**
- Max file size: 10MB
- Supported formats: JPG, PNG, WEBP
- Auto-resize to: 1200x630 for posters
- Return CDN URL for fast loading

---

### 7. Delete Event

**Endpoint:** `DELETE /api/v1/events/{eventId}`

**Purpose:** Delete an event (only creator can delete)

**Response (200 OK):**
```json
{
  "success": true,
  "message": "Event deleted successfully"
}
```

---

## PLAN Tab APIs

### 8. Get Event Budget

**Endpoint:** `GET /api/v1/events/{eventId}/budget`

**Purpose:** Fetch budget details for the budget card

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "total": 251000,
    "spent": 50000,
    "remaining": 201000,
    "currency": "NGN",
    "currencySymbol": "₦",
    "items": [
      {
        "id": "budget_item_1",
        "category": "Venue",
        "amount": 50000,
        "status": "paid",
        "paidAt": "2024-11-20T10:00:00Z"
      }
    ],
    "progress": 0.199
  }
}
```

---

### 9. Get Event Tasks

**Endpoint:** `GET /api/v1/events/{eventId}/tasks`

**Purpose:** Fetch task list for task tracker card

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "tasks": [
      {
        "id": "task_123",
        "title": "Name ones",
        "description": "Complete the guest list",
        "status": "not_started",
        "dueDate": "2025-11-25T00:00:00Z",
        "assignedTo": {
          "id": "user_123",
          "name": "Oladapo"
        },
        "createdAt": "2024-11-24T11:42:00Z"
      }
    ],
    "stats": {
      "total": 5,
      "completed": 2,
      "inProgress": 1,
      "notStarted": 2
    }
  }
}
```

---

### 10. Update Task Status

**Endpoint:** `PATCH /api/v1/events/{eventId}/tasks/{taskId}`

**Purpose:** Mark task as complete/incomplete

**Request Body:**
```json
{
  "status": "completed"
}
```

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "id": "task_123",
    "status": "completed",
    "completedAt": "2024-11-25T10:30:00Z"
  }
}
```

---

### 11. Get Event Vendors

**Endpoint:** `GET /api/v1/events/{eventId}/vendors`

**Purpose:** Fetch vendors for the event

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "vendors": [
      {
        "id": "vendor_123",
        "name": "SafariAng",
        "category": "Photography",
        "contact": {
          "phone": "+2348012345678",
          "email": "safari@example.com"
        },
        "isOnline": true,
        "avatar": "https://cdn.example.com/vendors/vendor_123.jpg"
      },
      {
        "id": "vendor_456",
        "name": "Dwo Events",
        "category": "Catering",
        "contact": {
          "phone": "+2348087654321",
          "email": "dwo@example.com"
        },
        "isOnline": false,
        "avatar": "https://cdn.example.com/vendors/vendor_456.jpg"
      }
    ]
  }
}
```

---

### 12. Get Event Planners

**Endpoint:** `GET /api/v1/events/{eventId}/planners`

**Purpose:** Fetch co-planners for the event

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "planners": [
      {
        "id": "user_123",
        "name": "OladapoHabib",
        "role": "host",
        "avatar": "https://cdn.example.com/avatars/user_123.jpg",
        "permissions": ["edit", "invite", "manage_budget", "delete"],
        "addedAt": "2024-11-24T11:42:00Z"
      }
    ]
  }
}
```

---

## GUEST Tab APIs

### 13. Get Event Guests

**Endpoint:** `GET /api/v1/events/{eventId}/guests`

**Purpose:** Fetch guest list with filters

**Query Parameters:**
- `status` (optional): `all` | `confirmed` | `invited` | `declined`
- `search` (optional): Search by name, email, or phone
- `page` (optional): Page number
- `limit` (optional): Items per page

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "guests": [
      {
        "id": "guest_123",
        "name": "Bankole Sasa",
        "phone": "+2348055632369",
        "email": "bankole@example.com",
        "status": "invited",
        "rsvpDate": null,
        "isOnline": true,
        "avatar": "https://cdn.example.com/avatars/guest_123.jpg",
        "invitedAt": "2024-11-24T12:00:00Z"
      }
    ],
    "stats": {
      "total": 150,
      "confirmed": 45,
      "invited": 100,
      "declined": 5
    },
    "pagination": {
      "currentPage": 1,
      "totalPages": 8,
      "totalItems": 150
    }
  }
}
```

---

### 14. Add Guest

**Endpoint:** `POST /api/v1/events/{eventId}/guests`

**Purpose:** Add a new guest to the event

**Request Body:**
```json
{
  "name": "John Doe",
  "phone": "+2348012345678",
  "email": "john@example.com"
}
```

**Response (201 Created):**
```json
{
  "success": true,
  "data": {
    "id": "guest_789",
    "name": "John Doe",
    "status": "invited",
    "invitedAt": "2024-11-25T10:30:00Z"
  },
  "message": "Guest added successfully"
}
```

---

## CHAT Tab APIs

### 15. Get Event Messages

**Endpoint:** `GET /api/v1/events/{eventId}/messages`

**Purpose:** Fetch chat messages for the event

**Query Parameters:**
- `page` (optional): Page number
- `limit` (optional): Messages per page (default: 50)
- `before` (optional): Get messages before this timestamp

**Response (200 OK):**
```json
{
  "success": true,
  "data": {
    "messages": [
      {
        "id": "msg_123",
        "type": "system",
        "content": "Created Event 🎉",
        "senderId": null,
        "senderName": "System",
        "timestamp": "2024-11-24T11:42:00Z",
        "isRead": true
      },
      {
        "id": "msg_456",
        "type": "user",
        "content": "Hello all",
        "senderId": "user_123",
        "senderName": "Oladapo",
        "senderAvatar": "https://cdn.example.com/avatars/user_123.jpg",
        "timestamp": "2024-11-24T11:47:00Z",
        "isRead": true
      }
    ],
    "pagination": {
      "hasMore": false,
      "nextCursor": null
    }
  }
}
```

---

### 16. Send Message

**Endpoint:** `POST /api/v1/events/{eventId}/messages`

**Purpose:** Send a chat message

**Request Body:**
```json
{
  "content": "Looking forward to the event!",
  "type": "user"
}
```

**Response (201 Created):**
```json
{
  "success": true,
  "data": {
    "id": "msg_789",
    "content": "Looking forward to the event!",
    "senderId": "user_123",
    "timestamp": "2024-11-25T10:30:00Z"
  }
}
```

**Real-time Updates:**
- Implement WebSocket connection: `wss://api.example.com/events/{eventId}/chat`
- Send new messages to all connected clients
- Include sender info and timestamp

---

## Data Models

### Event Model
```typescript
interface Event {
  id: string;
  name: string;
  description?: string;
  category: string;
  emoji: string;
  startDate: string; // ISO 8601
  endDate: string;   // ISO 8601
  createdAt: string;
  updatedAt: string;
  status: 'upcoming' | 'ongoing' | 'past';
  role: 'creator' | 'guest' | 'co-planner';
  isBookmarked: boolean;
  host: User;
  location?: Location;
  budget: Budget;
  settings: EventSettings;
  media: EventMedia;
  stats: EventStats;
  colorTheme: string;
}
```

### User Model
```typescript
interface User {
  id: string;
  name: string;
  email?: string;
  phone?: string;
  avatar?: string;
}
```

### Location Model
```typescript
interface Location {
  address: string;
  latitude: number;
  longitude: number;
  placeId?: string;
}
```

### Budget Model
```typescript
interface Budget {
  total: number;
  spent: number;
  remaining: number;
  currency: string;
  currencySymbol: string;
  items?: BudgetItem[];
  progress?: number; // 0-1
}
```

### EventSettings Model
```typescript
interface EventSettings {
  isPublic: boolean;
  websiteLink: string;
  rsvpButtonText: string;
  keepMemoriesPrivate: boolean;
  disableGuestMemories: boolean;
  acceptGuestContributions: boolean;
  disablePublicRSVP: boolean;
  enableWebhook: boolean;
  webhookUrl?: string;
}
```

---

## Error Handling

All error responses should follow this format:

```json
{
  "success": false,
  "error": {
    "code": "EVENT_NOT_FOUND",
    "message": "Event not found",
    "details": "The event with ID evt_abc123 does not exist or you don't have access"
  }
}
```

### Common Error Codes:
- `UNAUTHORIZED` (401): Invalid or missing token
- `FORBIDDEN` (403): User doesn't have permission
- `EVENT_NOT_FOUND` (404): Event doesn't exist
- `VALIDATION_ERROR` (422): Invalid request data
- `RATE_LIMIT_EXCEEDED` (429): Too many requests
- `INTERNAL_ERROR` (500): Server error

---

## Testing Checklist

### Event List Screen:
- [ ] Fetch upcoming events
- [ ] Fetch past events
- [ ] Filter by role (creator, guest, co-planner)
- [ ] Bookmark/unbookmark events
- [ ] Pagination works correctly
- [ ] Empty states for no events

### Event Details Screen:
- [ ] Fetch complete event details
- [ ] Update event information
- [ ] Update event settings
- [ ] Upload event poster
- [ ] Delete event (creator only)

### PLAN Tab:
- [ ] Fetch budget details
- [ ] Fetch task list
- [ ] Update task status
- [ ] Fetch vendors list
- [ ] Fetch planners list

### GUEST Tab:
- [ ] Fetch guest list with pagination
- [ ] Filter guests by status
- [ ] Search guests
- [ ] Add new guest
- [ ] Guest stats are accurate

### CHAT Tab:
- [ ] Fetch message history
- [ ] Send new message
- [ ] WebSocket real-time updates
- [ ] System messages appear correctly
- [ ] Message timestamps are correct

---

## Performance Requirements

1. **Response Time:**
   - List endpoints: < 500ms
   - Detail endpoints: < 1s
   - Upload endpoints: < 5s

2. **Pagination:**
   - Default page size: 20 items
   - Max page size: 100 items

3. **Caching:**
   - Event details: Cache for 5 minutes
   - Event list: Cache for 2 minutes
   - Use ETags for conditional requests

4. **Rate Limiting:**
   - 100 requests per minute per user
   - 10 uploads per hour per user

---

## Security Requirements

1. **Authentication:**
   - JWT tokens with 24-hour expiry
   - Refresh tokens for extended sessions

2. **Authorization:**
   - Only event creator can delete events
   - Only creator and co-planners can edit
   - Guests can only view

3. **Data Validation:**
   - Sanitize all user inputs
   - Validate file uploads (type, size)
   - Prevent SQL injection

4. **Privacy:**
   - Respect event privacy settings
   - Don't expose private events in public APIs
   - Mask sensitive guest information

---

## Questions?

Contact the mobile team:
- **Slack:** #mobile-dev
- **Email:** mobile-team@example.com

**Last Updated:** November 30, 2024
