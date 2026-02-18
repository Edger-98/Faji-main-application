import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/marketplace_resource.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_profile.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/booking.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/counter_offer.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_stats.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_dashboard.dart';

abstract class MarketplaceRepository {
  /// Get marketplace resources by category
  Future<Either<Failure, MarketplaceResourcesResponse>> getMarketplaceResources({
    required String category,
    int page = 1,
    int limit = 20,
  });

  /// Get vendor profile by ID
  Future<Either<Failure, VendorProfile>> getVendorProfile({
    required String vendorId,
  });

  /// Create booking request
  Future<Either<Failure, Booking>> createBooking({
    required CreateBookingRequest request,
  });

  /// Get my bookings (host side)
  Future<Either<Failure, BookingsResponse>> getMyBookings({
    String? status,
  });

  /// Get booking requests (vendor side)
  Future<Either<Failure, BookingsResponse>> getBookingRequests({
    String? status,
  });

  /// Accept booking (vendor side)
  Future<Either<Failure, Booking>> acceptBooking({
    required String bookingId,
    double? agreedPrice,
  });

  /// Decline booking (vendor side)
  Future<Either<Failure, Booking>> declineBooking({
    required String bookingId,
    String? reason,
  });

  /// Send counter offer (vendor side)
  Future<Either<Failure, CounterOfferResponse>> sendCounterOffer({
    required String bookingId,
    required CounterOfferRequest request,
  });

  /// Update booking status
  Future<Either<Failure, Booking>> updateBooking({
    required String bookingId,
    required UpdateBookingRequest request,
  });

  /// Get my vendor profile
  Future<Either<Failure, VendorProfile>> getMyVendorProfile();

  /// Get vendor stats
  Future<Either<Failure, VendorStats>> getVendorStats();

  /// Add resource (vendor)
  Future<Either<Failure, MarketplaceResource>> addResource({
    required Map<String, dynamic> resourceData,
  });

  /// Get my resources (vendor)
  Future<Either<Failure, List<MarketplaceResource>>> getMyResources();

  /// Update resource (vendor)
  Future<Either<Failure, MarketplaceResource>> updateResource({
    required String resourceId,
    required Map<String, dynamic> resourceData,
  });

  /// Delete resource (vendor)
  Future<Either<Failure, void>> deleteResource({
    required String resourceId,
  });

  /// Get vendor dashboard
  Future<Either<Failure, VendorDashboard>> getVendorDashboard();
}
