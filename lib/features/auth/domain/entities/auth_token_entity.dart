import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token_entity.freezed.dart';

/// Auth token entity - domain layer
@freezed
class AuthTokenEntity with _$AuthTokenEntity {
  const factory AuthTokenEntity({
    required String token,
    required String userId,
    required String email,
    required String role,
  }) = _AuthTokenEntity;
}
