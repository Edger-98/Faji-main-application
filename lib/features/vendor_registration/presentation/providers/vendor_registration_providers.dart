import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/features/vendor_registration/data/datasources/vendor_registration_remote_datasource.dart';
import 'package:fajimobileapp/features/vendor_registration/data/repositories/vendor_registration_repository_impl.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/repositories/vendor_registration_repository.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/register_vendor_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/upload_vendor_documents_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/upload_portfolio_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/add_bank_details_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/check_vendor_status_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/get_vendor_profile_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/update_vendor_profile_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/usecases/delete_portfolio_usecase.dart';
import 'package:fajimobileapp/features/vendor_registration/presentation/viewmodels/vendor_registration_viewmodel.dart';

// Data Source Provider
final Provider<VendorRegistrationRemoteDataSource> vendorRegistrationRemoteDataSourceProvider =
    Provider<VendorRegistrationRemoteDataSource>((ProviderRef<VendorRegistrationRemoteDataSource> ref) {
  final dio = ref.watch(dioProvider);
  return VendorRegistrationRemoteDataSource(dio);
});

// Repository Provider
final Provider<VendorRegistrationRepository> vendorRegistrationRepositoryProvider =
    Provider<VendorRegistrationRepository>((ProviderRef<VendorRegistrationRepository> ref) {
  final VendorRegistrationRemoteDataSource remoteDataSource = ref.watch(vendorRegistrationRemoteDataSourceProvider);
  return VendorRegistrationRepositoryImpl(remoteDataSource);
});

// Use Case Providers
final Provider<RegisterVendorUseCase> registerVendorUseCaseProvider = Provider<RegisterVendorUseCase>((ProviderRef<RegisterVendorUseCase> ref) {
  final VendorRegistrationRepository repository = ref.watch(vendorRegistrationRepositoryProvider);
  return RegisterVendorUseCase(repository);
});

final Provider<UploadVendorDocumentsUseCase> uploadVendorDocumentsUseCaseProvider =
    Provider<UploadVendorDocumentsUseCase>((ProviderRef<UploadVendorDocumentsUseCase> ref) {
  final VendorRegistrationRepository repository = ref.watch(vendorRegistrationRepositoryProvider);
  return UploadVendorDocumentsUseCase(repository);
});

final Provider<UploadPortfolioUseCase> uploadPortfolioUseCaseProvider = Provider<UploadPortfolioUseCase>((ProviderRef<UploadPortfolioUseCase> ref) {
  final VendorRegistrationRepository repository = ref.watch(vendorRegistrationRepositoryProvider);
  return UploadPortfolioUseCase(repository);
});

final Provider<AddBankDetailsUseCase> addBankDetailsUseCaseProvider = Provider<AddBankDetailsUseCase>((ProviderRef<AddBankDetailsUseCase> ref) {
  final VendorRegistrationRepository repository = ref.watch(vendorRegistrationRepositoryProvider);
  return AddBankDetailsUseCase(repository);
});

final Provider<CheckVendorStatusUseCase> checkVendorStatusUseCaseProvider =
    Provider<CheckVendorStatusUseCase>((ProviderRef<CheckVendorStatusUseCase> ref) {
  final VendorRegistrationRepository repository = ref.watch(vendorRegistrationRepositoryProvider);
  return CheckVendorStatusUseCase(repository);
});

final Provider<GetVendorProfileUseCase> getVendorProfileUseCaseProvider =
    Provider<GetVendorProfileUseCase>((ProviderRef<GetVendorProfileUseCase> ref) {
  final VendorRegistrationRepository repository = ref.watch(vendorRegistrationRepositoryProvider);
  return GetVendorProfileUseCase(repository);
});

final Provider<UpdateVendorProfileUseCase> updateVendorProfileUseCaseProvider =
    Provider<UpdateVendorProfileUseCase>((ProviderRef<UpdateVendorProfileUseCase> ref) {
  final VendorRegistrationRepository repository = ref.watch(vendorRegistrationRepositoryProvider);
  return UpdateVendorProfileUseCase(repository);
});

final Provider<DeletePortfolioUseCase> deletePortfolioUseCaseProvider = Provider<DeletePortfolioUseCase>((ProviderRef<DeletePortfolioUseCase> ref) {
  final VendorRegistrationRepository repository = ref.watch(vendorRegistrationRepositoryProvider);
  return DeletePortfolioUseCase(repository);
});

// ViewModel Provider
final AutoDisposeStateNotifierProvider<VendorRegistrationViewModel, VendorRegistrationState> vendorRegistrationViewModelProvider = StateNotifierProvider.autoDispose<
    VendorRegistrationViewModel, VendorRegistrationState>((AutoDisposeStateNotifierProviderRef<VendorRegistrationViewModel, VendorRegistrationState> ref) {
  final RegisterVendorUseCase registerUseCase = ref.watch(registerVendorUseCaseProvider);
  final UploadVendorDocumentsUseCase uploadDocumentsUseCase = ref.watch(uploadVendorDocumentsUseCaseProvider);
  final UploadPortfolioUseCase uploadPortfolioUseCase = ref.watch(uploadPortfolioUseCaseProvider);
  final AddBankDetailsUseCase addBankDetailsUseCase = ref.watch(addBankDetailsUseCaseProvider);
  final CheckVendorStatusUseCase checkStatusUseCase = ref.watch(checkVendorStatusUseCaseProvider);
  final GetVendorProfileUseCase getProfileUseCase = ref.watch(getVendorProfileUseCaseProvider);
  final UpdateVendorProfileUseCase updateProfileUseCase = ref.watch(updateVendorProfileUseCaseProvider);
  final DeletePortfolioUseCase deletePortfolioUseCase = ref.watch(deletePortfolioUseCaseProvider);

  return VendorRegistrationViewModel(
    registerUseCase,
    uploadDocumentsUseCase,
    uploadPortfolioUseCase,
    addBankDetailsUseCase,
    checkStatusUseCase,
    getProfileUseCase,
    updateProfileUseCase,
    deletePortfolioUseCase,
  );
});
