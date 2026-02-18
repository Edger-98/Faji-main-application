import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_request.freezed.dart';
part 'check_in_request.g.dart';

/// Check-In Request - matches API spec
@freezed
class CheckInRequest with _$CheckInRequest {
  const factory CheckInRequest({
    required String ticketId,
    required String eventId,
    LocationData? location,
  }) = _CheckInRequest;

  factory CheckInRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckInRequestFromJson(json);
}

extension CheckInRequestX on CheckInRequest {
  Map<String, dynamic> toJson() => <String, dynamic>{
        'ticketId': ticketId,
        'eventId': eventId,
        if (location != null) 'location': location!.toJson(),
      };
}

@freezed
class LocationData with _$LocationData {
  const factory LocationData({
    required double latitude,
    required double longitude,
    double? accuracy,
  }) = _LocationData;

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);
}

extension LocationDataX on LocationData {
  Map<String, dynamic> toJson() => <String, dynamic>{
        'latitude': latitude,
        'longitude': longitude,
        if (accuracy != null) 'accuracy': accuracy,
      };
}

/// Check-In Response - matches API spec
@freezed
class CheckInResponse with _$CheckInResponse {
  const factory CheckInResponse({
    required bool checkedIn,
    required String checkedInAt,
    required EventVerification eventVerification,
  }) = _CheckInResponse;

  factory CheckInResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckInResponseFromJson(json);
}

@freezed
class EventVerification with _$EventVerification {
  const factory EventVerification({
    required int checkInPercentage,
    required bool isVerified,
    String? verifiedAt,
  }) = _EventVerification;

  factory EventVerification.fromJson(Map<String, dynamic> json) =>
      _$EventVerificationFromJson(json);
}
