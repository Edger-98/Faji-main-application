import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_registration.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_document.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_portfolio.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/bank_details.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/registration_status.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/register_vendor_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/upload_vendor_documents_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/upload_portfolio_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/add_bank_details_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/check_vendor_status_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/get_vendor_profile_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/update_vendor_profile_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/delete_portfolio_usecase.dart';

// State for vendor registration
class VendorRegistrationState {

  VendorRegistrationState({
    required this.registrationState,
    required this.statusState,
    required this.profileState,
  });
  final BaseState<VendorRegistrationResponse> registrationState;
  final BaseState<RegistrationStatus> statusState;
  final BaseState<VendorRegistrationProfile> profileState;

  VendorRegistrationState copyWith({
    BaseState<VendorRegistrationResponse>? registrationState,
    BaseState<RegistrationStatus>? statusState,
    BaseState<VendorRegistrationProfile>? profileState,
  }) => VendorRegistrationState(
      registrationState: registrationState ?? this.registrationState,
      statusState: statusState ?? this.statusState,
      profileState: profileState ?? this.profileState,
    );
}

class VendorRegistrationViewModel
    extends StateNotifier<VendorRegistrationState> {

  VendorRegistrationViewModel(
    this._registerVendorUseCase,
    this._uploadVendorDocumentsUseCase,
    this._uploadPortfolioUseCase,
    this._addBankDetailsUseCase,
    this._checkVendorStatusUseCase,
    this._getVendorProfileUseCase,
    this._updateVendorProfileUseCase,
    this._deletePortfolioUseCase,
  ) : super(VendorRegistrationState(
          registrationState: const BaseState.initial(),
          statusState: const BaseState.initial(),
          profileState: const BaseState.initial(),
        ));
  final RegisterVendorUseCase _registerVendorUseCase;
  final UploadVendorDocumentsUseCase _uploadVendorDocumentsUseCase;
  final UploadPortfolioUseCase _uploadPortfolioUseCase;
  final AddBankDetailsUseCase _addBankDetailsUseCase;
  final CheckVendorStatusUseCase _checkVendorStatusUseCase;
  final GetVendorProfileUseCase _getVendorProfileUseCase;
  final UpdateVendorProfileUseCase _updateVendorProfileUseCase;
  final DeletePortfolioUseCase _deletePortfolioUseCase;

  /// Register as vendor
  Future<void> registerVendor({
    required VendorRegistrationRequest request,
  }) async {
    state = state.copyWith(
      registrationState: const BaseState.loading(),
    );

    final Either<Failure, VendorRegistrationResponse> result = await _registerVendorUseCase(request: request);

    result.fold(
      (Failure failure) => state = state.copyWith(
        registrationState: BaseState.error(failure),
      ),
      (VendorRegistrationResponse response) => state = state.copyWith(
        registrationState: BaseState.success(response),
      ),
    );
  }

  /// Upload documents
  Future<VendorDocument?> uploadDocuments({
    required UploadDocumentRequest request,
  }) async {
    final Either<Failure, VendorDocument> result = await _uploadVendorDocumentsUseCase(request: request);

    return result.fold(
      (Failure failure) => null,
      (VendorDocument document) => document,
    );
  }

  /// Upload portfolio
  Future<VendorPortfolio?> uploadPortfolio({
    required UploadPortfolioRequest request,
  }) async {
    final Either<Failure, VendorPortfolio> result = await _uploadPortfolioUseCase(request: request);

    return result.fold(
      (Failure failure) => null,
      (VendorPortfolio portfolio) => portfolio,
    );
  }

  /// Add bank details
  Future<BankDetailsResponse?> addBankDetails({
    required BankDetailsRequest request,
  }) async {
    final Either<Failure, BankDetailsResponse> result = await _addBankDetailsUseCase(request: request);

    return result.fold(
      (Failure failure) => null,
      (BankDetailsResponse bankDetails) => bankDetails,
    );
  }

  /// Check registration status
  Future<void> checkStatus() async {
    state = state.copyWith(
      statusState: const BaseState.loading(),
    );

    final Either<Failure, RegistrationStatus> result = await _checkVendorStatusUseCase();

    result.fold(
      (Failure failure) => state = state.copyWith(
        statusState: BaseState.error(failure),
      ),
      (RegistrationStatus status) => state = state.copyWith(
        statusState: BaseState.success(status),
      ),
    );
  }

  /// Get vendor profile
  Future<void> getProfile() async {
    state = state.copyWith(
      profileState: const BaseState.loading(),
    );

    final Either<Failure, VendorRegistrationProfile> result = await _getVendorProfileUseCase();

    result.fold(
      (Failure failure) => state = state.copyWith(
        profileState: BaseState.error(failure),
      ),
      (VendorRegistrationProfile profile) => state = state.copyWith(
        profileState: BaseState.success(profile),
      ),
    );
  }

  /// Update vendor profile
  Future<bool> updateProfile({
    required Map<String, dynamic> profileData,
  }) async {
    final Either<Failure, VendorRegistrationProfile> result = await _updateVendorProfileUseCase(
      profileData: profileData,
    );

    return result.fold(
      (Failure failure) => false,
      (VendorRegistrationProfile profile) {
        // Update state with new profile
        state = state.copyWith(
          profileState: BaseState.success(profile),
        );
        return true;
      },
    );
  }

  /// Delete portfolio item
  Future<bool> deletePortfolio({
    required String portfolioId,
  }) async {
    final Either<Failure, void> result = await _deletePortfolioUseCase(
      portfolioId: portfolioId,
    );

    return result.fold(
      (Failure failure) => false,
      (_) {
        // Refresh profile after deletion
        getProfile();
        return true;
      },
    );
  }

  /// Refresh all
  Future<void> refreshAll() async {
    await Future.wait(<Future<void>>[
      checkStatus(),
      getProfile(),
    ]);
  }
}
