import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/marketplace_resource.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_profile.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/booking.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_marketplace_resources_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_vendor_profile_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/create_booking_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_my_bookings_usecase.dart';

// State for marketplace
class MarketplaceState {

  MarketplaceState({
    required this.resourcesState,
    required this.vendorProfileState,
    required this.createBookingState,
    required this.myBookingsState,
  });
  final BaseState<MarketplaceResourcesResponse> resourcesState;
  final BaseState<VendorProfile> vendorProfileState;
  final BaseState<Booking> createBookingState;
  final BaseState<BookingsResponse> myBookingsState;

  MarketplaceState copyWith({
    BaseState<MarketplaceResourcesResponse>? resourcesState,
    BaseState<VendorProfile>? vendorProfileState,
    BaseState<Booking>? createBookingState,
    BaseState<BookingsResponse>? myBookingsState,
  }) => MarketplaceState(
      resourcesState: resourcesState ?? this.resourcesState,
      vendorProfileState: vendorProfileState ?? this.vendorProfileState,
      createBookingState: createBookingState ?? this.createBookingState,
      myBookingsState: myBookingsState ?? this.myBookingsState,
    );
}

class MarketplaceViewModel extends StateNotifier<MarketplaceState> {

  MarketplaceViewModel(
    this._getMarketplaceResourcesUseCase,
    this._getVendorProfileUseCase,
    this._createBookingUseCase,
    this._getMyBookingsUseCase,
  ) : super(MarketplaceState(
          resourcesState: const BaseState.initial(),
          vendorProfileState: const BaseState.initial(),
          createBookingState: const BaseState.initial(),
          myBookingsState: const BaseState.initial(),
        ));
  final GetMarketplaceResourcesUseCase _getMarketplaceResourcesUseCase;
  final GetVendorProfileUseCase _getVendorProfileUseCase;
  final CreateBookingUseCase _createBookingUseCase;
  final GetMyBookingsUseCase _getMyBookingsUseCase;

  /// Get marketplace resources by category
  Future<void> getMarketplaceResources({
    required String category,
    int page = 1,
    int limit = 20,
  }) async {
    if (!mounted) return;
    
    state = state.copyWith(
      resourcesState: const BaseState.loading(),
    );

    final Either<Failure, MarketplaceResourcesResponse> result = await _getMarketplaceResourcesUseCase(
      category: category,
      page: page,
      limit: limit,
    );

    if (!mounted) return;

    result.fold(
      (Failure failure) {
        if (mounted) {
          state = state.copyWith(
            resourcesState: BaseState.error(failure),
          );
        }
      },
      (MarketplaceResourcesResponse resources) {
        if (mounted) {
          state = state.copyWith(
            resourcesState: BaseState.success(resources),
          );
        }
      },
    );
  }

  /// Get vendor profile
  Future<void> getVendorProfile({
    required String vendorId,
  }) async {
    if (!mounted) return;
    
    state = state.copyWith(
      vendorProfileState: const BaseState.loading(),
    );

    final Either<Failure, VendorProfile> result = await _getVendorProfileUseCase(
      vendorId: vendorId,
    );

    if (!mounted) return;

    result.fold(
      (Failure failure) {
        if (mounted) {
          state = state.copyWith(
            vendorProfileState: BaseState.error(failure),
          );
        }
      },
      (VendorProfile profile) {
        if (mounted) {
          state = state.copyWith(
            vendorProfileState: BaseState.success(profile),
          );
        }
      },
    );
  }

  /// Create booking
  Future<void> createBooking({
    required CreateBookingRequest request,
  }) async {
    if (!mounted) return;
    
    state = state.copyWith(
      createBookingState: const BaseState.loading(),
    );

    final Either<Failure, Booking> result = await _createBookingUseCase(
      request: request,
    );

    if (!mounted) return;

    result.fold(
      (Failure failure) {
        if (mounted) {
          state = state.copyWith(
            createBookingState: BaseState.error(failure),
          );
        }
      },
      (Booking booking) {
        if (mounted) {
          state = state.copyWith(
            createBookingState: BaseState.success(booking),
          );
        }
      },
    );
  }

  /// Get my bookings
  Future<void> getMyBookings({
    String? status,
  }) async {
    if (!mounted) return;
    
    state = state.copyWith(
      myBookingsState: const BaseState.loading(),
    );

    final Either<Failure, BookingsResponse> result = await _getMyBookingsUseCase(
      status: status,
    );

    if (!mounted) return;

    result.fold(
      (Failure failure) {
        if (mounted) {
          state = state.copyWith(
            myBookingsState: BaseState.error(failure),
          );
        }
      },
      (BookingsResponse bookings) {
        if (mounted) {
          state = state.copyWith(
            myBookingsState: BaseState.success(bookings),
          );
        }
      },
    );
  }

  /// Filter bookings by status
  Future<void> filterBookingsByStatus(String status) async {
    await getMyBookings(status: status);
  }

  /// Reset create booking state
  void resetCreateBooking() {
    if (!mounted) return;
    state = state.copyWith(
      createBookingState: const BaseState.initial(),
    );
  }
}
