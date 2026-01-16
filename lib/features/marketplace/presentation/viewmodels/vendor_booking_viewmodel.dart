import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/base/base_state.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/counter_offer.dart';
import '../../domain/usecases/get_booking_requests_usecase.dart';
import '../../domain/usecases/accept_booking_usecase.dart';
import '../../domain/usecases/decline_booking_usecase.dart';
import '../../domain/usecases/send_counter_offer_usecase.dart';
import '../../domain/usecases/update_booking_usecase.dart';

// State for vendor bookings
typedef VendorBookingState = BaseState<BookingsResponse>;

class VendorBookingViewModel extends StateNotifier<VendorBookingState> {
  final GetBookingRequestsUseCase _getBookingRequestsUseCase;
  final AcceptBookingUseCase _acceptBookingUseCase;
  final DeclineBookingUseCase _declineBookingUseCase;
  final SendCounterOfferUseCase _sendCounterOfferUseCase;
  final UpdateBookingUseCase _updateBookingUseCase;

  VendorBookingViewModel(
    this._getBookingRequestsUseCase,
    this._acceptBookingUseCase,
    this._declineBookingUseCase,
    this._sendCounterOfferUseCase,
    this._updateBookingUseCase,
  ) : super(const BaseState.initial());

  /// Get booking requests (vendor side)
  Future<void> getBookingRequests({
    String? status,
  }) async {
    state = const BaseState.loading();

    final result = await _getBookingRequestsUseCase(
      status: status,
    );

    result.fold(
      (failure) => state = BaseState.error(failure),
      (bookings) => state = BaseState.success(bookings),
    );
  }

  /// Accept booking
  Future<Booking?> acceptBooking({
    required String bookingId,
    double? agreedPrice,
  }) async {
    final result = await _acceptBookingUseCase(
      bookingId: bookingId,
      agreedPrice: agreedPrice,
    );

    return result.fold(
      (failure) => null,
      (booking) => booking,
    );
  }

  /// Decline booking
  Future<bool> declineBooking({
    required String bookingId,
    String? reason,
  }) async {
    final result = await _declineBookingUseCase(
      bookingId: bookingId,
      reason: reason,
    );

    return result.fold(
      (failure) => false,
      (booking) => true,
    );
  }

  /// Send counter offer
  Future<CounterOfferResponse?> sendCounterOffer({
    required String bookingId,
    required double counterPrice,
    String? message,
  }) async {
    final request = CounterOfferRequest(
      counterPrice: counterPrice,
      message: message,
    );

    final result = await _sendCounterOfferUseCase(
      bookingId: bookingId,
      request: request,
    );

    return result.fold(
      (failure) => null,
      (response) => response,
    );
  }

  /// Update booking status
  Future<bool> updateBooking({
    required String bookingId,
    required String status,
  }) async {
    final request = UpdateBookingRequest(status: status);

    final result = await _updateBookingUseCase(
      bookingId: bookingId,
      request: request,
    );

    return result.fold(
      (failure) => false,
      (booking) => true,
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
