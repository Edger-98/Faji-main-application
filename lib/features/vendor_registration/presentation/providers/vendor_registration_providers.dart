import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../../data/datasources/vendor_registration_remote_datasource.dart';
import '../../data/repositories/vendor_registration_repository_impl.dart';
import '../../domain/repositories/vendor_registration_repository.dart';
import '../../domain/usecases/register_vendor_usecase.dart';
import '../../domain/usecases/upload_vendor_documents_usecase.dart';
import '../../domain/usecases/upload_portfolio_usecase.dart';
import '../../domain/usecases/add_bank_details_usecase.dart';
import '../../domain/usecases/check_vendor_status_usecase.dart';
import '../../domain/usecases/get_vendor_profile_usecase.dart';
import '../../domain/usecases/update_vendor_profile_usecase.dart';
import '../../domain/usecases/delete_portfolio_usecase.dart';
import '../viewmodels/vendor_registration_viewmodel.dart';

// Data Source Provider
final vendorRegistrationRemoteDataSourceProvider =
    Provider<VendorRegistrationRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return VendorRegistrationRemoteDataSource(dio);
});

// Repository Provider
final vendorRegistrationRepositoryProvider =
    Provider<VendorRegistrationRepository>((ref) {
  final remoteDataSource = ref.watch(vendorRegistrationRemoteDataSourceProvider);
  return VendorRegistrationRepositoryImpl(remoteDataSource);
});

// Use Case Providers
final registerVendorUseCaseProvider = Provider<RegisterVendorUseCase>((ref) {
  final repository = ref.watch(vendorRegistrationRepositoryProvider);
  return RegisterVendorUseCase(repository);
});

final uploadVendorDocumentsUseCaseProvider =
    Provider<UploadVendorDocumentsUseCase>((ref) {
  final repository = ref.watch(vendorRegistrationRepositoryProvider);
  return UploadVendorDocumentsUseCase(repository);
});

final uploadPortfolioUseCaseProvider = Provider<UploadPortfolioUseCase>((ref) {
  final repository = ref.watch(vendorRegistrationRepositoryProvider);
  return UploadPortfolioUseCase(repository);
});

final addBankDetailsUseCaseProvider = Provider<AddBankDetailsUseCase>((ref) {
  final repository = ref.watch(vendorRegistrationRepositoryProvider);
  return AddBankDetailsUseCase(repository);
});

final checkVendorStatusUseCaseProvider =
    Provider<CheckVendorStatusUseCase>((ref) {
  final repository = ref.watch(vendorRegistrationRepositoryProvider);
  return CheckVendorStatusUseCase(repository);
});

final getVendorProfileUseCaseProvider =
    Provider<GetVendorProfileUseCase>((ref) {
  final repository = ref.watch(vendorRegistrationRepositoryProvider);
  return GetVendorProfileUseCase(repository);
});

final updateVendorProfileUseCaseProvider =
    Provider<UpdateVendorProfileUseCase>((ref) {
  final repository = ref.watch(vendorRegistrationRepositoryProvider);
  return UpdateVendorProfileUseCase(repository);
});

final deletePortfolioUseCaseProvider = Provider<DeletePortfolioUseCase>((ref) {
  final repository = ref.watch(vendorRegistrationRepositoryProvider);
  return DeletePortfolioUseCase(repository);
});

// ViewModel Provider
final vendorRegistrationViewModelProvider = StateNotifierProvider.autoDispose<
    VendorRegistrationViewModel, VendorRegistrationState>((ref) {
  final registerUseCase = ref.watch(registerVendorUseCaseProvider);
  final uploadDocumentsUseCase = ref.watch(uploadVendorDocumentsUseCaseProvider);
  final uploadPortfolioUseCase = ref.watch(uploadPortfolioUseCaseProvider);
  final addBankDetailsUseCase = ref.watch(addBankDetailsUseCaseProvider);
  final checkStatusUseCase = ref.watch(checkVendorStatusUseCaseProvider);
  final getProfileUseCase = ref.watch(getVendorProfileUseCaseProvider);
  final updateProfileUseCase = ref.watch(updateVendorProfileUseCaseProvider);
  final deletePortfolioUseCase = ref.watch(deletePortfolioUseCaseProvider);

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
