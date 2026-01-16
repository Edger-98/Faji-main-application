import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import '../../data/providers/vendor_providers.dart';
import '../widgets/counter_offer_bottom_sheet.dart';

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
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.searchBarBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                labelColor: AppColors.onPrimary,
                unselectedLabelColor: AppColors.textSecondary,
                labelStyle: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
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
        'offeredPrice': 450,
        'service': 'Grand Ballroom',
        'message': 'We need the venue for our annual event',
      },
      {
        'id': '2',
        'customerName': 'Sarah Smith',
        'eventName': 'Wedding Reception',
        'date': '2025-01-15',
        'offeredPrice': 800,
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
          onRespond: () => _showResponseBottomSheet(context, booking),
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
        'agreedPrice': 500,
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
        'agreedPrice': 350,
        'service': 'Small Hall',
        'earnings': 350,
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

  void _showResponseBottomSheet(BuildContext context, Map<String, dynamic> booking) async {
    final result = await showCounterOfferBottomSheet(
      context: context,
      bookingId: booking['id'] as String,
      currentAmount: '\$${booking['offeredPrice']}',
      onAccept: () {
        // TODO: Call API POST /marketplace/bookings/:id/accept
        print('Accepted booking ${booking['id']}');
      },
      onCounterOffer: (amount, message) {
        // TODO: Call API POST /marketplace/bookings/:id/counter-offer
        print('Counter offer: \$$amount, message: $message');
      },
      onDecline: (reason) {
        // TODO: Call API POST /marketplace/bookings/:id/decline
        print('Declined booking ${booking['id']}, reason: $reason');
      },
    );

    if (result != null && mounted) {
      String message = '';
      switch (result['action']) {
        case 'accept':
          message = 'Booking accepted!';
          break;
        case 'counter':
          message = 'Counter offer sent: \$${result['amount']}';
          break;
        case 'decline':
          message = 'Booking declined';
          break;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: context.colors.surfaceContainerHighest,
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Refresh the list
      _fetchBookings('pending');
    }
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
  final VoidCallback? onRespond;

  const _BookingCard({
    required this.customerName,
    required this.eventName,
    required this.date,
    required this.price,
    required this.service,
    required this.status,
    this.message,
    this.earnings,
    this.onRespond,
  });

  static String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

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
                '\${_formatPrice(price)}',
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onRespond,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Respond to Request',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
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
                    'Earned: \${_formatPrice(earnings!)}',
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
}
