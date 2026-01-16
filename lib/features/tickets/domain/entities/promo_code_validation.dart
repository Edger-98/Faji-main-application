import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_code_validation.freezed.dart';
part 'promo_code_validation.g.dart';

/// Promo Code Validation Response - matches API spec
@freezed
class PromoCodeValidation with _$PromoCodeValidation {
  const factory PromoCodeValidation({
    required bool valid,
    String? code,
    String? discountType,
    double? discountValue,
    double? discountAmount,
    String? expiresAt,
    int? remainingUses,
  }) = _PromoCodeValidation;

  factory PromoCodeValidation.fromJson(Map<String, dynamic> json) =>
      _$PromoCodeValidationFromJson(json);
}
