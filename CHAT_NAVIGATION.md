# Chat Navigation Paths

## How to Access Chat Screens

### 1. Chat List Screen (`/chat-list`)

**Access from:**
- **Home Screen Header** - Click the chat bubble icon (next to notifications)
  - Path: Home → Chat icon → Chat List

### 2. Organizer Chat Screen (`/organizer-chat`)

**Access from:**
- **Event Details Screen** - Click the "Chat" button below the organizer info
  - Path: Home → Event Card → Event Details → Chat button → Organizer Chat

### 3. Chat Detail Screen (`/chat-detail`)

**Access from:**
- **Chat List Screen** - Click on any conversation in the list
  - Path: Home → Chat icon → Chat List → Select conversation → Chat Detail

---

## Navigation Flow Diagram

```
Home Screen
├── Chat Icon (Header) → Chat List Screen
│   └── Select Conversation → Chat Detail Screen
│
└── Event Card → Event Details Screen
    └── Chat Button → Organizer Chat Screen
```

---

## Screen Descriptions

### Chat List Screen
- Shows all your conversations
- Displays recent messages and timestamps
- Search functionality for finding conversations
- Navigate to individual chat details

### Organizer Chat Screen
- Direct chat with event organizer
- Specific to the event you're viewing
- Send messages and media
- Real-time messaging interface

### Chat Detail Screen
- One-on-one conversation view
- Full message history
- Send text, images, and other media
- Message timestamps and read receipts

---

## Implementation Details

### Files Modified
1. `lib/features/event_details/presentation/screens/event_details_screen.dart`
   - Added `GestureDetector` to Chat button
   - Navigation: `context.push(RouteManager.organizerChat)`

2. `lib/features/home/presentation/widgets/home_header.dart`
   - Added chat bubble icon next to notifications
   - Navigation: `context.push(RouteManager.chatList)`

### Routes Used
- `/chat-list` - Main chat list
- `/chat-detail` - Individual conversation
- `/organizer-chat` - Event organizer chat

---

## Testing Checklist

- [x] Chat icon appears in home header
- [x] Chat icon navigates to chat list
- [x] Chat button appears in event details
- [x] Chat button navigates to organizer chat
- [x] No diagnostics errors
- [ ] Test navigation flow end-to-end
- [ ] Verify back navigation works correctly
