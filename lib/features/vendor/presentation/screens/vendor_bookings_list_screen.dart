import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import '../../data/providers/vendor_providers.dart';

class VendorBookingsListScreen extends ConsumerStatefulWidget {
  const VendorBookingsListScreen({super.key});

  @override
  ConsumerState<VendorBookingsListScreen> createState() =>
      _VendorBookingsListScreenState();
}

class _VendorBookingsListScreenState
    extends ConsumerState<VendorBookingsListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = false;
  List<dynamic> _pendingBookings = [];
  List<dynamic> _acceptedBookings = [];
  List<dynamic> _completedBookings = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchAllBookings();
  }

  Future<void> _fetchAllBookings() async {
    setState(() => _isLoading = true);
    await Future.wait([
      _fetchBookings('pending'),
      _fetchBookings('accepted'),
      _fetchBookings('completed'),
    ]);
    setState(() => _isLoading = false);
  }

  Future<void> _fetchBookings(String status) async {
    try {
      final datasource = ref.read(vendorRemoteDataSourceProvider);
      final response = await datasource.getBookingRequests(status);
      
      if (!mounted) return;
      
      if (response.response.statusCode == 200) {
        final bookings = response.data['data'] ?? [];
        setState(() {
          if (status == 'pending') _pendingBookings = bookings;
          if (status == 'accepted') _acceptedBookings = bookings;
          if (status == 'completed') _completedBookings = bookings;
        });
      }
    } catch (e) {
      print('Error fetching $status bookings: $e');
      // Keep using mock data on error
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                      color: AppColors.onSurface,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Booking Requests',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Tabs
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: AppColors.searchBarBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                labelColor: AppColors.onPrimary,
                unselectedLabelColor: AppColors.textSecondary,
                labelStyle: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(text: 'Pending'),
                  Tab(text: 'Accepted'),
                  Tab(text: 'Completed'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildPendingList(),
                  _buildAcceptedList(),
                  _buildCompletedList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPendingList() {
    final mockBookings = [
      {
        'id': '1',
        'customerName': 'John Doe',
        'eventName': 'Birthday Party',
        'date': '2024-12-25',
        'offeredPrice': 450000,
        'service': 'Grand Ballroom',
        'message': 'We need the venue for our annual event',
      },
      {
        'id': '2',
        'customerName': 'Sarah Smith',
        'eventName': 'Wedding Reception',
        'date': '2025-01-15',
        'offeredPrice': 800000,
        'service': 'Premium Venue Package',
        'message': 'Looking for a beautiful venue for our wedding',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: mockBookings.length,
      itemBuilder: (context, index) {
        final booking = mockBookings[index];
        return _BookingCard(
          customerName: booking['customerName'] as String,
          eventName: booking['eventName'] as String,
          date: booking['date'] as String,
          price: booking['offeredPrice'] as int,
          service: booking['service'] as String,
          message: booking['message'] as String,
          status: 'pending',
          onAccept: () => _showAcceptDialog(context, booking),
          onDecline: () => _showDeclineDialog(context, booking),
          onCounterOffer: () => _showCounterOfferDialog(context, booking),
        );
      },
    );
  }

  Widget _buildAcceptedList() {
    final mockBookings = [
      {
        'id': '3',
        'customerName': 'Mike Johnson',
        'eventName': 'Corporate Event',
        'date': '2024-12-20',
        'agreedPrice': 500000,
        'service': 'Conference Hall',
      },
    ];

    final bookings = _acceptedBookings.isNotEmpty ? _acceptedBookings : mockBookings;

    return _isLoading
        ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
        : RefreshIndicator(
            onRefresh: () => _fetchBookings('accepted'),
            color: AppColors.primary,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return _BookingCard(
                  customerName: booking['customerName'] as String,
                  eventName: booking['eventName'] as String,
                  date: booking['date'] as String,
                  price: (booking['agreedPrice'] ?? booking['offeredPrice']) as int,
                  service: booking['service'] as String,
                  status: 'accepted',
                );
              },
            ),
          );
  }

  Widget _buildCompletedList() {
    final mockBookings = [
      {
        'id': '4',
        'customerName': 'Emily Davis',
        'eventName': 'Anniversary Party',
        'date': '2024-12-10',
        'agreedPrice': 350000,
        'service': 'Small Hall',
        'earnings': 350000,
      },
    ];

    final bookings = _completedBookings.isNotEmpty ? _completedBookings : mockBookings;

    return _isLoading
        ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
        : RefreshIndicator(
            onRefresh: () => _fetchBookings('completed'),
            color: AppColors.primary,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return _BookingCard(
                  customerName: booking['customerName'] as String,
                  eventName: booking['eventName'] as String,
                  date: booking['date'] as String,
                  price: (booking['agreedPrice'] ?? booking['offeredPrice']) as int,
                  service: booking['service'] as String,
                  status: 'completed',
                  earnings: booking['earnings'] as int? ?? (booking['agreedPrice'] ?? booking['offeredPrice']) as int,
                );
              },
            ),
          );
  }

  void _showAcceptDialog(BuildContext context, Map<String, dynamic> booking) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.searchBarBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Accept Booking',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Accept booking for ${booking['eventName']} at \$${_formatPrice(booking['offeredPrice'] as int)}?',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Call API POST /marketplace/bookings/:id/accept
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking accepted!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Accept',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeclineDialog(BuildContext context, Map<String, dynamic> booking) {
    final reasonController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.searchBarBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Decline Booking',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Please provide a reason for declining:',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              maxLines: 3,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.onSurface,
              ),
              decoration: InputDecoration(
                hintText: 'e.g., Already booked for that date',
                filled: true,
                fillColor: const Color(0xFF2E2E2E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Call API POST /marketplace/bookings/:id/decline
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking declined')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Decline',
              style: AppTypography.bodyMedium.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCounterOfferDialog(BuildContext context, Map<String, dynamic> booking) {
    final counterPriceController = TextEditingController();
    final messageController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.searchBarBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Send Counter Offer',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Original offer: \$${_formatPrice(booking['offeredPrice'] as int)}',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: counterPriceController,
              keyboardType: TextInputType.number,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.onSurface,
              ),
              decoration: InputDecoration(
                labelText: 'Your Counter Offer',
                prefixText: '\$ ',
                filled: true,
                fillColor: const Color(0xFF2E2E2E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: messageController,
              maxLines: 2,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.onSurface,
              ),
              decoration: InputDecoration(
                labelText: 'Message (optional)',
                hintText: 'Explain your counter offer...',
                filled: true,
                fillColor: const Color(0xFF2E2E2E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Call API POST /marketplace/bookings/:id/counter-offer
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Counter offer sent!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Send Offer',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}

class _BookingCard extends StatelessWidget {
  final String customerName;
  final String eventName;
  final String date;
  final int price;
  final String service;
  final String status;
  final String? message;
  final int? earnings;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;
  final VoidCallback? onCounterOffer;

  const _BookingCard({
    required this.customerName,
    required this.eventName,
    required this.date,
    required this.price,
    required this.service,
    required this.status,
    this.message,
    this.earnings,
    this.onAccept,
    this.onDecline,
    this.onCounterOffer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.searchBarBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFF2E2E2E),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerName,
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      eventName,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '\$${_formatPrice(price)}',
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.event, size: 14, color: AppColors.textSecondary),
              const SizedBox(width: 6),
              Text(
                date,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              Icon(Icons.work_outline, size: 14, color: AppColors.textSecondary),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  service,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          if (message != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF2E2E2E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.message, size: 16, color: AppColors.textSecondary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      message!,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (status == 'pending') ...[
            const SizedBox(height: 16),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onDecline,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: AppColors.error),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Decline',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.error,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onCounterOffer,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Counter',
                          style: AppTypography.bodyMedium.copyWith(
                            color: AppColors.primary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onAccept,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Accept Booking',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          if (status == 'accepted') ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: AppColors.success, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    'Accepted - Awaiting Event',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (status == 'completed' && earnings != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.monetization_on, color: AppColors.primary, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Earned: \$${_formatPrice(earnings!)}',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
