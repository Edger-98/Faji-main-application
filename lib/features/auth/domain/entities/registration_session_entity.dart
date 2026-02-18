import 'package:equatable/equatable.dart';

/// Registration session entity (after email registration)
class RegistrationSessionEntity extends Equatable {

  const RegistrationSessionEntity({
    required this.message,
    required this.sessionId,
  });
  final String message;
  final String sessionId;

  @override
  List<Object?> get props => <Object?>[message, sessionId];
}
