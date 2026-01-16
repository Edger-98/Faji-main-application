import 'package:freezed_annotation/freezed_annotation.dart';

part 'refund_response.freezed.dart';
part 'refund_response.g.dart';

/// Refund Response - matches API spec
@freezed
class RefundResponse with _$RefundResponse {
  const factory RefundResponse({
    required bool success,
    required String message,
    required RefundResult refundResult,
  }) = _RefundResponse;

  factory RefundResponse.fromJson(Map<String, dynamic> json) =>
      _$RefundResponseFromJson(json);
}

@freezed
class RefundResult with _$RefundResult {
  const factory RefundResult({
    required int refunded,
    required double totalAmount,
    required List<RefundDetail> refunds,
  }) = _RefundResult;

  factory RefundResult.fromJson(Map<String, dynamic> json) =>
      _$RefundResultFromJson(json);
}

@freezed
class RefundDetail with _$RefundDetail {
  const factory RefundDetail({
    required String userId,
    required double amount,
    required String orderId,
  }) = _RefundDetail;

  factory RefundDetail.fromJson(Map<String, dynamic> json) =>
      _$RefundDetailFromJson(json);
}
