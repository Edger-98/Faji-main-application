import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// Generic API response wrapper
@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    @Default(true) bool success,
    @Default('') String message,
    T? data,
    Map<String, dynamic>? errors,
    Map<String, dynamic>? meta,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
  
  /// Create ApiResponse from direct data (when API returns data without wrapper)
  factory ApiResponse.fromDirectData(T data) => ApiResponse(
        success: true,
        message: 'Success',
        data: data,
      );
}

/// Paginated response wrapper
@Freezed(genericArgumentFactories: true)
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    required List<T> data,
    required int currentPage,
    required int lastPage,
    required int perPage,
    required int total,
  }) = _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);
}
