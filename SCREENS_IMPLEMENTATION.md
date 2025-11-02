# Faji App - Screens Implementation

This document provides an overview of all the screens implemented based on the Figma designs.

## Implemented Screens

### 1. My Tickets Screen
**Location:** `lib/features/tickets/presentation/screens/my_tickets_screen.dart`

**Features:**
- Back button and settings button in header
- "Organize an event" button with add icon
- List of ticket cards with event details
- Event cards show:
  - Event image background
  - Event title
  - Date, time, and price information
  - Like/favorite button
  - Blur effect on bottom overlay
- Bottom navigation bar with home, favorites, tickets, and profile icons

**Design Details:**
- Background: `#1F1F1F`
- Card background: `#043D9E` (eventCardBlue)
- Overlay: Backdrop blur with `rgba(7, 7, 7, 0.43)`
- Border radius: 40px for cards, 37px for buttons

---

### 2. Organize Event Screen
**Location:** `lib/features/organize_event/presentation/screens/organize_event_screen.dart`

**Features:**
- Back button in header
- Title: "Organize an event"
- Subtitle: "Fill out the fields below to host an event"
- Form fields:
  - Add Title
  - Add Cover photos (with photo icon)
  - Description (multi-line with word counter: 0-500 words)
  - Add event date (with calendar icon)
  - Add event time
  - Add event seats
  - Add event location (with location icon)
  - Add ticket price
- "Organize an event" button at bottom

**Design Details:**
- All input fields use `rgba(40, 40, 40, 0.81)` background
- Border radius: 37px for input fields
- Description field height: 183px
- Button color: `#FD99C9` (primary)

---

### 3. Favorites Screen
**Location:** `lib/features/favorites/presentation/screens/favorites_screen.dart`

**Features:**
- Back button in header with "Favorites" title
- Search bar with "Search your favorites" placeholder
- Filter tabs: "Events" and "Organizer"
- Event cards with:
  - "Live" badge for live events
  - Event image background
  - Like button (filled heart)
  - Event details overlay with blur effect
  - Date, time, and price information
- Bottom navigation bar

**Design Details:**
- Live badge: `#CA4638` (liveRed)
- Filter chips: `rgba(21, 21, 21, 0.81)` background
- Selected filter: `#FD99C9` text color
- Card height: 295px

---

### 4. Chat List Screen
**Location:** `lib/features/chat/presentation/screens/chat_list_screen.dart`

**Features:**
- Back button and more options button in header
- "Chat" title centered
- Search bar with "Search chat" placeholder
- Filter tabs: "Events chat" and "Organizers"
- Chat list items showing:
  - Avatar (circular for users, custom for events)
  - Name and last message
  - Time stamp
  - Unread message count badge
  - "typing" indicator for active chats
- Event chat shows custom "GENfest" logo

**Design Details:**
- Unread badge: `#FD99C9` circular badge
- Avatar size: 45-46px
- Typing indicator: `#FD99C9` text
- Message preview: `#616161` color

---

### 5. Chat Detail Screen (Event Chat)
**Location:** `lib/features/chat/presentation/screens/chat_detail_screen.dart`

**Features:**
- Header with back, more, search, and call buttons
- Event info section:
  - Event avatar with "GENfest" logo
  - Event title
  - Online status (green dot)
  - User count (200+ users)
- Organizer badge icon
- Message bubbles:
  - Organizer messages (left-aligned, pink name)
  - User messages (right-aligned, yellow name)
  - System messages (centered, gray background)
  - Timestamps on each message
- Date separator
- "Only admins can send messages" footer

**Design Details:**
- Message bubble: `rgba(40, 40, 40, 0.8)` background
- Organizer name: `#FD99C9`
- User name: `#FEB822`
- Online indicator: `#7FD249`
- Border radius: 18-21px for bubbles

---

### 6. Organizer Chat Screen
**Location:** `lib/features/chat/presentation/screens/organizer_chat_screen.dart`

**Features:**
- Similar header to event chat
- Organizer profile section:
  - Profile picture
  - Name: "Rolling 5T0NES"
  - Role: "Organizer"
  - Online status indicator
- Message bubbles (organizer and user)
- Message input field at bottom:
  - "Message" placeholder
  - Send button (pink circular with arrow)

**Design Details:**
- Input field: `rgba(40, 40, 40, 0.81)` background
- Send button: `#FD99C9` with white arrow icon
- Border radius: 34.5px for input field

---

### 7. Profile Screen
**Location:** `lib/features/profile/presentation/screens/profile_screen.dart`

**Features:**
- Back button and settings button in header
- Profile section:
  - Profile picture (106px circular)
  - Name: "Rolling 5T0NES"
  - Email: "rolling5tones@gmail.com"
- Current Balance card:
  - Shows "$230.00" in yellow
  - Arrow icon for navigation
- Menu sections:
  - **Personal:** Account setting, Events history
  - **Preferences:** Payment Methods, Notifications, Subscriptions
  - **Resources:** Contact Support, Terms & Conditions, Rate in App Store
- Each menu item has an icon and arrow
- "Log out" button at bottom (red text with logout icon)

**Design Details:**
- Balance amount: `#FEB822` (yellow)
- Section dividers: `#2E2E2E` (0.6px height)
- Log out color: `#CA4638` (red)
- Menu item icons: 15px size

---

### 8. Support Screen
**Location:** `lib/features/support/presentation/screens/support_screen.dart`

**Features:**
- Back button with "Support" title centered
- Support illustration (278x278px placeholder)
- Heading: "Hello, how can we help you?"
- Three support options:
  - Contact live chat
  - Send us an email
  - FAQs
- Each option has an arrow icon

**Design Details:**
- Heading font size: 32px
- Option buttons: 69px height
- Border radius: 34.5px
- Background: `rgba(40, 40, 40, 0.81)`

---

### 9. Terms & Conditions Screen
**Location:** `lib/features/terms/presentation/screens/terms_screen.dart`

**Features:**
- Back button and help button (?) in header
- Title: "Terms & Conditions"
- Last updated date: "Last updated Mar 10, 2024"
- Content sections:
  - Introduction paragraph
  - 1 - Conditions of use
  - 2 - Privacy Policy
  - Intellectual Property
- "Accept" button (pink)
- "Decline" text button

**Design Details:**
- Section titles: 16px, regular weight
- Body text: 13px, thin weight, 1.23 line height
- Accept button: `#FD99C9` background
- Decline button: text only, white color

---

## Design System Usage

All screens follow the established design system:

### Colors
- Background: `#1F1F1F`
- Primary: `#FD99C9`
- On Surface: `#F8F8F8`
- Surface Container: `rgba(40, 40, 40, 0.81)`
- Text Secondary: `#AAA9A9`
- Text Tertiary: `#616161`
- Event Card Blue: `#043D9E`
- Live Red: `#CA4638`
- Success Green: `#7FD249`
- Warning Yellow: `#FEB822`

### Typography
- **Display:** Neue Haas Grotesk Display Pro, 28-37px, 600 weight
- **Headline:** Neue Haas Grotesk Display Pro, 20-28px, 600 weight
- **Title:** Neue Haas Grotesk Display Pro, 16-22px, 600 weight
- **Label:** Neue Haas Grotesk Display Pro, 14-18px, 600 weight
- **Body:** PP Neue Montreal, 14-17px, 100 weight

### Common Components
- **Back Button:** 50x50px circular, `rgba(40, 40, 40, 0.81)` background
- **Input Fields:** 69px height, 37px border radius
- **Primary Button:** `#FD99C9` background, 69px height, 34.5px border radius
- **Bottom Nav:** 88px height, 44px border radius, backdrop blur

### Spacing
- Header padding: 24px horizontal, 10px vertical
- Content padding: 24px horizontal
- Section spacing: 16-40px between major sections
- Item spacing: 8-20px between list items

## Navigation Structure

```
├── My Tickets Screen
│   └── Organize Event Screen
├── Favorites Screen
├── Chat List Screen
│   ├── Chat Detail Screen (Event)
│   └── Organizer Chat Screen
├── Profile Screen
│   ├── Support Screen
│   └── Terms & Conditions Screen
```

## Notes

1. All screens use the existing `AppColors`, `AppTypography`, and `AppSpacing` from the design system
2. No hardcoded colors, fonts, or spacing values
3. All measurements are pixel-perfect according to Figma designs
4. Backdrop blur effects are applied where specified in designs
5. Icons use Material Icons with appropriate sizes
6. All screens are responsive and follow Material 3 guidelines
7. Screens maintain consistent navigation patterns

## Testing Recommendations

1. Test all navigation flows between screens
2. Verify color accuracy against Figma designs
3. Test on different screen sizes (iPhone 13/14 base)
4. Verify text overflow handling
5. Test interactive elements (buttons, tabs, inputs)
6. Verify backdrop blur effects on supported devices
7. Test dark theme consistency across all screens
