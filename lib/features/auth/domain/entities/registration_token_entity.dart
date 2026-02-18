import 'package:equatable/equatable.dart';

/// Registration token entity (after OTP verification and subsequent steps)
class RegistrationTokenEntity extends Equatable {

  const RegistrationTokenEntity({
    required this.message,
    required this.registrationToken,
  });
  final String message;
  final String registrationToken;

  @override
  List<Object?> get props => <Object?>[message, registrationToken];
}
