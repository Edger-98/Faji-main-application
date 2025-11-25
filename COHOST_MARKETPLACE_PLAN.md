# Co-Host Marketplace Implementation Plan

## Overview
A marketplace feature that allows event hosts to discover, request, and hire co-hosts (vendors) who offer various resources like venues, entertainment, promotion, security, catering, etc.

## Current Status
✅ **Phase 1 Complete**: Event Creation Flow (4 steps)
- Event details, configuration, poster selection, theme selection
- Feature toggle for "Enable Vendors Feature" in Step 2
- Ready for co-host marketplace integration

## Implementation Phases

### Phase 1: Event Creation Flow ✅ COMPLETE
- [x] 4-step event creation process
- [x] Feature toggle for co-host marketplace
- [x] State management with Riverpod
- [x] Form validation
- [x] Progress indicator

### Phase 2: Co-Host Marketplace Core (NEXT)
**Goal**: Allow hosts to browse and request co-hosts

#### Screens to Build:
1. **Resource Categories Screen**
   - Display categories: Venue, Entertainment, Promotion, Security, Catering, Media
   - Grid layout with icons
   - Navigate to co-host list per category

2. **Co-Host List Screen**
   - List of co-hosts in selected category
   - Filter/sort options (price, rating, availability)
   - Co-host cards with: photo, name, rating, base price, stats
   - "View Profile" and "Request" buttons

3. **Co-Host Profile Screen**
   - Detailed profile view
   - About section
   - Resources offered with photos
   - Pricing details
   - Reviews/ratings
   - Portfolio (past events)
   - "Request Co-Host" button

4. **Negotiation Screen**
   - Resource details summary
   - Default price suggestion
   - Payment options:
     - Option A: Pay from ticket sales (% split)
     - Option B: Pay upfront (fixed amount)
   - Custom offer input
   - Message to co-host
   - "Send Request" button

#### Domain Entities:
```dart
- CohostResourceEntity
- CohostProfileEntity
- ResourceCategory (enum)
- BookingEntity
- NegotiationEntity
```

#### Use Cases:
```dart
- GetResourcesByCategoryUseCase
- GetCohostProfileUseCase
- RequestCohostUseCase
- NegotiatePriceUseCase
```

#### Integration Point:
After Step 2 (Event Configuration), if `enableCohostMarketplace == true`:
- Navigate to Resource Categories Screen
- Allow selection of co-hosts
- Store selected co-host IDs in `EventCreationEntity`
- Return to Step 3 (Poster Selection)

### Phase 3: Resource Management (Co-Host Side)
**Goal**: Allow users to offer their resources as co-hosts

#### Screens to Build:
1. **My Resources Screen**
   - List of user's resources
   - Toggle availability on/off
   - "Add New Resource" button
   - Edit/delete resources

2. **Create Resource Screen**
   - Resource category selection
   - Title, description
   - Photo upload (multiple)
   - Base price
   - Availability calendar
   - Proof of resource (verification docs)
   - "Publish Resource" button

3. **Booking Requests Screen**
   - Incoming requests from hosts
   - Accept/Decline/Counter-offer actions
   - Chat with host

4. **Active Bookings Screen**
   - Upcoming events
   - Event details
   - Payment status (escrow)

### Phase 4: Negotiation & Payment
**Goal**: Handle price negotiation and payment processing

#### Features:
- Offer/counter-offer system
- Two payment models:
  - Revenue split from ticket sales
  - Upfront payment
- Escrow system (hold funds until event completion)
- Payment split logic
- Payout after event

#### Screens:
- Enhanced Negotiation Screen with chat
- Payment Method Selection Screen
- Escrow Status Screen
- Payout Confirmation Screen

### Phase 5: Trust & Safety
**Goal**: Build trust through ratings, reviews, and verification

#### Features:
- Rating system (both hosts and co-hosts rate each other)
- Review system with text feedback
- Verification system:
  - Identity verification
  - Resource ownership proof
  - Platform approval
- Dispute resolution
- Chat between host and co-host
- Report/block functionality

## Resource Categories

### Defined Categories:
```dart
enum ResourceCategory {
  venue,        // Penthouses, halls, outdoor spaces
  entertainment, // DJs, bands, performers
  promotion,    // Influencers, social media promotion
  security,     // Bouncers, guest screening
  catering,     // Food, drinks, bartenders
  media,        // Photography, videography
  equipment,    // Sound systems, lighting
  staffing,     // Servers, coordinators
}
```

## Data Models

### Core Entities:

#### CohostResourceEntity
```dart
{
  id: string,
  cohostId: string,
  category: ResourceCategory,
  title: string,
  description: string,
  photos: List<string>,
  basePrice: double,
  isAvailable: bool,
  availableDates: List<DateTime>,
  rating: double,
  reviewCount: int,
  verificationDocs: Map<string, dynamic>,
}
```

#### CohostProfileEntity
```dart
{
  id: string,
  name: string,
  bio: string,
  profilePhoto: string,
  categories: List<ResourceCategory>,
  rating: double,
  eventsCompleted: int,
  isVerified: bool,
  portfolio: List<string>,
}
```

#### BookingEntity
```dart
{
  id: string,
  eventId: string,
  hostId: string,
  cohostId: string,
  resourceId: string,
  status: BookingStatus,
  paymentOption: PaymentOption,
  agreedPrice: double,
  eventDate: DateTime,
  escrowStatus: EscrowStatus,
}
```

## User Flows

### Host Flow:
```
1. Create Event (Step 1: Details)
2. Configure Event (Step 2: Enable Co-host toggle)
3. Browse Resource Categories
4. Select Category (e.g., DJ)
5. View Co-host List
6. View Co-host Profile
7. Request Co-host
8. Negotiate Price
9. Agree on Terms
10. Continue to Poster Selection (Step 3)
11. Select Theme (Step 4)
12. Create Event
13. Payment held in escrow
14. Event happens
15. Confirm completion
16. Payment released
17. Rate co-host
```

### Co-Host Flow:
```
1. Create Resource Listing
2. Upload photos/verification
3. Set base price
4. Publish resource
5. Receive booking request
6. Review host profile
7. Accept/Decline/Counter-offer
8. Negotiate terms
9. Agree on price
10. Event confirmed
11. Prepare for event
12. Event happens
13. Confirm completion
14. Receive payment
15. Rate host
```

## UI Components Needed

### Widgets:
- `ResourceCategoryCard` - Category selection cards
- `CohostCard` - List item for co-hosts
- `ResourceCard` - Display resource details
- `PriceNegotiationWidget` - Offer/counter-offer UI
- `RatingWidget` - Star rating display
- `ReviewCard` - User review display
- `AvailabilityCalendar` - Date picker for availability
- `PaymentOptionSelector` - Option A vs B toggle
- `EscrowStatusWidget` - Payment status indicator
- `VerificationBadge` - Verified co-host indicator

### Screens Count:
- Phase 2: 4 screens
- Phase 3: 4 screens
- Phase 4: 3 screens
- Phase 5: 2 screens
**Total**: ~13 new screens

## Backend Requirements (Questions for Backend Team)

### APIs Needed:
1. **Resource Management**
   - `GET /api/resources/categories` - Get all categories
   - `GET /api/resources?category={id}` - Get resources by category
   - `POST /api/resources` - Create resource
   - `PUT /api/resources/{id}` - Update resource
   - `DELETE /api/resources/{id}` - Delete resource

2. **Co-host Discovery**
   - `GET /api/cohosts?category={id}&filters={}` - Search co-hosts
   - `GET /api/cohosts/{id}` - Get co-host profile
   - `GET /api/cohosts/{id}/reviews` - Get reviews

3. **Booking & Negotiation**
   - `POST /api/bookings` - Create booking request
   - `PUT /api/bookings/{id}/accept` - Accept booking
   - `PUT /api/bookings/{id}/decline` - Decline booking
   - `POST /api/bookings/{id}/negotiate` - Send offer
   - `GET /api/bookings/{id}/negotiations` - Get negotiation history

4. **Payment & Escrow**
   - `POST /api/payments/escrow` - Create escrow
   - `GET /api/payments/escrow/{id}` - Get escrow status
   - `POST /api/payments/release` - Release payment
   - `GET /api/payments/history` - Payment history

5. **Ratings & Reviews**
   - `POST /api/reviews` - Submit review
   - `GET /api/reviews/{cohostId}` - Get reviews for co-host
   - `PUT /api/reviews/{id}` - Update review

6. **Verification**
   - `POST /api/verification/identity` - Submit identity docs
   - `POST /api/verification/resource` - Submit resource proof
   - `GET /api/verification/status` - Check verification status

### Questions for Backend:
1. **Payment Integration**: Which payment gateway? (Paystack, Flutterwave?)
2. **Escrow**: Build in-house or use third-party service?
3. **Verification**: Manual approval or automated?
4. **Chat**: Real-time (Firebase) or async messaging?
5. **Search**: Algolia or backend search?
6. **Photos**: Where to store? (Firebase Storage, Cloudinary?)
7. **Revenue Model**: Platform fee on transactions?

## Technical Considerations

### State Management:
- Use Riverpod StateNotifier for co-host marketplace state
- Separate providers for:
  - Resource browsing
  - Co-host profiles
  - Booking requests
  - Negotiations
  - Payment status

### Caching:
- Cache co-host profiles
- Cache resource lists
- Offline support for viewing saved co-hosts

### Performance:
- Lazy loading for co-host lists
- Image optimization
- Pagination for large lists

### Security:
- Verify user identity before allowing resource creation
- Secure payment processing
- Escrow protection
- Dispute resolution system

## Timeline Estimate

### Phase 2 (Core Marketplace): 2-3 weeks
- Resource categories screen: 2 days
- Co-host list screen: 3 days
- Co-host profile screen: 3 days
- Negotiation screen: 3 days
- Integration with event flow: 2 days

### Phase 3 (Resource Management): 2 weeks
- My resources screen: 2 days
- Create resource screen: 3 days
- Booking requests screen: 3 days
- Active bookings screen: 2 days
- Testing: 2 days

### Phase 4 (Payment): 2 weeks
- Payment integration: 5 days
- Escrow system: 4 days
- Payout logic: 3 days
- Testing: 2 days

### Phase 5 (Trust & Safety): 1-2 weeks
- Rating system: 3 days
- Review system: 2 days
- Verification: 3 days
- Chat integration: 3 days
- Testing: 2 days

**Total Estimate**: 7-9 weeks for full implementation

## Success Metrics

### User Engagement:
- % of events with co-hosts enabled
- Number of co-host requests per event
- Co-host acceptance rate
- Average negotiation time

### Business Metrics:
- Number of active co-hosts
- Total GMV through marketplace
- Platform fee revenue
- Average booking value

### Quality Metrics:
- Average co-host rating
- Review completion rate
- Dispute rate
- Payment success rate

## Next Immediate Steps

1. ✅ Complete Phase 1 (Event Creation Flow) - DONE
2. 🔄 Get backend API specifications
3. 🔄 Design resource category icons
4. 🔄 Create mock data for co-hosts
5. 🔄 Build Resource Categories Screen
6. 🔄 Build Co-Host List Screen
7. 🔄 Build Co-Host Profile Screen
8. 🔄 Build Negotiation Screen
9. 🔄 Integrate with event creation flow
10. 🔄 Test end-to-end flow

## References
- Event creation flow: `lib/features/organize_event/`
- Design system: `lib/core/design_system/`
- Routing: `lib/core/routing/`
- Similar features: Airbnb (host/guest), Upwork (freelancer marketplace)

---

**Document Version**: 1.0  
**Last Updated**: November 23, 2025  
**Status**: Phase 1 Complete, Phase 2 Planning
