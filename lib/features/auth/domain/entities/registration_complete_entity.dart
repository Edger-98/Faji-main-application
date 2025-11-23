import 'package:equatable/equatable.dart';
import 'user_entity.dart';

/// Registration complete entity (final step)
class RegistrationCompleteEntity extends Equatable {
  final String message;
  final String token;
  final String userId;
  final UserEntity user;

  const RegistrationCompleteEntity({
    required this.message,
    required this.token,
    required this.userId,
    required this.user,
  });

  @override
  List<Object?> get props => [message, token, userId, user];
}
