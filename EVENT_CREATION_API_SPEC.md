# Event Creation API Specification

## Overview
This document specifies the API endpoints and data structures needed for the complete event creation flow, including themes and posters.

**Base URL:** `http://localhost:5001/api/v1` (dev) | `https://faji-backend-52878caa6589.herokuapp.com/api/v1` (prod)

**Key Points:**
- ✅ Backend already implemented
- ✅ No image URLs - frontend generates gradients from colors array
- ✅ Supports custom poster upload via multipart/form-data
- ✅ Cloudinary integration for media uploads
- ✅ JWT authentication required (except public endpoints)

---

## 1. Get Available Themes

**Endpoint:** `GET /api/v1/event-themes`

**Purpose:** Fetch all available color themes for events

**Authentication:** Not required (public endpoint)

**Response:**
```json
{
  "success": true,
  "data": {
    "themes": [
      {
        "id": "theme_green",
        "name": "Fresh Green",
        "colors": ["#B8E986", "#8FD14F"],
        "preview": "https://cdn.example.com/themes/green.jpg"
      },
      {
        "id": "theme_purple",
        "name": "Royal Purple",
        "colors": ["#B794F6", "#9F7AEA"],
        "preview": "https://cdn.example.com/themes/purple.jpg"
      },
      {
        "id": "theme_orange",
        "name": "Sunset Orange",
        "colors": ["#FF6B6B", "#FF8C42"],
        "preview": "https://cdn.example.com/themes/orange.jpg"
      },
      {
        "id": "theme_blue",
        "name": "Ocean Blue",
        "colors": ["#4A90E2", "#7B68EE"],
        "preview": "https://cdn.example.com/themes/blue.jpg"
      },
      {
        "id": "theme_pink",
        "name": "Sweet Pink",
        "colors": ["#FF6B9D", "#FF8FB3"],
        "preview": "https://cdn.example.com/themes/pink.jpg"
      }
    ]
  }
}
```

---

## 2. Get Available Posters

**Endpoint:** `GET /api/v1/event-posters`

**Purpose:** Fetch all available poster templates

**Authentication:** Not required (public endpoint)

**Query Parameters:**
- `category` (optional): Filter by category (e.g., `?category=wedding`)

**Response:**
```json
{
  "success": true,
  "data": {
    "posters": [
      {
        "id": "poster_show_up_turn_up",
        "name": "Show Up & Turn Up",
        "thumbnail": "https://cdn.example.com/posters/show_up_thumb.jpg",
        "fullImage": "https://cdn.example.com/posters/show_up_full.jpg",
        "colors": ["#6B4FBB", "#FF6B9D", "#FFA500"],
        "category": "party"
      },
      {
        "id": "poster_specially_invited",
        "name": "You Are Specially Invited",
        "thumbnail": "https://cdn.example.com/posters/specially_invited_thumb.jpg",
        "fullImage": "https://cdn.example.com/posters/specially_invited_full.jpg",
        "colors": ["#FFFFFF", "#E0E0E0"],
        "category": "formal"
      },
      {
        "id": "poster_rainbow",
        "name": "You Are Invited - Rainbow",
        "thumbnail": "https://cdn.example.com/posters/rainbow_thumb.jpg",
        "fullImage": "https://cdn.example.com/posters/rainbow_full.jpg",
        "colors": ["#00D4FF", "#FF00FF", "#FFFF00"],
        "category": "fun"
      },
      {
        "id": "poster_colorful_invite",
        "name": "You Are Specially Invited - Colorful",
        "thumbnail": "https://cdn.example.com/posters/colorful_thumb.jpg",
        "fullImage": "https://cdn.example.com/posters/colorful_full.jpg",
        "colors": ["#FF0080", "#7928CA", "#FF0080"],
        "category": "fun"
      },
      {
        "id": "poster_cute_characters",
        "name": "Cute Characters",
        "thumbnail": "https://cdn.example.com/posters/cute_thumb.jpg",
        "fullImage": "https://cdn.example.com/posters/cute_full.jpg",
        "colors": ["#FF6B9D", "#FF1744"],
        "category": "birthday"
      },
      {
        "id": "poster_special_guest",
        "name": "Be Our Special Guest",
        "thumbnail": "https://cdn.example.com/posters/special_guest_thumb.jpg",
        "fullImage": "https://cdn.example.com/posters/special_guest_full.jpg",
        "colors": ["#6B4FBB", "#FF6B9D"],
        "category": "party"
      },
      {
        "id": "poster_lets_celebrate",
        "name": "Let's Celebrate Together",
        "thumbnail": "https://cdn.example.com/posters/celebrate_thumb.jpg",
        "fullImage": "https://cdn.example.com/posters/celebrate_full.jpg",
        "colors": ["#FFD700", "#FF6B6B"],
        "category": "party"
      },
      {
        "id": "poster_join_us",
        "name": "Join Us For A Special Day",
        "thumbnail": "https://cdn.example.com/posters/join_us_thumb.jpg",
        "fullImage": "https://cdn.example.com/posters/join_us_full.jpg",
        "colors": ["#4A90E2", "#7B68EE"],
        "category": "wedding"
      },
      {
        "id": "poster_party_time",
        "name": "It's Party Time!",
        "thumbnail": "https://cdn.example.com/posters/party_time_thumb.jpg",
        "fullImage": "https://cdn.example.com/posters/party_time_full.jpg",
        "colors": ["#FF6B6B", "#FFD93D"],
        "category": "party"
      },
      {
        "id": "poster_save_the_date",
        "name": "Save The Date",
        "thumbnail": "https://cdn.example.com/posters/save_date_thumb.jpg",
        "fullImage": "https://cdn.example.com/posters/save_date_full.jpg",
        "colors": ["#FFB6C1", "#98D8C8"],
        "category": "wedding"
      }
    ],
    "categories": ["party", "formal", "fun", "birthday", "wedding", "corporate"]
  }
}
```

**Note:** Frontend generates gradient visuals from the `colors` array. No image URLs needed.

---

## 3. Create Event (Complete Flow)

**Endpoint:** `POST /api/v1/events`

**Authentication:** Required (Bearer token)

**Content-Type:** `application/json` (or `multipart/form-data` for custom poster upload)

**Request Body (JSON):**
```json
{
  "name": "Sarah's Birthday Bash",
  "description": "Join us for an unforgettable celebration!",
  "category": "Birthday",
  "emoji": "🎉",
  
  "startDate": "2025-12-15T18:00:00Z",
  "endDate": "2025-12-15T23:00:00Z",
  
  "themeId": "theme_purple",
  "posterId": "poster_show_up_turn_up",
  
  "websiteLink": "sarahs-birthday-2025",
  "rsvpButtonText": "Celebrate With Us",
  
  "expectedGuests": 50,
  "budget": 150000,
  
  "location": {
    "address": "123 Party Street, Lagos",
    "latitude": 6.5244,
    "longitude": 3.3792
  },
  
  "settings": {
    "isPublic": false,
    "keepMemoriesPrivate": false,
    "disableGuestMemories": false,
    "acceptGuestContributions": true,
    "disablePublicRSVP": false
  }
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "id": "evt_abc123xyz",
    "name": "Sarah's Birthday Bash",
    "category": "Birthday",
    "emoji": "🎉",
    "startDate": "2025-12-15T18:00:00Z",
    "endDate": "2025-12-15T23:00:00Z",
    
    "theme": {
      "id": "theme_purple",
      "name": "Royal Purple",
      "colors": ["#B794F6", "#9F7AEA"]
    },
    
    "poster": {
      "id": "poster_show_up_turn_up",
      "name": "Show Up & Turn Up",
      "url": "https://cdn.example.com/posters/show_up_full.jpg",
      "thumbnail": "https://cdn.example.com/posters/show_up_thumb.jpg"
    },
    
    "host": {
      "id": "user_123",
      "name": "John Doe",
      "avatar": "https://cdn.example.com/avatars/user_123.jpg"
    },
    
    "settings": {
      "websiteLink": "sarahs-birthday-2025",
      "rsvpButtonText": "Celebrate With Us",
      "isPublic": false
    },
    
    "stats": {
      "expectedGuests": 50,
      "confirmedGuests": 0
    },
    
    "createdAt": "2024-12-01T10:30:00Z"
  }
}
```

---

## 4. Mobile App Flow

### Step 1: App Opens Event Creation
```
App → GET /api/v1/event-themes
App → GET /api/v1/event-posters
```

### Step 2: User Fills Details
- Event name, description, dates
- Expected guests, budget

### Step 3: User Picks Theme
Shows grid: "Fresh Green", "Royal Purple", "Sunset Orange"...

### Step 4: User Picks Poster
Shows grid: "Show Up & Turn Up", "You Are Specially Invited", "Be Our Special Guest"...

### Step 5: Submit
```
App → POST /api/v1/events
{
  "name": "...",
  "themeId": "theme_purple",
  "posterId": "poster_show_up_turn_up"
}
```

---

## 5. Quick Reference

### Endpoints
```
GET  /api/v1/event-themes          → Get all themes
GET  /api/v1/event-posters         → Get all posters
POST /api/v1/events                → Create event
```

### Minimal Request
```json
{
  "name": "My Party",
  "category": "Birthday",
  "themeId": "theme_purple",
  "posterId": "poster_show_up_turn_up"
}
```

### Complete Request
```json
{
  "name": "My Party",
  "description": "Let's celebrate!",
  "category": "Birthday",
  "emoji": "🎉",
  "startDate": "2025-12-15T18:00:00Z",
  "endDate": "2025-12-15T23:00:00Z",
  "themeId": "theme_purple",
  "posterId": "poster_show_up_turn_up",
  "websiteLink": "my-party-2025",
  "rsvpButtonText": "Join Us",
  "expectedGuests": 50,
  "budget": 100000
}
```

---

**That's it! Posters with the right vibe.** 🎉

**Last Updated:** December 1, 2025
