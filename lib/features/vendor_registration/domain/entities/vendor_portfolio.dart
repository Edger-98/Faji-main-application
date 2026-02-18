import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_portfolio.freezed.dart';
part 'vendor_portfolio.g.dart';

/// Vendor Portfolio - matches API spec
@freezed
class VendorPortfolio with _$VendorPortfolio {
  const factory VendorPortfolio({
    required String id,
    required String imageUrl,
    required String uploadedAt, String? caption,
  }) = _VendorPortfolio;

  factory VendorPortfolio.fromJson(Map<String, dynamic> json) =>
      _$VendorPortfolioFromJson(json);
}

@freezed
class UploadPortfolioRequest with _$UploadPortfolioRequest {
  const factory UploadPortfolioRequest({
    required String imageUrl,
    String? caption,
  }) = _UploadPortfolioRequest;

  factory UploadPortfolioRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadPortfolioRequestFromJson(json);
}
