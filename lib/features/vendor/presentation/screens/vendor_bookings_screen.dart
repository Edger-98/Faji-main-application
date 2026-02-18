import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class VendorBookingsScreen extends ConsumerStatefulWidget {
  const VendorBookingsScreen({super.key});

  @override
  ConsumerState<VendorBookingsScreen> createState() =>
      _VendorBookingsScreenState();
}

class _VendorBookingsScreenState extends ConsumerState<VendorBookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                  color: const Color(0xFFFEB822),
                  borderRadius: BorderRadius.circular(12),
                ),
                labelColor: Colors.white,
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

  Widget _buildPendingList() => ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        _BookingCard(
          customerName: 'John Doe',
          eventName: 'Birthday Party',
          date: 'Dec 25, 2025',
          price: '\$250',
          service: 'DJ Services',
          status: 'pending',
          onAccept: () {
            HapticFeedback.mediumImpact();
            _showCounterOfferDialog(context);
          },
          onDecline: () {
            HapticFeedback.lightImpact();
            _showDeclineDialog(context);
          },
        ),
        const SizedBox(height: 12),
        _BookingCard(
          customerName: 'Sarah Smith',
          eventName: 'Wedding Reception',
          date: 'Jan 15, 2026',
          price: '\$800',
          service: 'Photography',
          status: 'pending',
          onAccept: () {
            HapticFeedback.mediumImpact();
            _showCounterOfferDialog(context);
          },
          onDecline: () {
            HapticFeedback.lightImpact();
            _showDeclineDialog(context);
          },
        ),
      ],
    );

  Widget _buildAcceptedList() => ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        _BookingCard(
          customerName: 'Mike Johnson',
          eventName: 'Corporate Event',
          date: 'Dec 20, 2025',
          price: '\$500',
          service: 'Catering',
          status: 'accepted',
        ),
      ],
    );

  Widget _buildCompletedList() => ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        _BookingCard(
          customerName: 'Emily Davis',
          eventName: 'Anniversary Party',
          date: 'Dec 10, 2025',
          price: '\$350',
          service: 'DJ Services',
          status: 'completed',
          earnings: '\$350',
        ),
        const SizedBox(height: 12),
        _BookingCard(
          customerName: 'Robert Wilson',
          eventName: 'Graduation Party',
          date: 'Dec 5, 2025',
          price: '\$400',
          service: 'Photography',
          status: 'completed',
          earnings: '\$400',
        ),
      ],
    );

  void _showCounterOfferDialog(BuildContext context) {
    final TextEditingController counterOfferController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: AppColors.searchBarBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Accept or Counter Offer',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Accept the current offer or propose a counter offer',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: counterOfferController,
              keyboardType: TextInputType.number,
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.onSurface,
              ),
              decoration: InputDecoration(
                labelText: 'Counter Offer Amount',
                prefixText: r'$ ',
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
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Counter offer sent!')),
              );
            },
            child: Text(
              'Counter Offer',
              style: AppTypography.bodyMedium.copyWith(
                color: const Color(0xFFFEB822),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking accepted!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFEB822),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Accept',
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

  void _showDeclineDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: AppColors.searchBarBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Decline Booking',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Are you sure you want to decline this booking request?',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        actions: <Widget>[
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Booking declined')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFCA4638),
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
}

class _BookingCard extends StatelessWidget {

  const _BookingCard({
    required this.customerName,
    required this.eventName,
    required this.date,
    required this.price,
    required this.service,
    required this.status,
    this.earnings,
    this.onAccept,
    this.onDecline,
  });
  final String customerName;
  final String eventName;
  final String date;
  final String price;
  final String service;
  final String status;
  final String? earnings;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;

  @override
  Widget build(BuildContext context) => Container(
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
                child: const Icon(
                  Icons.person,
                  color: Color(0xFFFEB822),
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
                price,
                style: AppTypography.titleMedium.copyWith(
                  color: const Color(0xFFFEB822),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.event,
                size: 14,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                date,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.work_outline,
                size: 14,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                service,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          if (status == 'pending') ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onDecline,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFCA4638)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Decline',
                      style: AppTypography.bodyMedium.copyWith(
                        color: const Color(0xFFCA4638),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAccept,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFEB822),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Accept',
                      style: AppTypography.bodyMedium.copyWith(
                        color: Colors.white,
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
                color: const Color(0xFF4CAF50).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF4CAF50),
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Accepted - Awaiting Event',
                    style: AppTypography.bodySmall.copyWith(
                      color: const Color(0xFF4CAF50),
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
                color: const Color(0xFFFEB822).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.monetization_on,
                    color: Color(0xFFFEB822),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Earned: $earnings',
                    style: AppTypography.bodyMedium.copyWith(
                      color: const Color(0xFFFEB822),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Rate Customer',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.onSurface,
                      ),
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
