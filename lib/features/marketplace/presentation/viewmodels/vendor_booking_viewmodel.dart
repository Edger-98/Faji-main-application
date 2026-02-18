import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/booking.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/counter_offer.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_booking_requests_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/accept_booking_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/decline_booking_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/send_counter_offer_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/update_booking_usecase.dart';

// State for vendor bookings
typedef VendorBookingState = BaseState<BookingsResponse>;

class VendorBookingViewModel extends StateNotifier<VendorBookingState> {

  VendorBookingViewModel(
    this._getBookingRequestsUseCase,
    this._acceptBookingUseCase,
    this._declineBookingUseCase,
    this._sendCounterOfferUseCase,
    this._updateBookingUseCase,
  ) : super(const BaseState.initial());
  final GetBookingRequestsUseCase _getBookingRequestsUseCase;
  final AcceptBookingUseCase _acceptBookingUseCase;
  final DeclineBookingUseCase _declineBookingUseCase;
  final SendCounterOfferUseCase _sendCounterOfferUseCase;
  final UpdateBookingUseCase _updateBookingUseCase;

  /// Get booking requests (vendor side)
  Future<void> getBookingRequests({
    String? status,
  }) async {
    state = const BaseState.loading();

    final Either<Failure, BookingsResponse> result = await _getBookingRequestsUseCase(
      status: status,
    );

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (BookingsResponse bookings) => state = BaseState.success(bookings),
    );
  }

  /// Accept booking
  Future<Booking?> acceptBooking({
    required String bookingId,
    double? agreedPrice,
  }) async {
    final Either<Failure, Booking> result = await _acceptBookingUseCase(
      bookingId: bookingId,
      agreedPrice: agreedPrice,
    );

    return result.fold(
      (Failure failure) => null,
      (Booking booking) => booking,
    );
  }

  /// Decline booking
  Future<bool> declineBooking({
    required String bookingId,
    String? reason,
  }) async {
    final Either<Failure, Booking> result = await _declineBookingUseCase(
      bookingId: bookingId,
      reason: reason,
    );

    return result.fold(
      (Failure failure) => false,
      (Booking booking) => true,
    );
  }

  /// Send counter offer
  Future<CounterOfferResponse?> sendCounterOffer({
    required String bookingId,
    required double counterPrice,
    String? message,
  }) async {
    final CounterOfferRequest request = CounterOfferRequest(
      counterPrice: counterPrice,
      message: message,
    );

    final Either<Failure, CounterOfferResponse> result = await _sendCounterOfferUseCase(
      bookingId: bookingId,
      request: request,
    );

    return result.fold(
      (Failure failure) => null,
      (CounterOfferResponse response) => response,
    );
  }

  /// Update booking status
  Future<bool> updateBooking({
    required String bookingId,
    required String status,
  }) async {
    final UpdateBookingRequest request = UpdateBookingRequest(status: status);

    final Either<Failure, Booking> result = await _updateBookingUseCase(
      bookingId: bookingId,
      request: request,
    );

    return result.fold(
      (Failure failure) => false,
      (Booking booking) => true,
    );
  }

  /// Filter by status
  Future<void> filterByStatus(String status) async {
    await getBookingRequests(status: status);
  }

  /// Refresh
  Future<void> refresh() async {
    await getBookingRequests();
  }
}
