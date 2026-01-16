import 'package:freezed_annotation/freezed_annotation.dart';

part 'topup_request.freezed.dart';
part 'topup_request.g.dart';

/// Top-up Request - matches API spec
@freezed
class TopupRequest with _$TopupRequest {
  const factory TopupRequest({
    required double amount,
    required String paymentMethod,
  }) = _TopupRequest;

  factory TopupRequest.fromJson(Map<String, dynamic> json) =>
      _$TopupRequestFromJson(json);
}

@freezed
class TopupResponse with _$TopupResponse {
  const factory TopupResponse({
    required String topupId,
    required double amount,
    required String currency,
    required String paymentUrl,
    required String reference,
  }) = _TopupResponse;

  factory TopupResponse.fromJson(Map<String, dynamic> json) =>
      _$TopupResponseFromJson(json);
}
