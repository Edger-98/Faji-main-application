import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_offer.freezed.dart';
part 'counter_offer.g.dart';

/// Counter Offer - matches API spec
@freezed
class CounterOfferRequest with _$CounterOfferRequest {
  const factory CounterOfferRequest({
    required double counterPrice,
    String? message,
  }) = _CounterOfferRequest;

  factory CounterOfferRequest.fromJson(Map<String, dynamic> json) =>
      _$CounterOfferRequestFromJson(json);
}

@freezed
class CounterOfferResponse with _$CounterOfferResponse {
  const factory CounterOfferResponse({
    required String id,
    required String status,
    required double counterPrice,
    required String updatedAt, String? message,
  }) = _CounterOfferResponse;

  factory CounterOfferResponse.fromJson(Map<String, dynamic> json) =>
      _$CounterOfferResponseFromJson(json);
}
