import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_details.freezed.dart';
part 'bank_details.g.dart';

/// Bank Details - matches API spec
@freezed
class BankDetailsRequest with _$BankDetailsRequest {
  const factory BankDetailsRequest({
    required String accountNumber,
    required String bankCode,
    required String accountName,
  }) = _BankDetailsRequest;

  factory BankDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$BankDetailsRequestFromJson(json);
}

@freezed
class BankDetailsResponse with _$BankDetailsResponse {
  const factory BankDetailsResponse({
    required String accountNumber,
    required String bankCode,
    required String accountName,
    required String bankName,
    required bool isVerified,
  }) = _BankDetailsResponse;

  factory BankDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$BankDetailsResponseFromJson(json);
}
