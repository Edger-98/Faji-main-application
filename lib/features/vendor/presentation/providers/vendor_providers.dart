import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/vendor/domain/entities/vendor_profile_entity.dart';
import 'package:fajimobileapp/features/vendor/domain/entities/vendor_resource_entity.dart';
import 'package:fajimobileapp/features/vendor/domain/entities/vendor_booking_entity.dart';
import 'package:fajimobileapp/features/vendor/domain/entities/vendor_stats_entity.dart';
import 'package:fajimobileapp/features/vendor/domain/entities/vendor_status.dart';
import 'package:fajimobileapp/features/vendor/data/datasources/vendor_remote_datasource.dart';
import 'package:fajimobileapp/core/network/api_client.dart';

// Mock data providers - Replace with actual API calls

/// Provider for vendor profile
final FutureProvider<VendorProfileEntity?> vendorProfileProvider = FutureProvider<VendorProfileEntity?>((FutureProviderRef<VendorProfileEntity?> ref) async {
  // TODO: Fetch from API
  await Future.delayed(const Duration(milliseconds: 500));
  
  // Return null if user is not a vendor
  // Return VendorProfileEntity if user is a vendor
  return null;
});

/// Provider for vendor stats
final FutureProvider<VendorStatsEntity> vendorStatsProvider = FutureProvider<VendorStatsEntity>((FutureProviderRef<VendorStatsEntity> ref) async {
  // TODO: Fetch from API
  await Future.delayed(const Duration(milliseconds: 500));
  
  return const VendorStatsEntity(
    totalBookings: 24,
    totalEarnings: 2450,
    pendingRequests: 3,
    activeResources: 8,
    completedBookings: 21,
    averageRating: 4.8,
  );
});

/// Provider for vendor resources
final FutureProvider<List<VendorResourceEntity>> vendorResourcesProvider = FutureProvider<List<VendorResourceEntity>>((FutureProviderRef<List<VendorResourceEntity>> ref) async {
  // TODO: Fetch from API
  await Future.delayed(const Duration(milliseconds: 500));
  
  return <VendorResourceEntity>[
    VendorResourceEntity(
      id: '1',
      vendorId: 'vendor_123',
      category: 'entertainment',
      title: 'Professional DJ Services',
      description: 'High-quality DJ services for all types of events',
      price: 250,
      images: <String>[],
      bookingCount: 12,
      createdAt: DateTime.now(),
    ),
    VendorResourceEntity(
      id: '2',
      vendorId: 'vendor_123',
      category: 'photography',
      title: 'Event Photography',
      description: 'Professional photography services',
      price: 500,
      images: <String>[],
      bookingCount: 8,
      createdAt: DateTime.now(),
    ),
  ];
});

/// Provider for vendor bookings with status filter
final FutureProviderFamily<List<VendorBookingEntity>, BookingStatus?> vendorBookingsProvider = FutureProvider.family<List<VendorBookingEntity>, BookingStatus?>((FutureProviderRef<List<VendorBookingEntity>> ref, BookingStatus? status) async {
  // TODO: Fetch from API with status filter
  await Future.delayed(const Duration(milliseconds: 500));
  
  final List<VendorBookingEntity> allBookings = <VendorBookingEntity>[
    VendorBookingEntity(
      id: '1',
      vendorId: 'vendor_123',
      resourceId: 'resource_1',
      customerId: 'customer_1',
      customerName: 'John Doe',
      eventName: 'Birthday Party',
      eventDate: DateTime(2025, 12, 25),
      offeredPrice: 250,
      status: BookingStatus.pending,
      createdAt: DateTime.now(),
    ),
    VendorBookingEntity(
      id: '2',
      vendorId: 'vendor_123',
      resourceId: 'resource_2',
      customerId: 'customer_2',
      customerName: 'Sarah Smith',
      eventName: 'Wedding Reception',
      eventDate: DateTime(2026, 1, 15),
      offeredPrice: 800,
      status: BookingStatus.pending,
      createdAt: DateTime.now(),
    ),
    VendorBookingEntity(
      id: '3',
      vendorId: 'vendor_123',
      resourceId: 'resource_1',
      customerId: 'customer_3',
      customerName: 'Mike Johnson',
      eventName: 'Corporate Event',
      eventDate: DateTime(2025, 12, 20),
      offeredPrice: 500,
      status: BookingStatus.accepted,
      createdAt: DateTime.now(),
    ),
    VendorBookingEntity(
      id: '4',
      vendorId: 'vendor_123',
      resourceId: 'resource_1',
      customerId: 'customer_4',
      customerName: 'Emily Davis',
      eventName: 'Anniversary Party',
      eventDate: DateTime(2025, 12, 10),
      offeredPrice: 350,
      status: BookingStatus.completed,
      createdAt: DateTime.now(),
    ),
  ];
  
  if (status == null) {
    return allBookings;
  }
  
  return allBookings.where((VendorBookingEntity booking) => booking.status == status).toList();
});

/// Provider to check if current user is a vendor
final FutureProvider<bool> isVendorProvider = FutureProvider<bool>((FutureProviderRef<bool> ref) async {
  final VendorProfileEntity? profile = await ref.watch(vendorProfileProvider.future);
  return profile != null;
});

/// State notifier for vendor registration
class VendorRegistrationNotifier extends StateNotifier<AsyncValue<void>> {
  VendorRegistrationNotifier() : super(const AsyncValue.data(null));

  Future<void> registerVendor({
    required String businessName,
    required String description,
    required List<String> categories,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      // TODO: Call API to register vendor
      await Future.delayed(const Duration(seconds: 2));
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final StateNotifierProvider<VendorRegistrationNotifier, AsyncValue<void>> vendorRegistrationProvider = StateNotifierProvider<VendorRegistrationNotifier, AsyncValue<void>>((StateNotifierProviderRef<VendorRegistrationNotifier, AsyncValue<void>> ref) => VendorRegistrationNotifier());

/// State notifier for resource management
class ResourceManagementNotifier extends StateNotifier<AsyncValue<void>> {
  ResourceManagementNotifier() : super(const AsyncValue.data(null));

  Future<void> addResource({
    required String category,
    required String title,
    required String description,
    required double price,
    List<String>? images,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      // TODO: Call API to add resource
      await Future.delayed(const Duration(seconds: 1));
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> updateResource({
    required String resourceId,
    String? title,
    String? description,
    double? price,
    bool? isAvailable,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      // TODO: Call API to update resource
      await Future.delayed(const Duration(seconds: 1));
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> deleteResource(String resourceId) async {
    state = const AsyncValue.loading();
    
    try {
      // TODO: Call API to delete resource
      await Future.delayed(const Duration(seconds: 1));
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final StateNotifierProvider<ResourceManagementNotifier, AsyncValue<void>> resourceManagementProvider = StateNotifierProvider<ResourceManagementNotifier, AsyncValue<void>>((StateNotifierProviderRef<ResourceManagementNotifier, AsyncValue<void>> ref) => ResourceManagementNotifier());

/// State notifier for booking management
class BookingManagementNotifier extends StateNotifier<AsyncValue<void>> {
  BookingManagementNotifier() : super(const AsyncValue.data(null));

  Future<void> acceptBooking(String bookingId) async {
    state = const AsyncValue.loading();
    
    try {
      // TODO: Call API to accept booking
      await Future.delayed(const Duration(seconds: 1));
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> declineBooking(String bookingId) async {
    state = const AsyncValue.loading();
    
    try {
      // TODO: Call API to decline booking
      await Future.delayed(const Duration(seconds: 1));
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> counterOffer({
    required String bookingId,
    required double counterPrice,
  }) async {
    state = const AsyncValue.loading();
    
    try {
      // TODO: Call API to send counter offer
      await Future.delayed(const Duration(seconds: 1));
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final StateNotifierProvider<BookingManagementNotifier, AsyncValue<void>> bookingManagementProvider = StateNotifierProvider<BookingManagementNotifier, AsyncValue<void>>((StateNotifierProviderRef<BookingManagementNotifier, AsyncValue<void>> ref) => BookingManagementNotifier());


/// Provider for checking vendor status
final FutureProvider<VendorStatus?> vendorStatusProvider = FutureProvider<VendorStatus?>((FutureProviderRef<VendorStatus?> ref) async {
  try {
    final dio = ref.read(dioProvider);
    final vendorDataSource = VendorRemoteDataSource(dio);

    final response = await vendorDataSource.checkVendorStatus();

    if (response.response.statusCode == 200 && response.data != null) {
      final responseMap = response.data as Map<String, dynamic>;

      // Handle both wrapped ({data: {...}}) and unwrapped responses
      final Map<String, dynamic> data =
          (responseMap['data'] as Map<String, dynamic>?) ?? responseMap;

      // Try the generated fromJson first
      try {
        return VendorStatus.fromJson(data);
      } catch (_) {
        // Fallback: manually parse common field name variants
        final bool isVendor = data['isVendor'] as bool? ??
            data['is_vendor'] as bool? ??
            data['hasVendorAccount'] as bool? ??
            false;
        final bool hasAccount = data['hasVendorAccount'] as bool? ??
            data['has_vendor_account'] as bool? ??
            isVendor;
        return VendorStatus(
          isVendor: isVendor,
          hasVendorAccount: hasAccount,
          vendorId: data['vendorId'] as String? ?? data['vendor_id'] as String?,
          verificationStatus: data['verificationStatus'] as String? ??
              data['status'] as String?,
          isVerified: data['isVerified'] as bool? ?? false,
          isActive: data['isActive'] as bool? ?? isVendor,
        );
      }
    }

    return null;
  } catch (e) {
    print('Error checking vendor status: $e');
    return null;
  }
});
