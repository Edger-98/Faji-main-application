# Home Feature

The home feature implements the main dashboard/homescreen of the Faji app, matching the Figma design (node-id=2-648).

## Structure

```
home/
├── presentation/
│   ├── screens/
│   │   └── home_screen.dart          # Main home screen with bottom nav
│   └── widgets/
│       ├── category_filter_section.dart    # Horizontal category chips
│       ├── event_card.dart                 # Large event card (306x267)
│       ├── flash_deal_section.dart         # Promotional flash deal
│       ├── home_bottom_nav.dart            # Bottom navigation with blur
│       ├── home_header.dart                # Header with greeting & notification
│       ├── home_search_bar.dart            # Search bar component
│       ├── organizer_card.dart             # Organizer profile card
│       ├── section_header.dart             # Reusable section header
│       ├── trending_events_section.dart    # Trending events list
│       ├── trending_organizers_section.dart # Trending organizers list
│       ├── upcoming_event_card.dart        # Smaller event card (196x267)
│       ├── upcoming_events_section.dart    # Upcoming events list
│       ├── your_events_section.dart        # User's events list
│       └── widgets.dart                    # Barrel file
├── home_feature.dart                       # Feature barrel file
└── README.md

```

## Features

### Bottom Navigation
- 5 tabs: Home, Search, Tickets, Messages, Profile
- Blur effect with backdrop filter
- Pink accent color for active state
- Smooth transitions between tabs
- Functional navigation using IndexedStack

### Home Tab Sections

1. **Header**
   - Personalized greeting
   - Notification bell with badge indicator

2. **Search Bar**
   - Search input with filter icon
   - Rounded design with blur background

3. **Trending Events**
   - Horizontal scrollable event cards
   - Live badge for active events
   - Favorite button
   - Event details overlay with blur

4. **Category Filter**
   - Horizontal scrollable chips
   - Categories: All, Concert, Sports, Music, Artist
   - Active state with pink highlight

5. **Upcoming Events**
   - Smaller event cards with date badge
   - Organizer info at bottom
   - Gradient overlay

6. **Flash Deal**
   - Promotional card with countdown timer
   - QR code placeholder
   - Promocode indicator

7. **Your Events**
   - User's registered/saved events
   - Same card style as trending events

8. **Trending Organizers**
   - Profile cards with images
   - Name overlay with gradient

## Design Tokens

### Colors
- Background: `#1F1F1F`
- Primary (Pink): `#FD99C9`
- Blue: `#043D9E`
- Red (Live): `#CA4638`
- Text Primary: `#F8F8F8`
- Text Secondary: `#AAA9A9`
- Text Tertiary: `#616161`

### Typography
- Display: Neue Haas Grotesk Display Pro
- Body: PP Neue Montreal

### Border Radius
- Cards: 40px
- Pills/Chips: 34.5px
- Bottom Nav: 44px

### Effects
- Backdrop blur: 40px sigma
- Gradient overlays for readability

## Usage

```dart
import 'package:fajimobileapp/features/home/home_feature.dart';

// Navigate to home
context.goNamed(RouteManager.homeName);

// Or use directly
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => const HomeScreen()),
);
```

## TODO

- [ ] Connect to real event data API
- [ ] Implement event details navigation
- [ ] Add pull-to-refresh functionality
- [ ] Implement search functionality
- [ ] Add favorite/bookmark persistence
- [ ] Implement other tab screens (Search, Tickets, Messages, Profile)
- [ ] Add skeleton loaders for async data
- [ ] Implement countdown timer for flash deals
- [ ] Add analytics tracking
- [ ] Optimize image loading with caching
