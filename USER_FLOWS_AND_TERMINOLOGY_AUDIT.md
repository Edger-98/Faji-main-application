# User Flows & Terminology Audit

## 🎯 Your Questions Answered

### 1. How do I onboard as a user?
**Current Flow**: 
- User downloads app → Registration/Login screens → Main Dashboard (5 tabs)
- ✅ **COMPLETE**: Registration and authentication flows exist

### 2. How do I become a vendor?
**Current Flow**:
- Profile tab → "Become Vendor" quick action button → Vendor Registration Screen
- Fill out vendor details → Submit → Vendor Dashboard unlocked
- ✅ **COMPLETE**: Vendor onboarding exists at `lib/features/vendor/presentation/screens/vendor_registration_screen.dart`

### 3. How do I create an event?
**Current Flow**:
- My Events tab → "Create Event" button → Event Creation Flow
- ✅ **COMPLETE**: Event creation exists

### 4. How do I find and invite a co-host?
**Current Flow**:
- During/After event creation → "Invite Co-Hosts" button → Search users → Select → Set revenue share → Send invitation
- ✅ **COMPLETE**: UI exists at `lib/features/events/presentation/screens/invite_cohost_screen.dart`
- ⚠️ **NEEDS BACKEND**: API endpoints for co-host invitations

### 5. How do I find and book a vendor?
**Current Flow**:
- Vendors tab (public marketplace) → Browse vendors → Select vendor → Select service → Send booking request
- ⚠️ **PARTIALLY COMPLETE**: Marketplace exists, but booking flow needs verification
- ⚠️ **NEEDS BACKEND**: Vendor booking API endpoints

---

## 🚨 TERMINOLOGY AUDIT - CRITICAL ISSUES FOUND

### ❌ Issues Found: "Organizer" Still Used (Should be "Host")

#### Files That Need Updates:

1. **Event Entity** (CRITICAL - Core Data Model)
   - `lib/features/events/domain/entities/event_entity.dart`
   - Fields: `organizerId`, `organizerName`, `organizerImage`
   - **Should be**: `hostId`, `hostName`, `hostImage`

2. **Event Details Screen**
   - `lib/features/events/presentation/screens/event_details_screen.dart`
   - Line 298-326: Shows "Organizer" section
   - **Should be**: "Host" section

3. **Search Screen**
   - `lib/features/events/presentation/screens/search_screen.dart`
   - Line 96: "Search events, organizers, locations..."
   - **Should be**: "Search events, hosts, locations..."

4. **Chat Screens**
   - `lib/features/chat/presentation/screens/organizer_chat_screen.dart`
   - Entire file named "OrganizerChatScreen"
   - **Should be**: "HostChatScreen"
   
   - `lib/features/chat/presentation/screens/chat_detail_screen.dart`
   - Multiple references to "Organizer" and `isOrganizer`
   - **Should be**: "Host" and `isHost`
   
   - `lib/features/chat/presentation/screens/chat_list_screen.dart`
   - Line 121: Filter chip "Organizers"
   - Line 141: "Start a conversation with event organizers"
   - **Should be**: "Hosts" and "event hosts"

5. **Vendor Registration Screen**
   - `lib/features/vendor/presentation/screens/vendor_registration_screen.dart`
   - Line 185: "offer your services to event organizers"
   - **Should be**: "offer your services to event hosts"

### ✅ Correct Terminology Already Used:

1. **Co-Host Screens** ✅
   - `lib/features/events/presentation/screens/invite_cohost_screen.dart`
   - `lib/features/events/presentation/screens/cohost_invitations_screen.dart`
   - `lib/features/events/presentation/screens/cohost_dashboard_screen.dart`
   - All correctly use "Co-Host" (not "Co-Planner")

2. **Host Dashboard** ✅
   - `lib/features/events/presentation/screens/host_dashboard_screen.dart`
   - Correctly uses "Host"

3. **Profile Screen** ✅
   - Uses "Become Vendor" (correct)
   - Has "Vendor Dashboard" and "Vendor Management" sections (correct)

---

## 📋 COMPLETE USER FLOWS (As Implemented)

### Flow 1: New User Onboarding
```
1. Download App
2. Registration Screen
   - Enter name, email, password
   - Accept terms
3. Login
4. Main Dashboard (5 tabs)
   - Home (discover events)
   - Vendors (discover services)
   - My Events (manage events by role)
   - Wallet (money management)
   - Profile (settings + upgrades)
```
**Status**: ✅ Complete

---

### Flow 2: Become a Vendor
```
1. Profile Tab
2. Click "Become Vendor" quick action
3. Vendor Registration Screen
   - Business name
   - Category
   - Description
   - Contact info
   - Submit
4. Vendor Dashboard unlocked in Profile
   - My Services
   - Booking Requests
   - Earnings
```
**Status**: ✅ UI Complete | ⚠️ Needs Backend APIs

---

### Flow 3: Create Event as Host
```
1. My Events Tab
2. Click "Create Event" button
3. Event Creation Flow
   - Event details (title, description, date, location)
   - Ticketing setup
   - Category selection
   - Cover image upload
4. Optional: Invite Co-Hosts
   - Search users
   - Select co-hosts
   - Set revenue share (default 50/50)
   - Send invitations
5. Optional: Book Vendors
   - Browse Vendors tab
   - Select vendor service
   - Send booking request
6. Publish Event
7. Event appears in Home feed
```
**Status**: ✅ UI Complete | ⚠️ Needs Backend APIs for co-hosts and vendor bookings

---

### Flow 4: Accept Co-Host Invitation
```
1. Receive notification (or check My Events → Co-Host tab)
2. Co-Host Invitations Screen
3. View invitation details
   - Event info
   - Revenue share
   - Host name
4. Accept or Decline
5. If accepted → Co-Host Dashboard
   - View event details (read-only)
   - See earnings
   - Limited permissions
```
**Status**: ✅ UI Complete | ⚠️ Needs Backend APIs

---

### Flow 5: Vendor Receives Booking Request
```
1. Receive notification (or check Profile → Booking Requests)
2. Vendor Bookings List Screen → Pending tab
3. View booking details
   - Host name
   - Event name
   - Service requested
   - Offered price
   - Message from host
4. Click "Respond to Request"
5. Counter Offer Bottom Sheet opens
   - Tab 1: Accept (agree to price)
   - Tab 2: Counter (propose new price + message)
   - Tab 3: Decline (provide reason)
6. Submit response
7. If accepted → Moves to Accepted tab
8. After event → Moves to Completed tab
9. Earnings credited to Wallet (tagged as "vendor")
```
**Status**: ✅ UI Complete | ⚠️ Needs Backend APIs

---

### Flow 6: Host Books Vendor
```
1. Vendors Tab (public marketplace)
2. Browse vendors by category
3. Select vendor
4. View vendor profile and services
5. Select service
6. Vendor Booking Request Screen
   - Select event (from host's events)
   - Enter message
   - Confirm price
7. Send booking request
8. Wait for vendor response
   - Accepted → Vendor attached to event
   - Counter → Review counter offer
   - Declined → Find another vendor
```
**Status**: ⚠️ Needs verification and backend APIs

---

### Flow 7: Wallet & Earnings
```
1. Wallet Tab
2. View balance breakdown
   - Available balance
   - Pending payouts
   - Hosting earnings
   - Co-hosting earnings
   - Vendor earnings
3. Transaction History
   - Filter by source (All, Hosting, Co-hosting, Vendor)
4. Withdraw funds
```
**Status**: ✅ UI Complete | ⚠️ Needs Backend APIs

---

## 🔧 REQUIRED FIXES

### Priority 1: Terminology Updates (Breaking Changes)

#### 1. Update Event Entity
```dart
// BEFORE
class EventEntity {
  final String organizerId;
  final String organizerName;
  final String? organizerImage;
}

// AFTER
class EventEntity {
  final String hostId;
  final String hostName;
  final String? hostImage;
}
```

#### 2. Rename Chat Screen
```
BEFORE: organizer_chat_screen.dart → OrganizerChatScreen
AFTER: host_chat_screen.dart → HostChatScreen
```

#### 3. Update All UI Text
- Search hint: "organizers" → "hosts"
- Chat filters: "Organizers" → "Hosts"
- Event details: "Organizer" → "Host"
- Vendor registration: "event organizers" → "event hosts"

### Priority 2: Backend Integration
All UI is complete, but these APIs are needed:
1. Co-host invitation endpoints
2. Vendor booking endpoints
3. Revenue processing endpoints
4. Wallet transaction endpoints

---

## ✅ WHAT'S ALREADY CORRECT

1. ✅ Navigation structure (5 tabs)
2. ✅ "Co-Host" terminology (not "Co-Planner")
3. ✅ "Vendor" terminology (not "Service Provider")
4. ✅ "Host" in new screens (Host Dashboard, Invite Co-Host)
5. ✅ Wallet as single source of truth for money
6. ✅ Discovery is public (Home, Vendors tabs)
7. ✅ Management is private (My Events, Profile)
8. ✅ Vendor onboarding flow
9. ✅ Counter offer bottom sheet (keyboard-friendly)

---

## 📝 SUMMARY

**Your Questions**:
1. ✅ User onboarding: Complete
2. ✅ Become vendor: Complete (UI + flow)
3. ✅ Create event: Complete
4. ✅ Find co-host: Complete (UI exists, needs backend)
5. ⚠️ Find vendor: Partially complete (needs verification)

**Terminology Issues**:
- ❌ "Organizer" still used in 6+ files (should be "Host")
- ✅ "Co-Host" correctly used everywhere
- ✅ "Vendor" correctly used everywhere

**Next Steps**:
1. Fix "Organizer" → "Host" terminology (breaking change)
2. Verify vendor booking flow completeness
3. Connect all flows to backend APIs
