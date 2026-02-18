import 'package:equatable/equatable.dart';
import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';

/// Registration complete entity (final step)
class RegistrationCompleteEntity extends Equatable {

  const RegistrationCompleteEntity({
    required this.message,
    required this.token,
    required this.userId,
    required this.user,
  });
  final String message;
  final String token;
  final String userId;
  final UserEntity user;

  @override
  List<Object?> get props => <Object?>[message, token, userId, user];
}
