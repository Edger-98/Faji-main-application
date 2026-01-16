import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_cohost_response.freezed.dart';
part 'remove_cohost_response.g.dart';

/// Remove Co-Host Response - matches API spec
@freezed
class RemoveCohostResponse with _$RemoveCohostResponse {
  const factory RemoveCohostResponse({
    required bool success,
    required String message,
  }) = _RemoveCohostResponse;

  factory RemoveCohostResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveCohostResponseFromJson(json);
}
