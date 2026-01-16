import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/base/base_state.dart';
import '../../domain/entities/vendor_registration.dart';
import '../../domain/entities/vendor_document.dart';
import '../../domain/entities/vendor_portfolio.dart';
import '../../domain/entities/bank_details.dart';
import '../../domain/entities/registration_status.dart';
import '../../domain/usecases/register_vendor_usecase.dart';
import '../../domain/usecases/upload_vendor_documents_usecase.dart';
import '../../domain/usecases/upload_portfolio_usecase.dart';
import '../../domain/usecases/add_bank_details_usecase.dart';
import '../../domain/usecases/check_vendor_status_usecase.dart';
import '../../domain/usecases/get_vendor_profile_usecase.dart';
import '../../domain/usecases/update_vendor_profile_usecase.dart';
import '../../domain/usecases/delete_portfolio_usecase.dart';

// State for vendor registration
class VendorRegistrationState {
  final BaseState<VendorRegistrationResponse> registrationState;
  final BaseState<RegistrationStatus> statusState;
  final BaseState<VendorRegistrationProfile> profileState;

  VendorRegistrationState({
    required this.registrationState,
    required this.statusState,
    required this.profileState,
  });

  VendorRegistrationState copyWith({
    BaseState<VendorRegistrationResponse>? registrationState,
    BaseState<RegistrationStatus>? statusState,
    BaseState<VendorRegistrationProfile>? profileState,
  }) {
    return VendorRegistrationState(
      registrationState: registrationState ?? this.registrationState,
      statusState: statusState ?? this.statusState,
      profileState: profileState ?? this.profileState,
    );
  }
}

class VendorRegistrationViewModel
    extends StateNotifier<VendorRegistrationState> {
  final RegisterVendorUseCase _registerVendorUseCase;
  final UploadVendorDocumentsUseCase _uploadVendorDocumentsUseCase;
  final UploadPortfolioUseCase _uploadPortfolioUseCase;
  final AddBankDetailsUseCase _addBankDetailsUseCase;
  final CheckVendorStatusUseCase _checkVendorStatusUseCase;
  final GetVendorProfileUseCase _getVendorProfileUseCase;
  final UpdateVendorProfileUseCase _updateVendorProfileUseCase;
  final DeletePortfolioUseCase _deletePortfolioUseCase;

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

  /// Register as vendor
  Future<void> registerVendor({
    required VendorRegistrationRequest request,
  }) async {
    state = state.copyWith(
      registrationState: const BaseState.loading(),
    );

    final result = await _registerVendorUseCase(request: request);

    result.fold(
      (failure) => state = state.copyWith(
        registrationState: BaseState.error(failure),
      ),
      (response) => state = state.copyWith(
        registrationState: BaseState.success(response),
      ),
    );
  }

  /// Upload documents
  Future<VendorDocument?> uploadDocuments({
    required UploadDocumentRequest request,
  }) async {
    final result = await _uploadVendorDocumentsUseCase(request: request);

    return result.fold(
      (failure) => null,
      (document) => document,
    );
  }

  /// Upload portfolio
  Future<VendorPortfolio?> uploadPortfolio({
    required UploadPortfolioRequest request,
  }) async {
    final result = await _uploadPortfolioUseCase(request: request);

    return result.fold(
      (failure) => null,
      (portfolio) => portfolio,
    );
  }

  /// Add bank details
  Future<BankDetailsResponse?> addBankDetails({
    required BankDetailsRequest request,
  }) async {
    final result = await _addBankDetailsUseCase(request: request);

    return result.fold(
      (failure) => null,
      (bankDetails) => bankDetails,
    );
  }

  /// Check registration status
  Future<void> checkStatus() async {
    state = state.copyWith(
      statusState: const BaseState.loading(),
    );

    final result = await _checkVendorStatusUseCase();

    result.fold(
      (failure) => state = state.copyWith(
        statusState: BaseState.error(failure),
      ),
      (status) => state = state.copyWith(
        statusState: BaseState.success(status),
      ),
    );
  }

  /// Get vendor profile
  Future<void> getProfile() async {
    state = state.copyWith(
      profileState: const BaseState.loading(),
    );

    final result = await _getVendorProfileUseCase();

    result.fold(
      (failure) => state = state.copyWith(
        profileState: BaseState.error(failure),
      ),
      (profile) => state = state.copyWith(
        profileState: BaseState.success(profile),
      ),
    );
  }

  /// Update vendor profile
  Future<bool> updateProfile({
    required Map<String, dynamic> profileData,
  }) async {
    final result = await _updateVendorProfileUseCase(
      profileData: profileData,
    );

    return result.fold(
      (failure) => false,
      (profile) {
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
    final result = await _deletePortfolioUseCase(
      portfolioId: portfolioId,
    );

    return result.fold(
      (failure) => false,
      (_) {
        // Refresh profile after deletion
        getProfile();
        return true;
      },
    );
  }

  /// Refresh all
  Future<void> refreshAll() async {
    await Future.wait([
      checkStatus(),
      getProfile(),
    ]);
  }
}
