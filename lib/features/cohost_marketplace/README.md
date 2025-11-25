# Co-Host Marketplace Feature

## Overview
Marketplace for discovering and booking co-hosts (vendors) who offer various resources like venues, entertainment, promotion, security, catering, and more for events.

## Status
✅ **Phase 2 - Core Marketplace**: IN PROGRESS
- [x] Domain entities (ResourceCategory, CohostResourceEntity, CohostProfileEntity)
- [x] Resource Categories Screen
- [x] Co-Host List Screen
- [x] Mock data provider
- [x] Integration with event creation flow
- [ ] Co-Host Profile Screen (TODO)
- [ ] Negotiation Screen (TODO)
- [ ] Booking system (TODO)

## Architecture
Follows Clean Architecture pattern with Domain, Data, and Presentation layers.

## Features Implemented

### 1. Resource Categories ✅
**Screen**: `resource_categories_screen.dart`

**Features**:
- Grid layout of 8 resource categories
- Each category shows:
  - Icon emoji
  - Display name
  - Description
  - Selection state
- Multi-select functionality
- Continue button shows count of selected categories
- Validation (must select at least one)

**Categories**:
1. 🏠 Venue - Penthouses, halls, outdoor spaces
2. 🎵 Entertainment - DJs, bands, performers
3. 📢 Promotion - Influencers, social media marketing
4. 🔒 Security - Bouncers, guest screening
5. 🍽️ Catering - Food, drinks, bartenders
6. 📸 Media - Photography, videography
7. 🎤 Equipment - Sound systems, lighting
8. 👥 Staffing - Servers, coordinators

### 2. Co-Host List ✅
**Screen**: `cohost_list_screen.dart`

**Features**:
- List of co-hosts filtered by category
- Each card shows:
  - Profile photo (placeholder with initial)
  - Co-host name
  - Verification badge (if verified)
  - Rating (stars + review count)
  - Resource title
  - Description (2 lines max)
  - Events completed count
  - Availability status
  - Base price (formatted: ₦500K, ₦1.2M)
- Tap to view profile (TODO)
- Header shows category icon, name, and count

### 3. Mock Data Provider ✅
**File**: `data/mock_cohost_data.dart`

**Features**:
- 10 mock co-host resources (1-2 per category)
- Realistic Nigerian event vendor data
- Filter by category
- Includes all entity fields

## Integration with Event Creation Flow

### Flow:
```
Event Config Screen (Step 2)
  ↓
Enable "Vendors Feature" toggle
  ↓
Tap "Continue"
  ↓
Resource Categories Screen
  ↓
Select categories (e.g., DJ, Venue)
  ↓
Tap "Continue"
  ↓
Co-Host List Screen (filtered by category)
  ↓
Tap on a co-host
  ↓
[TODO] Co-Host Profile Screen
  ↓
[TODO] Request & Negotiate
  ↓
Return to Event Poster Selection (Step 3)
```

## File Structure

```
lib/features/cohost_marketplace/
├── domain/
│   └── entities/
│       ├── resource_category.dart              ✅ Enum with 8 categories
│       ├── cohost_resource_entity.dart         ✅ Resource entity
│       ├── cohost_resource_entity.freezed.dart ✅ (generated)
│       ├── cohost_profile_entity.dart          ✅ Profile entity
│       └── cohost_profile_entity.freezed.dart  ✅ (generated)
├── data/
│   └── mock_cohost_data.dart                   ✅ Mock data provider
├── presentation/
│   ├── screens/
│   │   ├── resource_categories_screen.dart     ✅ Category selection
│   │   ├── cohost_list_screen.dart             ✅ List of co-hosts
│   │   ├── cohost_profile_screen.dart          ⏳ TODO
│   │   └── negotiation_screen.dart             ⏳ TODO
│   ├── widgets/
│   │   └── (reusable widgets)                  ⏳ TODO
│   ├── viewmodels/
│   │   └── (state management)                  ⏳ TODO
│   └── providers/
│       └── (riverpod providers)                ⏳ TODO
├── cohost_marketplace.dart                     ✅ Feature exports
└── README.md                                   ✅ This file
```

## Usage

### Navigate to Resource Categories:
```dart
// From event config screen (when co-host toggle is enabled)
Navigator.pushNamed(context, '/resource-categories');
```

### Navigate to Co-Host List:
```dart
// From resource categories screen
Navigator.pushNamed(
  context,
  '/cohost-list',
  arguments: ResourceCategory.venue, // or any category
);
```

## Data Models

### ResourceCategory (Enum)
```dart
enum ResourceCategory {
  venue,
  entertainment,
  promotion,
  security,
  catering,
  media,
  equipment,
  staffing,
}
```

Each has:
- `displayName`: String (e.g., "Venue")
- `icon`: String (emoji, e.g., "🏠")
- `description`: String (e.g., "Penthouses, halls, outdoor spaces")

### CohostResourceEntity
```dart
{
  id: String,
  cohostId: String,
  cohostName: String,
  category: ResourceCategory,
  title: String,
  description: String,
  photos: List<String>,
  basePrice: double,
  isAvailable: bool,
  rating: double,
  reviewCount: int,
  profilePhoto: String?,
  eventsCompleted: int?,
  isVerified: bool?,
}
```

### CohostProfileEntity
```dart
{
  id: String,
  name: String,
  bio: String,
  profilePhoto: String,
  categories: List<ResourceCategory>,
  rating: double,
  eventsCompleted: int,
  isVerified: bool,
  portfolio: List<String>?,
  location: String?,
  responseTime: String?,
}
```

## Mock Data Examples

### Venue:
- **Sarah Johnson** - Luxury Penthouse, Victoria Island (₦500K, 4.9★, 52 events)
- **Michael Okonkwo** - Garden Event Space, Lekki (₦350K, 4.7★, 41 events)

### Entertainment:
- **DJ Spinmaster** - Professional DJ Services (₦150K, 4.8★, 120 events)
- **The Groove Band** - Live Band Performance (₦400K, 4.9★, 78 events)

### Promotion:
- **Chioma Adeleke** - Social Media Influencer, 500K followers (₦200K, 4.6★, 45 events)

### Security:
- **Elite Security Services** - Professional Event Security (₦180K, 4.9★, 95 events)

### Catering:
- **Chef Amaka's Kitchen** - Full Service Catering (₦300K, 4.8★, 88 events)

### Media:
- **Lens & Light Studios** - Photography & Videography (₦250K, 4.9★, 134 events)

### Equipment:
- **SoundWave Rentals** - Professional Sound & Lighting (₦120K, 4.7★, 67 events)

### Staffing:
- **Premier Event Staff** - Event Coordinators & Servers (₦100K, 4.8★, 102 events)

## Next Steps (Phase 2 Continuation)

### 3. Co-Host Profile Screen
**Features to build**:
- Full profile view
- About section
- Resources offered (with photos)
- Pricing details
- Reviews/ratings list
- Portfolio gallery
- "Request Co-Host" button

### 4. Negotiation Screen
**Features to build**:
- Resource details summary
- Default price suggestion
- Payment options:
  - Option A: Pay from ticket sales (% split)
  - Option B: Pay upfront (fixed amount)
- Custom offer input
- Message to co-host
- "Send Request" button

### 5. Booking System
**Features to build**:
- Request creation
- Accept/Decline/Counter-offer
- Negotiation history
- Agreement confirmation
- Store selected co-hosts in event data

### 6. Backend Integration
**APIs needed**:
- `GET /api/resources?category={id}` - Get resources by category
- `GET /api/cohosts/{id}` - Get co-host profile
- `POST /api/bookings` - Create booking request
- `PUT /api/bookings/{id}/negotiate` - Send offer
- `GET /api/bookings/{id}` - Get booking details

## Design System Integration

### Colors:
- Primary: `AppColors.primary` (#FD99C9)
- Background: `AppColors.background` (#1F1F1F)
- Surface: `AppColors.surfaceContainerHighest`
- Success: `AppColors.success` (for "Available" badge)
- Yellow: `AppColors.eventCardYellow` (for star ratings)

### Typography:
- Display: `AppText.displayLarge()` - Screen titles
- Headline: `AppText.headlineSmall()` - Category names
- Title: `AppText.titleMedium()` - Co-host names
- Body: `AppText.bodySmall()` - Descriptions

### Components:
- Circular back button (consistent with event creation flow)
- Grid layout for categories
- List layout for co-hosts
- Card-based design with rounded corners (20.r)
- Profile photo placeholders with initials

## Testing Checklist

- [x] Resource categories screen renders
- [x] All 8 categories display correctly
- [x] Multi-select works
- [x] Continue button updates count
- [x] Validation prevents empty selection
- [x] Navigation to co-host list works
- [x] Co-host list filters by category
- [x] All mock data displays correctly
- [x] Price formatting works (K, M)
- [x] Rating display works
- [x] Verification badge shows for verified co-hosts
- [ ] Profile screen navigation (TODO)
- [ ] Negotiation flow (TODO)
- [ ] Booking creation (TODO)

## Known Limitations

1. **Mock Data**: Using hardcoded data, needs API integration
2. **Single Category**: Currently only navigates to first selected category
3. **No Profile Screen**: Tapping co-host shows snackbar instead
4. **No Photos**: Using placeholder initials instead of actual photos
5. **No Filtering**: No price/rating/availability filters yet
6. **No Search**: No search functionality
7. **No Sorting**: No sort options (price, rating, etc.)

## Future Enhancements

### Phase 3 (Resource Management - Co-Host Side):
- My Resources Screen
- Create Resource Screen
- Booking Requests Screen
- Active Bookings Screen

### Phase 4 (Negotiation & Payment):
- Enhanced negotiation with chat
- Payment method selection
- Escrow system
- Payout logic

### Phase 5 (Trust & Safety):
- Rating system
- Review system
- Verification system
- Dispute resolution
- Chat integration

## Dependencies
- `freezed` - Immutable entities
- `flutter_screenutil` - Responsive sizing
- Design system components from `lib/core/design_system/`

## Version History
- **v0.1.0** (Nov 2025) - Phase 2 Core
  - Resource categories screen
  - Co-host list screen
  - Mock data provider
  - Integration with event creation flow

---

**Status**: ✅ Phase 2 Core Complete  
**Next**: Co-Host Profile Screen  
**Date**: November 23, 2025
