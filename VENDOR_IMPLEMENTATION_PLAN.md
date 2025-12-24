# Vendor System Implementation Plan

## Overview
Complete vendor marketplace system with 5 phases based on API documentation.

## API Base URL
```
http://localhost:5000/api/v1
```

## Implementation Status

### ✅ Phase 1: Vendor Registration (PARTIAL - API INTEGRATED)
**Screens:**
- `vendor_registration_screen.dart` - Simple registration ✅ **API INTEGRATED**
- `vendor_registration_step1_screen.dart` - Detailed step 1 (CREATED)
- Need: Step 2 (Documents), Step 3 (Portfolio & Bank)

**API Status:**
- ✅ Registration endpoint connected and working
- ✅ Loading states implemented
- ✅ Error handling implemented
- ⏳ Document upload (Step 2) - not yet created
- ⏳ Portfolio & bank details (Step 3) - not yet created

**API Endpoints:**
1. `POST /vendor-registration/register` - Register vendor
2. `POST /vendor-registration/documents` - Upload documents
3. `POST /vendor-registration/portfolio` - Upload portfolio
4. `POST /vendor-registration/bank-details` - Add bank details
5. `GET /vendor-registration/profile` - Get profile
6. `PATCH /vendor-registration/profile` - Update profile
7. `DELETE /vendor-registration/portfolio/:imageId` - Delete portfolio image

**Fields Required:**
- businessName, bio, categories, location, email, phone
- alternatePhone, businessType, yearsInBusiness, website
- address (JSON), socialMedia (JSON)
- profilePhoto, coverPhoto (Cloudinary uploads)
- Documents: business_license, tax_id, government_id
- Portfolio images (max 30 total)
- Bank details: accountName, accountNumber, bankName, bankCode

### ✅ Phase 2: Resource Management (COMPLETED)
**Screens:**
- `vendor_resources_list_screen.dart` - List all resources ✅
- `vendor_add_resource_screen_v2.dart` - Add new resource ✅
- Edit functionality integrated in list screen ✅

**API Endpoints:**
1. `POST /marketplace/vendors/me/resources` - Add resource
2. `GET /marketplace/vendors/me/resources` - Get my resources
3. `PATCH /marketplace/vendors/me/resources/:id` - Update resource
4. `DELETE /marketplace/vendors/me/resources/:id` - Delete resource

**Resource Fields:**
- title, description, category, basePrice
- photos (array of Cloudinary URLs)
- isAvailable (boolean)

### ✅ Phase 3: Booking Management (COMPLETED - UI ONLY)
**Screens:**
- `vendor_bookings_list_screen.dart` - List booking requests with tabs ✅
- Booking actions (accept/decline/counter offer) integrated ✅
- Added to profile menu as "Booking Requests" ✅
- Routing fully configured ✅

**API Endpoints:**
1. `GET /marketplace/bookings/requests?status=pending` - Get requests
2. `POST /marketplace/bookings/:id/accept` - Accept booking
3. `POST /marketplace/bookings/:id/decline` - Decline booking
4. `POST /marketplace/bookings/:id/counter-offer` - Counter offer
5. `PATCH /marketplace/bookings/:id` - Update status
6. `POST /marketplace/bookings` - Create booking (host side)
7. `GET /marketplace/bookings/my-requests` - My bookings (host side)

**Booking Fields:**
- eventId, vendorId, resourceId
- paymentOption: "upfrontPayment" | "ticketSalesSplit"
- offeredPrice, agreedPrice, counterPrice
- status: pending | accepted | declined | completed
- message, reason
- eventDate

### ✅ Phase 4: Profile & Statistics (COMPLETED - UI ONLY)
**Screens:**
- `vendor_dashboard_screen.dart` - Stats dashboard ✅
- Added to profile menu as "Vendor Dashboard" ✅
- Routing fully configured ✅

**API Endpoints:**
1. `GET /marketplace/vendors/me` - Get complete profile
2. `GET /marketplace/vendors/me/stats` - Get statistics
3. `PATCH /marketplace/vendors/me` - Update profile

**Dashboard Features:**
- Stats cards: Total Earnings, Total Bookings, Pending Requests, Active Services ✅
- Quick Actions: Add Service, View Requests, Manage Services ✅
- Recent Activity feed with booking/completion/update events ✅
- All using pink primary color (#FD99C9) ✅

### ✅ Phase 5: Public Discovery (ALREADY EXISTS)
**Existing Screens:**
- `resource_categories_screen.dart` - Browse categories
- `cohost_list_screen.dart` - List vendors/resources
- Vendor profile view (public)

**API Endpoints:**
1. `GET /marketplace/resources?category=venue` - Browse resources
2. `GET /marketplace/vendors/:id` - Public vendor profile

## Implementation Priority

### ✅ Completed
- [x] Simple registration form
- [x] Step 1: Basic info (detailed)
- [x] Resource management screens (list, add, edit, delete)
- [x] Booking management screens (list with tabs, actions)
- [x] Profile integration ("Become a Vendor", "My Services", "Booking Requests")
- [x] Routing configuration

### 🔄 In Progress
- [ ] Step 2: Document uploads (registration)
- [ ] Step 3: Portfolio & bank details (registration)

### ✅ Phase 4 Complete
- [x] Dashboard with stats (earnings, bookings, requests, services)
- [x] Quick action buttons (add service, view requests, manage services)
- [x] Recent activity feed
- [x] Profile menu integration

### ⏳ TODO
- [ ] Complete registration flow (Steps 2 & 3: documents, portfolio, bank)
- [ ] API integration for all features
- [ ] Testing & bug fixes
- [ ] UI polish

## File Structure

```
lib/features/vendor/
├── domain/
│   └── entities/
│       ├── vendor_profile_entity.dart ✅
│       ├── vendor_resource_entity.dart ✅
│       ├── vendor_booking_entity.dart ✅
│       └── vendor_stats_entity.dart ✅
├── data/
│   ├── datasources/
│   │   └── vendor_remote_datasource.dart (TODO)
│   ├── models/
│   │   └── vendor_registration_request.dart (TODO)
│   └── repositories/
│       └── vendor_repository_impl.dart (TODO)
├── presentation/
│   ├── screens/
│   │   ├── vendor_registration_screen.dart ✅
│   │   ├── vendor_registration_step1_screen.dart ✅
│   │   ├── vendor_registration_step2_screen.dart (TODO)
│   │   ├── vendor_registration_step3_screen.dart (TODO)
│   │   ├── vendor_dashboard_screen.dart (TODO)
│   │   ├── vendor_resources_list_screen.dart (TODO)
│   │   ├── vendor_add_resource_screen.dart (TODO)
│   │   ├── vendor_bookings_screen.dart (TODO)
│   │   └── vendor_profile_screen.dart (TODO)
│   ├── widgets/
│   │   └── (reusable widgets)
│   └── providers/
│       └── vendor_providers.dart ✅
└── README.md ✅
```

## Next Steps

1. **Complete Registration Flow:**
   - Create Step 2 screen (document uploads)
   - Create Step 3 screen (portfolio & bank)
   - Integrate with Cloudinary for file uploads
   - Connect to registration API

2. **Resource Management:**
   - Build resource list screen
   - Build add/edit resource screens
   - Connect to resource APIs

3. **Booking Management:**
   - Build bookings list with tabs
   - Build booking detail screen
   - Implement accept/decline/counter offer
   - Connect to booking APIs

4. **Dashboard:**
   - Build stats dashboard
   - Show recent activity
   - Quick actions

## Notes

- All colors use `AppColors.primary` (#FD99C9 pink)
- All screens follow existing design patterns
- File uploads use Cloudinary
- Authentication uses Bearer token
- All forms have proper validation

---

**Current Status**: Phases 1-4 UI Complete ✅  
**Next Task**: Complete registration flow (Steps 2 & 3) OR API Integration  
**Last Updated**: December 16, 2025

## Quick Access from Profile

Users can now access vendor features from the profile screen:
1. **"Become a Vendor"** - Card at top of Personal section → Registration flow
2. **"Vendor Dashboard"** - Menu item in Personal section → Stats & quick actions ✅ NEW
3. **"My Services"** - Menu item in Personal section → Resource management
4. **"Booking Requests"** - Menu item in Personal section → Booking management

All screens use pink primary color (#FD99C9) and match the app's design system.
