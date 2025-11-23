import 'package:equatable/equatable.dart';

/// Registration session entity (after email registration)
class RegistrationSessionEntity extends Equatable {
  final String message;
  final String sessionId;

  const RegistrationSessionEntity({
    required this.message,
    required this.sessionId,
  });

  @override
  List<Object?> get props => [message, sessionId];
}
