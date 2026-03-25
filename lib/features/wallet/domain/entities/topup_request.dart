import 'package:freezed_annotation/freezed_annotation.dart';

part 'topup_request.freezed.dart';
part 'topup_request.g.dart';

/// Fund wallet request - POST /wallet/fund
@freezed
class TopupRequest with _$TopupRequest {
  const factory TopupRequest({
    required double amount,
  }) = _TopupRequest;

  factory TopupRequest.fromJson(Map<String, dynamic> json) =>
      _$TopupRequestFromJson(json);
}

/// Fund wallet response - returns Stripe payment sheet data
@freezed
class TopupResponse with _$TopupResponse {
  const factory TopupResponse({
    required String paymentIntentClientSecret,
    required String ephemeralKey,
    required String customerId,
    required String publishableKey,
    required double amount,
    required String currency,
    required String transactionId,
  }) = _TopupResponse;

  factory TopupResponse.fromJson(Map<String, dynamic> json) =>
      _$TopupResponseFromJson(json);
}
