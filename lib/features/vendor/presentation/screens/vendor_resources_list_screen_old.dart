import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/vendor/data/providers/vendor_providers.dart';

class VendorResourcesListScreen extends ConsumerWidget {
  const VendorResourcesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Fetch from API GET /marketplace/vendors/me/resources
    final List<Map<String, Object>> mockResources = <Map<String, Object>>[
      <String, Object>{
        'id': '1',
        'title': 'Grand Ballroom - Premium Venue',
        'category': 'venue',
        'basePrice': 500000,
        'isAvailable': true,
        'bookingCount': 12,
      },
      <String, Object>{
        'id': '2',
        'title': 'Professional DJ Services',
        'category': 'entertainment',
        'basePrice': 150000,
        'isAvailable': true,
        'bookingCount': 8,
      },
      <String, Object>{
        'id': '3',
        'title': 'Catering Package - 100 guests',
        'category': 'catering',
        'basePrice': 250000,
        'isAvailable': false,
        'bookingCount': 15,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
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
                    'My Services',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, size: 24),
                      color: AppColors.onPrimary,
                      onPressed: () => context.push(RouteManager.vendorAddResource),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: mockResources.isEmpty
                  ? _buildEmptyState(context)
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: mockResources.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Map<String, Object> resource = mockResources[index];
                        return _ResourceCard(
                          title: resource['title']! as String,
                          category: resource['category']! as String,
                          price: resource['basePrice']! as int,
                          bookings: resource['bookingCount']! as int,
                          isAvailable: resource['isAvailable']! as bool,
                          onEdit: () {
                            // TODO: Navigate to edit screen
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Edit feature coming soon')),
                            );
                          },
                          onDelete: () => _showDeleteDialog(context, resource['title']! as String),
                          onToggleAvailability: () {
                            // TODO: Call API to toggle
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  resource['isAvailable']! as bool
                                      ? 'Service marked as unavailable'
                                      : 'Service marked as available',
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 80,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: 16),
          Text(
            'No Services Yet',
            style: AppTypography.titleLarge.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add your first service to start receiving bookings',
            textAlign: TextAlign.center,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => context.push(RouteManager.vendorAddResource),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(Icons.add, color: AppColors.onPrimary),
            label: Text(
              'Add Service',
              style: AppTypography.labelLarge.copyWith(
                color: AppColors.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );

  void _showDeleteDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: AppColors.searchBarBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Delete Service',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "$title"? This action cannot be undone.',
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
              // TODO: Call API DELETE /marketplace/vendors/me/resources/:id
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Service deleted')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Delete',
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

class _ResourceCard extends StatelessWidget {

  const _ResourceCard({
    required this.title,
    required this.category,
    required this.price,
    required this.bookings,
    required this.isAvailable,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleAvailability,
  });
  final String title;
  final String category;
  final int price;
  final int bookings;
  final bool isAvailable;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggleAvailability;

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.searchBarBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xFF2E2E2E),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 48,
                    color: AppColors.textSecondary,
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isAvailable ? AppColors.success : AppColors.error,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      isAvailable ? 'Available' : 'Unavailable',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        category.toUpperCase(),
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.event_available, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text(
                      '$bookings bookings',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '₦${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                      style: AppTypography.titleLarge.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: onToggleAvailability,
                      icon: Icon(
                        isAvailable ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: onEdit,
                      icon: Icon(
                        Icons.edit_outlined,
                        color: AppColors.textSecondary,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColors.error,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
