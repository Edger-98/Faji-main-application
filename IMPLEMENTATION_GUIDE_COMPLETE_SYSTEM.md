# Complete Implementation Guide - Event Verification & Ticket Selling System

## 🎯 Overview

This guide covers the complete implementation of:
1. **Event Creation** with real location
2. **Ticket Selling** by hosts
3. **Ticket Buying** by guests
4. **Location-Based Verification** (30% threshold)
5. **Escrow Payment System**
6. **Automatic Payment Release**

---

## 📋 Implementation Checklist

### Phase 1: Event Creation with Location (Week 1)

#### Backend APIs Needed

```typescript
// 1. Create Event with Location
POST /api/events
Body: {
  title: string,
  description: string,
  category: string,
  startDate: DateTime,
  endDate: DateTime,
  location: {
    address: string,
    latitude: number,
    longitude: number,
    checkInRadius: number, // meters, default 100
    venuePhotos?: string[],
    placeId?: string // Google Places ID
  },
  ticketing: {
    types: [
      {
        name: string, // "General", "VIP", etc.
        price: number,
        quantity: number,
        description?: string
      }
    ],
    salesStart: DateTime,
    salesEnd: DateTime,
    maxPerPurchase: number
  },
  verification: {
    required: boolean, // true
    threshold: number, // 30 (percentage)
    checkInWindow: {
      startMinutesBefore: number, // 30
      endMinutesAfter: number // 120
    }
  }
}

Response: {
  id: string,
  ...eventData,
  verificationStatus: "pending",
  escrowEnabled: true
}
```

#### Frontend Updates

**File**: `lib/features/organize_event/presentation/screens/create_event_location_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class CreateEventLocationScreen extends StatefulWidget {
  const CreateEventLocationScreen({super.key});

  @override
  State<CreateEventLocationScreen> createState() => _CreateEventLocationScreenState();
}

class _CreateEventLocationScreenState extends State<CreateEventLocationScreen> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;
  double _checkInRadius = 100; // meters
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Location'),
      ),
      body: Column(
        children: [
          // Map View
          Expanded(
            flex: 2,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(6.5244, 3.3792), // Lagos default
                zoom: 14,
              ),
              onMapCreated: (controller) => _mapController = controller,
              onTap: _onMapTapped,
              markers: _selectedLocation != null
                  ? {
                      Marker(
                        markerId: MarkerId('venue'),
                        position: _selectedLocation!,
                      ),
                    }
                  : {},
              circles: _selectedLocation != null
                  ? {
                      Circle(
                        circleId: CircleId('radius'),
                        center: _selectedLocation!,
                        radius: _checkInRadius,
                        fillColor: Colors.blue.withOpacity(0.2),
                        strokeColor: Colors.blue,
                        strokeWidth: 2,
                      ),
                    }
                  : {},
            ),
          ),
          
          // Location Details
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Venue Address',
                    style: AppTypography.titleMedium,
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter venue address',
                      suffixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) => _address = value,
                  ),
                  SizedBox(height: 16.h),
                  
                  Text(
                    'Check-in Radius: ${_checkInRadius.toInt()}m',
                    style: AppTypography.bodyMedium,
                  ),
                  Slider(
                    value: _checkInRadius,
                    min: 50,
                    max: 500,
                    divisions: 9,
                    label: '${_checkInRadius.toInt()}m',
                    onChanged: (value) {
                      setState(() => _checkInRadius = value);
                    },
                  ),
                  
                  Spacer(),
                  
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _selectedLocation != null ? _confirmLocation : null,
                      child: Text('Confirm Location'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapTapped(LatLng location) {
    setState(() {
      _selectedLocation = location;
    });
    _getAddressFromLatLng(location);
  }

  Future<void> _getAddressFromLatLng(LatLng location) async {
    // Use geocoding to get address
    // Implementation depends on geocoding package
  }

  void _confirmLocation() {
    if (_selectedLocation != null) {
      Navigator.pop(context, {
        'latitude': _selectedLocation!.latitude,
        'longitude': _selectedLocation!.longitude,
        'address': _address,
        'checkInRadius': _checkInRadius,
      });
    }
  }
}
```

---

### Phase 2: Ticket Selling System (Week 2)

#### Backend APIs Needed

```typescript
// 1. Get Event Tickets (Public)
GET /api/events/{eventId}/tickets
Response: {
  types: [
    {
      id: string,
      name: string,
      price: number,
      available: number,
      total: number,
      description: string
    }
  ],
  salesActive: boolean,
  maxPerPurchase: number
}

// 2. Reserve Tickets (15-minute hold)
POST /api/tickets/reserve
Body: {
  eventId: string,
  ticketTypeId: string,
  quantity: number
}
Response: {
  reservationId: string,
  expiresAt: DateTime, // 15 minutes from now
  tickets: [
    {
      ticketTypeId: string,
      quantity: number,
      pricePerTicket: number,
      subtotal: number
    }
  ],
  totalAmount: number
}

// 3. Initialize Payment (Escrow)
POST /api/payments/initialize
Body: {
  reservationId: string,
  amount: number,
  email: string
}
Response: {
  paymentId: string,
  escrowId: string,
  authorizationUrl: string, // Paystack URL
  reference: string
}

// 4. Verify Payment
POST /api/payments/verify
Body: {
  reference: string
}
Response: {
  status: "success" | "failed",
  amount: number,
  paidAt: DateTime
}

// 5. Complete Purchase
POST /api/tickets/complete-purchase
Body: {
  reservationId: string,
  paymentId: string
}
Response: {
  tickets: [
    {
      id: string,
      ticketNumber: string,
      qrCode: string, // base64 encoded
      eventId: string,
      ticketType: string,
      status: "valid"
    }
  ],
  escrowStatus: "held",
  message: "Tickets purchased! Payment held until event verification."
}
```

#### Frontend Updates

**File**: `lib/features/event_details/presentation/screens/buy_ticket_screen.dart` (Update existing)

```dart
// Add these features to existing buy_ticket_screen.dart:

class _BuyTicketScreenState extends State<BuyTicketScreen> {
  final String eventId;
  List<TicketType> ticketTypes = [];
  Map<String, int> selectedQuantities = {};
  bool isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _loadTicketTypes();
  }
  
  Future<void> _loadTicketTypes() async {
    setState(() => isLoading = true);
    try {
      final response = await TicketService.getEventTickets(eventId);
      setState(() {
        ticketTypes = response.types;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ToastService.showError(context: context, message: 'Failed to load tickets');
    }
  }
  
  Future<void> _proceedToPayment() async {
    // 1. Reserve tickets
    final reservation = await TicketService.reserveTickets(
      eventId: eventId,
      selections: selectedQuantities,
    );
    
    // 2. Initialize payment
    final payment = await PaymentService.initializePayment(
      reservationId: reservation.id,
      amount: reservation.totalAmount,
      email: currentUser.email,
    );
    
    // 3. Open Paystack
    final result = await PaymentService.openPaystack(
      authorizationUrl: payment.authorizationUrl,
    );
    
    // 4. Verify payment
    if (result.success) {
      final verified = await PaymentService.verifyPayment(
        reference: payment.reference,
      );
      
      if (verified.status == 'success') {
        // 5. Complete purchase
        final tickets = await TicketService.completePurchase(
          reservationId: reservation.id,
          paymentId: payment.id,
        );
        
        // Navigate to success screen
        context.push('/payment-success', extra: tickets);
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Ticket type selection
          Expanded(
            child: ListView.builder(
              itemCount: ticketTypes.length,
              itemBuilder: (context, index) {
                final type = ticketTypes[index];
                return TicketTypeCard(
                  type: type,
                  quantity: selectedQuantities[type.id] ?? 0,
                  onQuantityChanged: (qty) {
                    setState(() {
                      selectedQuantities[type.id] = qty;
                    });
                  },
                );
              },
            ),
          ),
          
          // Total and proceed button
          Container(
            padding: EdgeInsets.all(24.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: AppTypography.titleLarge),
                    Text(
                      '\$${_calculateTotal().toStringAsFixed(2)}',
                      style: AppTypography.titleLarge,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _canProceed() ? _proceedToPayment : null,
                    child: Text('Proceed to Payment'),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Payment held in escrow until event verification',
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

---

### Phase 3: Guest Check-In System (Week 3)

#### Backend APIs Needed

```typescript
// 1. Check if can check in
GET /api/events/{eventId}/check-in/status
Query: ?ticketId={ticketId}
Response: {
  canCheckIn: boolean,
  reason?: string, // if false
  checkInWindow: {
    start: DateTime,
    end: DateTime,
    isOpen: boolean
  },
  venue: {
    latitude: number,
    longitude: number,
    radius: number
  },
  alreadyCheckedIn: boolean,
  distance?: number // if user location provided
}

// 2. Perform check-in
POST /api/events/{eventId}/check-in
Body: {
  ticketId: string,
  location: {
    latitude: number,
    longitude: number,
    accuracy: number,
    timestamp: DateTime
  }
}
Response: {
  success: boolean,
  checkInId: string,
  timestamp: DateTime,
  distance: number, // meters from venue
  eventProgress: {
    totalTickets: number,
    checkedIn: number,
    percentage: number,
    threshold: number,
    verified: boolean,
    verifiedAt?: DateTime
  },
  message: string
}

// 3. Get check-in progress (for host dashboard)
GET /api/events/{eventId}/check-in/progress
Response: {
  totalTickets: number,
  checkedIn: number,
  percentage: number,
  threshold: number,
  verified: boolean,
  verifiedAt?: DateTime,
  recentCheckIns: [
    {
      userName: string,
      timestamp: DateTime,
      distance: number
    }
  ]
}
```

#### Frontend Updates

**File**: `lib/features/event_details/presentation/widgets/check_in_button.dart` (New)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class CheckInButton extends StatefulWidget {
  final String eventId;
  final String ticketId;
  final double venueLat;
  final double venueLon;
  final double venueRadius;

  const CheckInButton({
    super.key,
    required this.eventId,
    required this.ticketId,
    required this.venueLat,
    required this.venueLon,
    required this.venueRadius,
  });

  @override
  State<CheckInButton> createState() => _CheckInButtonState();
}

class _CheckInButtonState extends State<CheckInButton> {
  bool isChecking = false;
  bool canCheckIn = false;
  String? statusMessage;
  double? distanceToVenue;

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    try {
      // Get current location
      final position = await Geolocator.getCurrentPosition();
      
      // Calculate distance
      final distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        widget.venueLat,
        widget.venueLon,
      );
      
      setState(() {
        distanceToVenue = distance;
        canCheckIn = distance <= widget.venueRadius;
        statusMessage = canCheckIn
            ? 'You\'re at the venue!'
            : 'You\'re ${(distance / 1000).toStringAsFixed(1)}km away';
      });
    } catch (e) {
      setState(() {
        statusMessage = 'Enable location to check in';
      });
    }
  }

  Future<void> _performCheckIn() async {
    setState(() => isChecking = true);
    
    try {
      final position = await Geolocator.getCurrentPosition();
      
      final result = await CheckInService.checkIn(
        eventId: widget.eventId,
        ticketId: widget.ticketId,
        location: {
          'latitude': position.latitude,
          'longitude': position.longitude,
          'accuracy': position.accuracy,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
      
      if (result.success) {
        _showSuccessDialog(result);
      } else {
        ToastService.showError(
          context: context,
          message: result.message,
        );
      }
    } catch (e) {
      ToastService.showError(
        context: context,
        message: 'Check-in failed. Please try again.',
      );
    } finally {
      setState(() => isChecking = false);
    }
  }

  void _showSuccessDialog(CheckInResult result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('✅ Checked In!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('You\'ve successfully checked in to this event.'),
            SizedBox(height: 16.h),
            LinearProgressIndicator(
              value: result.eventProgress.percentage / 100,
            ),
            SizedBox(height: 8.h),
            Text(
              '${result.eventProgress.checkedIn} of ${result.eventProgress.totalTickets} guests checked in',
              style: AppTypography.bodySmall,
            ),
            if (result.eventProgress.verified)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  '✓ Event Verified!',
                  style: AppTypography.bodyMedium.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (statusMessage != null)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              statusMessage!,
              style: AppTypography.bodyMedium.copyWith(
                color: canCheckIn ? Colors.green : Colors.orange,
              ),
            ),
          ),
        
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: canCheckIn && !isChecking ? _performCheckIn : null,
            child: isChecking
                ? CircularProgressIndicator()
                : Text('Check In Now'),
          ),
        ),
        
        if (!canCheckIn && distanceToVenue != null)
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: TextButton(
              onPressed: () {
                // Open maps with directions
              },
              child: Text('Get Directions'),
            ),
          ),
      ],
    );
  }
}
```

---

### Phase 4: Verification & Payment Release (Week 4)

#### Backend Implementation

```typescript
// Automatic verification check (runs every minute)
async function checkEventVerification(eventId: string) {
  const event = await getEvent(eventId);
  const checkIns = await getCheckIns(eventId);
  const totalTickets = await getTotalTicketsSold(eventId);
  
  const percentage = (checkIns.length / totalTickets) * 100;
  
  if (percentage >= event.verification.threshold) {
    // Event verified!
    await updateEventStatus(eventId, 'verified');
    await releaseEscrowPayments(eventId);
    await notifyHost(eventId, 'Event verified! Payments released.');
    await notifyGuests(eventId, 'Event verified! Thank you for checking in.');
  }
}

// Release escrow payments
async function releaseEscrowPayments(eventId: string) {
  const escrows = await getEventEscrows(eventId);
  const totalAmount = escrows.reduce((sum, e) => sum + e.amount, 0);
  
  // Process revenue distribution
  const platformFee = totalAmount * 0.10;
  const vendorFees = await getVendorFees(eventId);
  const revenuePool = totalAmount - platformFee - vendorFees;
  
  // Split between host and co-hosts
  const host = await getEventHost(eventId);
  const coHosts = await getEventCoHosts(eventId);
  
  const hostShare = revenuePool * (host.revenueShare / 100);
  const coHostShares = coHosts.map(ch => ({
    userId: ch.userId,
    amount: revenuePool * (ch.revenueShare / 100),
    source: 'co-hosting'
  }));
  
  // Credit wallets
  await creditWallet(host.userId, hostShare, 'hosting', eventId);
  for (const coHost of coHostShares) {
    await creditWallet(coHost.userId, coHost.amount, coHost.source, eventId);
  }
  
  // Pay vendors
  const vendors = await getEventVendors(eventId);
  for (const vendor of vendors) {
    await creditWallet(vendor.userId, vendor.agreedPrice, 'vendor', eventId);
  }
  
  // Update escrow status
  await updateEscrowStatus(escrows.map(e => e.id), 'released');
}

// Handle failed verification
async function handleFailedVerification(eventId: string) {
  const event = await getEvent(eventId);
  const checkInWindow = event.verification.checkInWindow;
  const now = new Date();
  
  if (now > checkInWindow.end) {
    const checkIns = await getCheckIns(eventId);
    const totalTickets = await getTotalTicketsSold(eventId);
    const percentage = (checkIns.length / totalTickets) * 100;
    
    if (percentage < event.verification.threshold) {
      // Failed verification - refund all
      await updateEventStatus(eventId, 'failed');
      await refundAllTickets(eventId);
      await flagHost(event.hostId, 'Event failed verification');
      await notifyHost(eventId, 'Event failed verification. All tickets refunded.');
    }
  }
}
```

---

## 🗺️ Required Dependencies

### Flutter Packages

```yaml
dependencies:
  # Location
  geolocator: ^10.1.0
  geocoding: ^2.1.1
  google_maps_flutter: ^2.5.0
  
  # Permissions
  permission_handler: ^11.0.1
  
  # QR Code
  qr_flutter: ^4.1.0
  mobile_scanner: ^3.5.2
  
  # Payment
  flutter_paystack: ^1.0.7
  
  # Others
  cached_network_image: ^3.3.0
  intl: ^0.18.1
```

### Backend Dependencies

```json
{
  "dependencies": {
    "paystack": "^2.0.0",
    "node-cron": "^3.0.2",
    "geolib": "^3.3.4"
  }
}
```

---

## 📊 Testing Checklist

### Event Creation
- [ ] Host can set venue location on map
- [ ] Address auto-fills from coordinates
- [ ] Check-in radius is adjustable
- [ ] Location saves correctly

### Ticket Selling
- [ ] Multiple ticket types supported
- [ ] Quantity limits enforced
- [ ] Sold out status works
- [ ] Reservation expires after 15 minutes

### Payment
- [ ] Paystack integration works
- [ ] Payment goes to escrow
- [ ] Failed payments handled
- [ ] Refunds work correctly

### Check-In
- [ ] Location permission requested
- [ ] Distance calculated correctly
- [ ] Check-in only works at venue
- [ ] Can't check in twice
- [ ] Progress updates in real-time

### Verification
- [ ] 30% threshold triggers verification
- [ ] Payments released automatically
- [ ] Host notified of verification
- [ ] Failed events trigger refunds

---

## 🚀 Deployment Steps

1. **Backend Deployment**
   - Deploy verification cron job
   - Set up Paystack webhooks
   - Configure escrow accounts
   - Test payment flow

2. **Mobile App Update**
   - Add location permissions to manifest
   - Configure Google Maps API key
   - Test on real devices
   - Submit to app stores

3. **Monitoring**
   - Track verification rates
   - Monitor payment releases
   - Watch for fraud patterns
   - Collect user feedback

---

**This is the complete system. Frontend screens exist, they just need to be connected to these backend APIs.** 🚀
