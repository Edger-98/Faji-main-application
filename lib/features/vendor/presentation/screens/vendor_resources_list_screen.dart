import 'package:fajimobileapp/features/vendor/data/datasources/vendor_remote_datasource.dart';
import 'package:fajimobileapp/features/vendor/presentation/screens/vendor_edit_resource_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/config/app_config.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:retrofit/dio.dart';
import 'package:fajimobileapp/features/vendor/data/providers/vendor_providers.dart';

class VendorResourcesListScreen extends ConsumerStatefulWidget {
  const VendorResourcesListScreen({super.key});

  @override
  ConsumerState<VendorResourcesListScreen> createState() =>
      _VendorResourcesListScreenState();
}

class _VendorResourcesListScreenState
    extends ConsumerState<VendorResourcesListScreen> {
  bool _isLoading = true;
  List<dynamic> _resources = <dynamic>[];
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchResources();
  }

  Future<void> _fetchResources() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final VendorRemoteDataSource datasource = ref.read(vendorRemoteDataSourceProvider);
      final HttpResponse response = await datasource.getMyResources();

      if (!mounted) return;

      if (response.response.statusCode == 200) {
        final data = response.data;
        setState(() {
          _resources = data['data']?['resources'] ?? data['data'] ?? <dynamic>[];
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load resources');
      }
    } catch (e) {
      print('Error fetching resources: $e');
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isLoading = false;
        // Use mock data as fallback
        _resources = _getMockResources();
      });
    }
  }

  List<Map<String, dynamic>> _getMockResources() => [
      {
        'id': '1',
        '_id': '1',
        'title': 'Grand Ballroom - Premium Venue',
        'category': 'venue',
        'basePrice': 500000,
        'isAvailable': true,
        'bookingCount': 12,
      },
      {
        'id': '2',
        '_id': '2',
        'title': 'Professional DJ Services',
        'category': 'entertainment',
        'basePrice': 150000,
        'isAvailable': true,
        'bookingCount': 8,
      },
      {
        'id': '3',
        '_id': '3',
        'title': 'Catering Package - 100 guests',
        'category': 'catering',
        'basePrice': 250000,
        'isAvailable': false,
        'bookingCount': 15,
      },
    ];

  Future<void> _deleteResource(
      BuildContext context, Map<String, dynamic> resource) async {
    final bool? confirmed = await showDialog<bool>(
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
          'Are you sure you want to delete "${resource['title']}"?',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Cancel',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
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

    if (confirmed ?? false) {
      try {
        final VendorRemoteDataSource datasource = ref.read(vendorRemoteDataSourceProvider);
        final resourceId = resource['_id'] ?? resource['id'];
        await datasource.deleteResource(resourceId.toString());

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Service deleted successfully'),
            backgroundColor: AppColors.success,
          ),
        );

        _fetchResources(); // Refresh list
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete: ${e}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _toggleAvailability(Map<String, dynamic> resource) async {
    final bool newAvailability = !(resource['isAvailable'] as bool? ?? true);

    try {
      final VendorRemoteDataSource datasource = ref.read(vendorRemoteDataSourceProvider);
      final resourceId = resource['_id'] ?? resource['id'];
      await datasource.updateResource(
        resourceId.toString(),
        <String, dynamic>{'isAvailable': newAvailability},
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            newAvailability
                ? 'Service marked as available'
                : 'Service marked as unavailable',
          ),
          backgroundColor: AppColors.success,
        ),
      );

      _fetchResources(); // Refresh list
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update: ${e}'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  void _editResource(BuildContext context, Map<String, dynamic> resource) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VendorEditResourceScreen(resource: resource),
      ),
    );
    
    if (result == true) {
      _fetchResources(); // Refresh list after edit
    }
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
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, size: 24),
                      color: AppColors.onPrimary,
                      onPressed: () async {
                        await context.push(RouteManager.vendorAddResource);
                        _fetchResources(); // Refresh after adding
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: AppColors.primary))
                  : _resources.isEmpty
                      ? _buildEmptyState(context)
                      : RefreshIndicator(
                          onRefresh: _fetchResources,
                          color: AppColors.primary,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            itemCount: _resources.length,
                            itemBuilder: (context, index) {
                              final resource = _resources[index];
                              return _ResourceCard(
                                title: resource['title'] as String,
                                category: resource['category'] as String,
                                price: (resource['basePrice'] ?? resource['price'] ?? 0) as int,
                                isAvailable: resource['isAvailable'] as bool? ?? true,
                                onEdit: () => _editResource(context, resource),
                                onDelete: () => _deleteResource(context, resource),
                                onToggleAvailability: () => _toggleAvailability(resource),
                              );
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
    );

  Widget _buildEmptyState(BuildContext context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.inventory_2_outlined,
                size: 60,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
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
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.push(RouteManager.vendorAddResource),
              icon: const Icon(Icons.add, size: 20),
              label: const Text('Add Service'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
}

class _ResourceCard extends StatelessWidget {

  const _ResourceCard({
    required this.title,
    required this.category,
    required this.price,
    required this.isAvailable,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleAvailability,
  });
  final String title;
  final String category;
  final int price;
  final bool isAvailable;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggleAvailability;

  @override
  Widget build(BuildContext context) => Container(
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.toUpperCase(),
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                AppConfig.formatPriceFull(price.toDouble()),
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // Availability Toggle
              Expanded(
                child: InkWell(
                  onTap: onToggleAvailability,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: isAvailable
                          ? AppColors.success.withOpacity(0.1)
                          : const Color(0xFF2E2E2E),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isAvailable ? Icons.check_circle : Icons.cancel,
                          size: 16,
                          color: isAvailable
                              ? AppColors.success
                              : AppColors.textSecondary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isAvailable ? 'Available' : 'Unavailable',
                          style: AppTypography.bodySmall.copyWith(
                            color: isAvailable
                                ? AppColors.success
                                : AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Edit Button
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined, size: 20),
                color: AppColors.primary,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Delete Button
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, size: 20),
                color: AppColors.error,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.error.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  String _formatPrice(int price) => price.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
}
