import 'package:equatable/equatable.dart';

/// Registration token entity (after OTP verification and subsequent steps)
class RegistrationTokenEntity extends Equatable {
  final String message;
  final String registrationToken;

  const RegistrationTokenEntity({
    required this.message,
    required this.registrationToken,
  });

  @override
  List<Object?> get props => [message, registrationToken];
}
