# Event Verification System - Location-Based Fraud Prevention

## 🎯 Core Concept

**Problem**: Fake events, no-show events, fraudulent ticket sales

**Solution**: Location-based verification system that confirms event legitimacy through guest check-ins at the actual venue.

---

## 🔐 How It Works

### The Verification Flow

```
Event Created → Tickets Sold → Event Day → Guests Arrive → Location Check → 30% Threshold → Event Verified → Payments Released
```

### Key Principles

1. **Real Location Required**: Host must provide exact GPS coordinates
2. **Guest Check-In**: Guests check in when they arrive at venue
3. **30% Threshold**: At least 30% of ticket holders must check in
4. **Geofencing**: Check-in only works within venue radius
5. **Payment Hold**: Revenue held in escrow until verification
6. **Automatic Release**: Payments released after successful verification

---

## 📍 Location System

### 1. Event Creation - Location Setup

**Host Requirements:**
- Provide exact venue address
- Confirm GPS coordinates (lat/long)
- Set venue radius (default: 100 meters)
- Upload venue photos (optional but recommended)

**UI Flow:**
```
Create Event → Basic Details → Date & Time → Location Setup
```

**Location Setup Screen:**
```
┌─────────────────────────────────────┐
│ Event Location                      │
├─────────────────────────────────────┤
│                                     │
│ [Map View with Pin]                 │
│                                     │
├─────────────────────────────────────┤
│ 📍 Venue Address                    │
│ [Search or Enter Address]           │
│                                     │
│ 🎯 Exact Location                   │
│ Lat: 6.5244  Long: 3.3792          │
│                                     │
│ 📏 Check-in Radius                  │
│ [Slider: 50m - 500m] 100m          │
│                                     │
│ 📸 Venue Photos (Optional)          │
│ [Upload Photos]                     │
│                                     │
│ ℹ️ Guests must check in within     │
│    100m of this location            │
│                                     │
│ [Confirm Location] [Use My Location]│
└─────────────────────────────────────┘
```

**Backend API:**
```
POST /api/events
Body: {
  title: "Summer Music Festival",
  description: "...",
  startDate: "2025-01-15T18:00:00Z",
  endDate: "2025-01-15T23:00:00Z",
  location: {
    address: "Eko Hotel, Victoria Island, Lagos",
    latitude: 6.4281,
    longitude: 3.4219,
    checkInRadius: 100, // meters
    venuePhotos: ["url1", "url2"],
    placeId: "ChIJ...", // Google Places ID
    verified: false
  },
  ticketing: {...},
  verification: {
    required: true,
    threshold: 30, // 30% of ticket holders
    checkInWindow: {
      start: "2025-01-15T17:30:00Z", // 30 min before
      end: "2025-01-15T20:00:00Z"    // 2 hours after start
    }
  }
}
```

---

## 🎫 Ticket Purchase with Escrow

### Modified Purchase Flow

```
Select Tickets → Payment → Escrow Hold → Ticket Issued → Event Day → Check-In → Verification → Payment Released
```

### Payment Escrow System

**Key Changes:**
1. Payment goes to **escrow** (not directly to host)
2. Held until event verification
3. Released after 30% check-in threshold met
4. Refunded if event fails verification

**Payment Flow:**
```
Guest pays $150
↓
Payment Gateway (Paystack)
↓
Escrow Account (Platform holds)
↓
[Wait for Event Day]
↓
Event Verified (30% checked in)
↓
Release to Revenue Distribution
↓
Platform Fee (10%) → $15
Vendor Fees → $800
Host Share (50%) → $67.50
Co-Host Share (50%) → $67.50
```

**Backend API:**
```
POST /api/payments/initialize
Body: {
  reservationId: "res_456",
  amount: 150.00,
  escrow: true, // NEW: Hold in escrow
  releaseCondition: "event_verification",
  eventId: "event_123"
}
Response: {
  paymentId: "pay_789",
  escrowId: "escrow_101",
  status: "held",
  releaseDate: null, // TBD after verification
  authorizationUrl: "..."
}

GET /api/escrow/{escrowId}/status
Response: {
  escrowId: "escrow_101",
  amount: 150.00,
  status: "held", // held | released | refunded
  eventId: "event_123",
  eventStatus: "pending_verification",
  checkInProgress: {
    total: 100,
    checkedIn: 15,
    percentage: 15,
    threshold: 30,
    verified: false
  },
  estimatedRelease: "2025-01-15T20:00:00Z"
}
```

---

## 📱 Guest Check-In System

### Check-In Flow

```
Guest Arrives → Opens App → "Check In" Button → Location Verified → Check-In Confirmed → Counter Updated
```

### Check-In Screen (Guest Side)

**Location**: Event Details Screen → "Check In" Button

```
┌─────────────────────────────────────┐
│ Summer Music Festival               │
├─────────────────────────────────────┤
│ 📅 Jan 15, 2025 • 6:00 PM         │
│ 📍 Eko Hotel, Victoria Island      │
│                                     │
│ [Map showing venue location]        │
│                                     │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│                                     │
│ ✅ You're at the venue!            │
│                                     │
│ 👥 45 of 100 guests checked in     │
│ 📊 45% verified (30% needed)       │
│                                     │
│ [✓ Check In Now]                   │
│                                     │
│ ℹ️ Check-in confirms you're        │
│    attending and helps verify       │
│    this event is real               │
└─────────────────────────────────────┘
```

**If Not at Venue:**
```
┌─────────────────────────────────────┐
│ ❌ Not at venue yet                 │
│                                     │
│ You're 2.5 km away from the venue  │
│                                     │
│ [View Directions]                   │
│                                     │
│ ℹ️ You can check in when you're    │
│    within 100m of the venue         │
└─────────────────────────────────────┘
```

### Check-In Logic

**Requirements:**
1. Guest must have valid ticket
2. Must be within check-in window (30 min before → 2 hours after start)
3. Must be within venue radius (100m default)
4. Can only check in once
5. Location services must be enabled

**Backend API:**
```
POST /api/events/{id}/check-in
Body: {
  ticketId: "ticket_001",
  location: {
    latitude: 6.4282,
    longitude: 3.4220,
    accuracy: 15, // meters
    timestamp: "2025-01-15T18:05:00Z"
  }
}

Validation:
1. Verify ticket is valid
2. Check if within check-in window
3. Calculate distance from venue
4. Verify within radius
5. Check if already checked in
6. Record check-in

Response: {
  success: true,
  checkInId: "checkin_456",
  timestamp: "2025-01-15T18:05:00Z",
  distance: 45, // meters from venue center
  eventProgress: {
    totalTickets: 100,
    checkedIn: 46,
    percentage: 46,
    threshold: 30,
    verified: true, // Just crossed threshold!
    verifiedAt: "2025-01-15T18:05:00Z"
  },
  message: "Check-in successful! Event verified ✓"
}

// If not at venue:
Response: {
  success: false,
  error: "location_too_far",
  distance: 2500, // meters away
  message: "You must be within 100m of the venue to check in",
  venueLocation: {
    latitude: 6.4281,
    longitude: 3.4219
  }
}
```

---

## ✅ Event Verification Process

### Verification Criteria

**Event is VERIFIED when:**
1. ✅ At least 30% of ticket holders check in
2. ✅ Check-ins happen within the event time window
3. ✅ Check-ins are from valid GPS locations
4. ✅ No suspicious patterns detected

**Event FAILS verification when:**
1. ❌ Less than 30% check in by end of window
2. ❌ Suspicious location patterns (all from same device)
3. ❌ Host cancels event
4. ❌ Multiple fraud reports

### Verification Timeline

```
Event Start Time: 6:00 PM
Check-in Window Opens: 5:30 PM (30 min before)
Check-in Window Closes: 8:00 PM (2 hours after start)

5:30 PM - Window opens, guests start checking in
6:00 PM - Event starts
6:15 PM - 15% checked in
6:30 PM - 25% checked in
6:45 PM - 31% checked in → ✅ VERIFIED!
8:00 PM - Window closes
8:05 PM - Payments released
```

### Backend Verification Logic

```
POST /api/events/{id}/verify
Triggered automatically when:
- 30% threshold reached
- Check-in window closes

Logic:
1. Count valid check-ins
2. Calculate percentage
3. Check for fraud patterns
4. Update event status
5. Trigger payment release if verified
6. Trigger refunds if failed

Response: {
  eventId: "event_123",
  verified: true,
  checkInStats: {
    totalTickets: 100,
    checkedIn: 46,
    percentage: 46,
    threshold: 30,
    verifiedAt: "2025-01-15T18:45:00Z"
  },
  paymentStatus: "releasing",
  escrowReleased: true,
  revenueDistribution: {
    platformFee: 525.00,
    vendorFees: 800.00,
    hostShare: 1962.50,
    coHostShares: [...]
  }
}
```

---

## 💰 Payment Release System

### Automatic Release After Verification

```
Event Verified (30% threshold)
↓
Wait 5 minutes (grace period)
↓
Release escrow funds
↓
Process revenue distribution
↓
Credit wallets
↓
Send notifications
```

### Release API

```
POST /api/escrow/release
Body: {
  eventId: "event_123",
  reason: "event_verified",
  verificationData: {
    percentage: 46,
    checkedIn: 46,
    total: 100,
    verifiedAt: "2025-01-15T18:45:00Z"
  }
}

Processing:
1. Verify event is verified
2. Calculate total escrow amount
3. Process revenue distribution
4. Create wallet transactions
5. Update event status
6. Send notifications

Response: {
  released: true,
  totalAmount: 5250.00,
  distributions: [
    {
      userId: "host_123",
      amount: 1962.50,
      source: "hosting",
      status: "credited"
    },
    {
      userId: "cohost_456",
      amount: 981.25,
      source: "co-hosting",
      status: "credited"
    }
  ],
  notifications: [
    "host_123",
    "cohost_456",
    "vendor_789"
  ]
}
```

---

## 🚨 Fraud Prevention & Refunds

### Failed Verification Scenarios

**Scenario 1: Less than 30% Check-In**
```
Event window closes at 8:00 PM
Only 25% checked in
↓
Event marked as FAILED
↓
Automatic refund to all ticket holders
↓
Host account flagged
↓
Investigation triggered
```

**Scenario 2: Suspicious Patterns**
```
All check-ins from same IP
All check-ins within 1 minute
GPS spoofing detected
↓
Event flagged for review
↓
Manual investigation
↓
Refund if fraud confirmed
```

**Scenario 3: Host Cancels**
```
Host cancels event
↓
Automatic refund to all ticket holders
↓
Escrow released back to guests
↓
Host cannot create events for 30 days
```

### Refund API

```
POST /api/events/{id}/refund-all
Body: {
  reason: "verification_failed",
  verificationData: {
    percentage: 25,
    threshold: 30,
    checkedIn: 25,
    total: 100
  }
}

Processing:
1. Get all ticket purchases
2. Calculate refund amounts
3. Process refunds via payment gateway
4. Update ticket statuses
5. Send notifications
6. Flag host account

Response: {
  refunded: true,
  totalAmount: 5250.00,
  ticketsRefunded: 100,
  refunds: [
    {
      ticketId: "ticket_001",
      userId: "user_123",
      amount: 150.00,
      status: "processing",
      refundId: "ref_789"
    }
  ],
  hostPenalty: {
    flagged: true,
    suspensionDays: 30,
    reason: "Event failed verification"
  }
}
```

---

## 🎯 Host Dashboard - Verification Status

### Real-Time Verification Tracking

**Screen**: Event Details → Dashboard Tab

```
┌─────────────────────────────────────┐
│ Event Verification Status           │
├─────────────────────────────────────┤
│                                     │
│ ⏰ Check-in Window                  │
│ Opens: 5:30 PM                      │
│ Closes: 8:00 PM                     │
│                                     │
│ 📊 Verification Progress            │
│ ████████░░░░░░░░░░░░ 46%           │
│                                     │
│ 👥 46 of 100 guests checked in     │
│ ✅ Verified! (30% threshold met)   │
│                                     │
│ 💰 Payment Status                   │
│ Status: Releasing                   │
│ Amount: $5,250.00                   │
│ Your Share: $1,962.50               │
│                                     │
│ 📍 Recent Check-Ins                 │
│ • John Doe - 6:45 PM               │
│ • Jane Smith - 6:43 PM             │
│ • Mike Johnson - 6:40 PM           │
│                                     │
│ [View All Check-Ins]                │
│ [Download Report]                   │
└─────────────────────────────────────┘
```

### Host Notifications

**Real-Time Updates:**
- "First guest checked in! 🎉"
- "10% verified (3 more needed for 30%)"
- "25% verified (5 more needed!)"
- "Event verified! ✅ Payments will be released"
- "Payments released to your wallet 💰"

---

## 🗺️ Location Features

### 1. Venue Map Integration

**Use Google Maps API:**
- Show venue location on map
- Display check-in radius circle
- Show guest's current location
- Provide directions to venue

**Implementation:**
```dart
// lib/features/events/presentation/widgets/venue_map.dart

class VenueMap extends StatelessWidget {
  final double latitude;
  final double longitude;
  final double radius;
  final bool showUserLocation;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 16,
      ),
      markers: {
        Marker(
          markerId: MarkerId('venue'),
          position: LatLng(latitude, longitude),
          infoWindow: InfoWindow(title: 'Event Venue'),
        ),
      },
      circles: {
        Circle(
          circleId: CircleId('check-in-radius'),
          center: LatLng(latitude, longitude),
          radius: radius,
          fillColor: Colors.blue.withOpacity(0.2),
          strokeColor: Colors.blue,
          strokeWidth: 2,
        ),
      },
      myLocationEnabled: showUserLocation,
      myLocationButtonEnabled: true,
    );
  }
}
```

### 2. Location Permission Handling

**Request Permissions:**
```dart
// lib/core/services/location_service.dart

class LocationService {
  Future<bool> requestPermission() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  Future<Position?> getCurrentLocation() async {
    if (!await requestPermission()) {
      return null;
    }
    
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  double calculateDistance(
    double lat1, double lon1,
    double lat2, double lon2,
  ) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2);
  }

  bool isWithinRadius(
    Position userLocation,
    double venueLat,
    double venueLon,
    double radiusMeters,
  ) {
    final distance = calculateDistance(
      userLocation.latitude,
      userLocation.longitude,
      venueLat,
      venueLon,
    );
    return distance <= radiusMeters;
  }
}
```

### 3. GPS Spoofing Detection

**Backend Validation:**
```
POST /api/events/{id}/check-in

Validation Checks:
1. Location accuracy < 50 meters
2. Timestamp is recent (< 5 minutes old)
3. IP address matches general region
4. Device ID not flagged
5. Check-in pattern is natural (not all at once)
6. Multiple check-ins from same device/IP flagged

Response if suspicious:
{
  success: false,
  error: "suspicious_location",
  message: "Location verification failed. Please try again.",
  flagged: true
}
```

---

## 📊 Database Schema

### Events Table (Updated)
```sql
ALTER TABLE events ADD COLUMN location_data JSON;
ALTER TABLE events ADD COLUMN verification_status ENUM(
  'pending',
  'in_progress',
  'verified',
  'failed',
  'cancelled'
) DEFAULT 'pending';
ALTER TABLE events ADD COLUMN verification_threshold INT DEFAULT 30;
ALTER TABLE events ADD COLUMN check_in_radius INT DEFAULT 100;

-- location_data JSON structure:
{
  "address": "Eko Hotel, Victoria Island, Lagos",
  "latitude": 6.4281,
  "longitude": 3.4219,
  "checkInRadius": 100,
  "venuePhotos": ["url1", "url2"],
  "placeId": "ChIJ...",
  "verified": false
}
```

### Check-Ins Table (New)
```sql
CREATE TABLE event_check_ins (
  id VARCHAR(255) PRIMARY KEY,
  event_id VARCHAR(255) NOT NULL,
  ticket_id VARCHAR(255) NOT NULL,
  user_id VARCHAR(255) NOT NULL,
  check_in_time TIMESTAMP NOT NULL,
  location_data JSON NOT NULL,
  device_info JSON,
  ip_address VARCHAR(45),
  flagged BOOLEAN DEFAULT FALSE,
  flag_reason VARCHAR(255),
  FOREIGN KEY (event_id) REFERENCES events(id),
  FOREIGN KEY (ticket_id) REFERENCES tickets(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  UNIQUE KEY unique_check_in (event_id, ticket_id)
);

-- location_data JSON structure:
{
  "latitude": 6.4282,
  "longitude": 3.4220,
  "accuracy": 15,
  "timestamp": "2025-01-15T18:05:00Z",
  "distance": 45
}
```

### Escrow Table (New)
```sql
CREATE TABLE payment_escrow (
  id VARCHAR(255) PRIMARY KEY,
  payment_id VARCHAR(255) NOT NULL,
  event_id VARCHAR(255) NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  status ENUM('held', 'released', 'refunded') DEFAULT 'held',
  held_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  released_at TIMESTAMP NULL,
  release_reason VARCHAR(255),
  FOREIGN KEY (payment_id) REFERENCES payments(id),
  FOREIGN KEY (event_id) REFERENCES events(id)
);
```

---

## 🎨 UI Components Needed

### 1. Location Setup Screen (Host)
**File**: `lib/features/organize_event/presentation/screens/event_location_setup_screen.dart`

### 2. Check-In Button (Guest)
**File**: `lib/features/event_details/presentation/widgets/check_in_button.dart`

### 3. Verification Progress Widget (Host)
**File**: `lib/features/organize_event/presentation/widgets/verification_progress_widget.dart`

### 4. Venue Map Widget
**File**: `lib/features/events/presentation/widgets/venue_map.dart`

### 5. Check-In Success Dialog
**File**: `lib/features/event_details/presentation/widgets/check_in_success_dialog.dart`

---

## 🚀 Implementation Phases

### Phase 1: Location System (1 week)
1. Add location fields to event creation
2. Integrate Google Maps
3. Location permission handling
4. Venue map display

### Phase 2: Check-In System (1 week)
1. Check-in button on event details
2. Location verification logic
3. Check-in API integration
4. Real-time counter updates

### Phase 3: Verification System (1 week)
1. Verification threshold logic
2. Automatic verification trigger
3. Host dashboard updates
4. Notification system

### Phase 4: Escrow & Payments (1 week)
1. Escrow payment flow
2. Automatic release logic
3. Refund system
4. Wallet integration

### Phase 5: Fraud Prevention (3 days)
1. GPS spoofing detection
2. Pattern analysis
3. Host flagging system
4. Manual review process

---

## 📈 Success Metrics

### Track These:
1. **Verification Rate**: % of events that get verified
2. **Check-In Rate**: Average % of guests who check in
3. **Fraud Detection**: # of fake events caught
4. **Refund Rate**: % of events that fail verification
5. **Host Compliance**: % of hosts who set proper locations
6. **Guest Satisfaction**: Feedback on verification system

---

## 🎯 Benefits

### For Guests:
- ✅ Protection against fake events
- ✅ Automatic refunds if event doesn't happen
- ✅ Confidence in event legitimacy
- ✅ Easy check-in process

### For Hosts:
- ✅ Build trust with guests
- ✅ Faster payment release
- ✅ Real-time attendance tracking
- ✅ Proof of event legitimacy

### For Platform:
- ✅ Reduce fraud and chargebacks
- ✅ Build reputation for safety
- ✅ Protect revenue
- ✅ Competitive advantage

---

## 🔒 Security Considerations

1. **Location Privacy**: Only store location during check-in, not continuously
2. **Data Encryption**: Encrypt GPS coordinates in database
3. **Access Control**: Only event host can see check-in details
4. **Fraud Detection**: ML model to detect suspicious patterns
5. **Manual Review**: Human review for flagged events

---

## 💡 Future Enhancements

1. **Facial Recognition**: Optional photo check-in
2. **NFC Check-In**: Tap phone at venue entrance
3. **Bluetooth Beacons**: More accurate indoor positioning
4. **Social Proof**: Show friends who checked in
5. **Gamification**: Badges for early check-ins
6. **Live Heatmap**: Show crowd density at venue

---

**This system ensures only real events with real attendees get paid. It's a game-changer for event platform trust and safety.** 🚀
