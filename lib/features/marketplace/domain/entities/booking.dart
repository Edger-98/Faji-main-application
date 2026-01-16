import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

/// Booking entity - matches API spec
@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String eventId,
    String? eventName,
    required String hostId,
    String? hostName,
    required String vendorId,
    String? vendorName,
    required String resourceId,
    String? resourceTitle,
    required String status,
    required String paymentOption,
    double? offeredPrice,
    double? agreedPrice,
    double? percentageSplit,
    String? message,
    String? eventDate,
    String? escrowStatus,
    required String createdAt,
    required String updatedAt,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
}

@freezed
class CreateBookingRequest with _$CreateBookingRequest {
  const factory CreateBookingRequest({
    required String eventId,
    required String vendorId,
    required String resourceId,
    required String paymentOption,
    double? offeredPrice,
    double? percentageSplit,
    String? message,
    String? eventDate,
  }) = _CreateBookingRequest;

  factory CreateBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingRequestFromJson(json);
}

@freezed
class BookingsResponse with _$BookingsResponse {
  const factory BookingsResponse({
    required List<Booking> bookings,
  }) = _BookingsResponse;

  factory BookingsResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingsResponseFromJson(json);
}

@freezed
class AcceptBookingRequest with _$AcceptBookingRequest {
  const factory AcceptBookingRequest({
    double? agreedPrice,
  }) = _AcceptBookingRequest;

  factory AcceptBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$AcceptBookingRequestFromJson(json);
}

@freezed
class DeclineBookingRequest with _$DeclineBookingRequest {
  const factory DeclineBookingRequest({
    String? reason,
  }) = _DeclineBookingRequest;

  factory DeclineBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$DeclineBookingRequestFromJson(json);
}

@freezed
class UpdateBookingRequest with _$UpdateBookingRequest {
  const factory UpdateBookingRequest({
    String? status,
  }) = _UpdateBookingRequest;

  factory UpdateBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateBookingRequestFromJson(json);
}
