import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_complete_entity.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_session_entity.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_token_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/add_name_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/add_phone_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/complete_registration_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/register_email_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/verify_registration_otp_usecase.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';

/// Registration state
class RegistrationState {

  const RegistrationState({
    this.email,
    this.sessionId,
    this.registrationToken,
    this.phoneNo,
    this.firstName,
    this.lastName,
    this.currentStep = 1,
    this.stepState = const BaseState.initial(),
  });
  final String? email;
  final String? sessionId;
  final String? registrationToken;
  final String? phoneNo;
  final String? firstName;
  final String? lastName;
  final int currentStep; // 1-5
  final BaseState<dynamic> stepState;

  RegistrationState copyWith({
    String? email,
    String? sessionId,
    String? registrationToken,
    String? phoneNo,
    String? firstName,
    String? lastName,
    int? currentStep,
    BaseState<dynamic>? stepState,
  }) => RegistrationState(
      email: email ?? this.email,
      sessionId: sessionId ?? this.sessionId,
      registrationToken: registrationToken ?? this.registrationToken,
      phoneNo: phoneNo ?? this.phoneNo,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      currentStep: currentStep ?? this.currentStep,
      stepState: stepState ?? this.stepState,
    );
}

/// Registration ViewModel
class RegistrationViewModel extends StateNotifier<RegistrationState> {

  RegistrationViewModel(
    this._registerEmailUseCase,
    this._verifyOtpUseCase,
    this._addPhoneUseCase,
    this._addNameUseCase,
    this._completeRegistrationUseCase,
  ) : super(const RegistrationState());
  final RegisterEmailUseCase _registerEmailUseCase;
  final VerifyRegistrationOtpUseCase _verifyOtpUseCase;
  final AddPhoneUseCase _addPhoneUseCase;
  final AddNameUseCase _addNameUseCase;
  final CompleteRegistrationUseCase _completeRegistrationUseCase;

  /// Step 1: Register email
  Future<void> registerEmail(String email) async {
    state = state.copyWith(stepState: const BaseState.loading());

    final Either<Failure, RegistrationSessionEntity> result = await _registerEmailUseCase(email: email);

    result.fold(
      (Failure failure) {
        state = state.copyWith(stepState: BaseState.error(failure));
      },
      (RegistrationSessionEntity session) {
        state = state.copyWith(
          email: email,
          sessionId: session.sessionId,
          currentStep: 2,
          stepState: BaseState.success(session),
        );
      },
    );
  }

  /// Step 2: Verify OTP
  Future<void> verifyOtp(String otp) async {
    if (state.email == null || state.sessionId == null) {
      state = state.copyWith(
        stepState: const BaseState.error(
          ServerFailure(message: 'Email or session ID missing'),
        ),
      );
      return;
    }

    state = state.copyWith(stepState: const BaseState.loading());

    final Either<Failure, RegistrationTokenEntity> result = await _verifyOtpUseCase(
      email: state.email!,
      otp: otp,
      sessionId: state.sessionId!,
    );

    result.fold(
      (Failure failure) {
        state = state.copyWith(stepState: BaseState.error(failure));
      },
      (RegistrationTokenEntity token) {
        state = state.copyWith(
          registrationToken: token.registrationToken,
          currentStep: 3,
          stepState: BaseState.success(token),
        );
      },
    );
  }

  /// Step 3: Add phone number
  Future<void> addPhone(String phoneNo) async {
    if (state.registrationToken == null) {
      state = state.copyWith(
        stepState: const BaseState.error(
          ServerFailure(message: 'Registration token missing'),
        ),
      );
      return;
    }

    state = state.copyWith(stepState: const BaseState.loading());

    final Either<Failure, RegistrationTokenEntity> result = await _addPhoneUseCase(
      phoneNo: phoneNo,
      registrationToken: state.registrationToken!,
    );

    result.fold(
      (Failure failure) {
        state = state.copyWith(stepState: BaseState.error(failure));
      },
      (RegistrationTokenEntity token) {
        state = state.copyWith(
          phoneNo: phoneNo,
          registrationToken: token.registrationToken, // Update token
          currentStep: 4,
          stepState: BaseState.success(token),
        );
      },
    );
  }

  /// Step 4: Add name
  Future<void> addName(String firstName, String lastName) async {
    if (state.registrationToken == null) {
      state = state.copyWith(
        stepState: const BaseState.error(
          ServerFailure(message: 'Registration token missing'),
        ),
      );
      return;
    }

    state = state.copyWith(stepState: const BaseState.loading());

    final Either<Failure, RegistrationTokenEntity> result = await _addNameUseCase(
      firstName: firstName,
      lastName: lastName,
      registrationToken: state.registrationToken!,
    );

    result.fold(
      (Failure failure) {
        state = state.copyWith(stepState: BaseState.error(failure));
      },
      (RegistrationTokenEntity token) {
        state = state.copyWith(
          firstName: firstName,
          lastName: lastName,
          registrationToken: token.registrationToken, // Update token
          currentStep: 5,
          stepState: BaseState.success(token),
        );
      },
    );
  }

  /// Step 5: Complete registration
  Future<void> completeRegistration(String password, String role) async {
    if (state.registrationToken == null) {
      state = state.copyWith(
        stepState: const BaseState.error(
          ServerFailure(message: 'Registration token missing'),
        ),
      );
      return;
    }

    state = state.copyWith(stepState: const BaseState.loading());

    final Either<Failure, RegistrationCompleteEntity> result = await _completeRegistrationUseCase(
      password: password,
      role: role,
      registrationToken: state.registrationToken!,
    );

    result.fold(
      (Failure failure) {
        state = state.copyWith(stepState: BaseState.error(failure));
      },
      (RegistrationCompleteEntity complete) {
        state = state.copyWith(
          stepState: BaseState.success(complete),
        );
      },
    );
  }

  /// Reset registration state
  void reset() {
    state = const RegistrationState();
  }

  /// Go back to previous step
  void goBack() {
    if (state.currentStep > 1) {
      state = state.copyWith(
        currentStep: state.currentStep - 1,
        stepState: const BaseState.initial(),
      );
    }
  }
}

/// Registration ViewModel Provider
final StateNotifierProvider<RegistrationViewModel, RegistrationState> registrationViewModelProvider =
    StateNotifierProvider<RegistrationViewModel, RegistrationState>((StateNotifierProviderRef<RegistrationViewModel, RegistrationState> ref) {
  final RegisterEmailUseCase registerEmailUseCase = ref.watch(registerEmailUseCaseProvider);
  final VerifyRegistrationOtpUseCase verifyOtpUseCase = ref.watch(verifyRegistrationOtpUseCaseProvider);
  final AddPhoneUseCase addPhoneUseCase = ref.watch(addPhoneUseCaseProvider);
  final AddNameUseCase addNameUseCase = ref.watch(addNameUseCaseProvider);
  final CompleteRegistrationUseCase completeRegistrationUseCase = ref.watch(completeRegistrationUseCaseProvider);

  return RegistrationViewModel(
    registerEmailUseCase,
    verifyOtpUseCase,
    addPhoneUseCase,
    addNameUseCase,
    completeRegistrationUseCase,
  );
});
