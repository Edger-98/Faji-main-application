import 'package:dio/src/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/features/marketplace/data/datasources/marketplace_remote_datasource.dart';
import 'package:fajimobileapp/features/marketplace/data/repositories/marketplace_repository_impl.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_marketplace_resources_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_vendor_profile_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/create_booking_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_my_bookings_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_booking_requests_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/accept_booking_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/decline_booking_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/send_counter_offer_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/update_booking_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_my_vendor_profile_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_vendor_stats_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/add_resource_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_my_resources_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/update_resource_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/delete_resource_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_vendor_dashboard_usecase.dart';
import 'package:fajimobileapp/features/marketplace/presentation/viewmodels/marketplace_viewmodel.dart';
import 'package:fajimobileapp/features/marketplace/presentation/viewmodels/vendor_booking_viewmodel.dart';
import 'package:fajimobileapp/features/marketplace/presentation/viewmodels/vendor_dashboard_viewmodel.dart';
import 'package:fajimobileapp/features/marketplace/presentation/viewmodels/vendor_resources_viewmodel.dart';

// Data Source Provider
final Provider<MarketplaceRemoteDataSource> marketplaceRemoteDataSourceProvider =
    Provider<MarketplaceRemoteDataSource>((ProviderRef<MarketplaceRemoteDataSource> ref) {
  final Dio dio = ref.watch(dioProvider);
  return MarketplaceRemoteDataSource(dio);
});

// Repository Provider
final Provider<MarketplaceRepository> marketplaceRepositoryProvider = Provider<MarketplaceRepository>((ProviderRef<MarketplaceRepository> ref) {
  final MarketplaceRemoteDataSource remoteDataSource = ref.watch(marketplaceRemoteDataSourceProvider);
  return MarketplaceRepositoryImpl(remoteDataSource);
});

// Use Case Providers
final Provider<GetMarketplaceResourcesUseCase> getMarketplaceResourcesUseCaseProvider =
    Provider<GetMarketplaceResourcesUseCase>((ProviderRef<GetMarketplaceResourcesUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return GetMarketplaceResourcesUseCase(repository);
});

final Provider<GetVendorProfileUseCase> getVendorProfileUseCaseProvider =
    Provider<GetVendorProfileUseCase>((ProviderRef<GetVendorProfileUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return GetVendorProfileUseCase(repository);
});

final Provider<CreateBookingUseCase> createBookingUseCaseProvider = Provider<CreateBookingUseCase>((ProviderRef<CreateBookingUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return CreateBookingUseCase(repository);
});

final Provider<GetMyBookingsUseCase> getMyBookingsUseCaseProvider = Provider<GetMyBookingsUseCase>((ProviderRef<GetMyBookingsUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return GetMyBookingsUseCase(repository);
});

final Provider<GetBookingRequestsUseCase> getBookingRequestsUseCaseProvider =
    Provider<GetBookingRequestsUseCase>((ProviderRef<GetBookingRequestsUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return GetBookingRequestsUseCase(repository);
});

final Provider<AcceptBookingUseCase> acceptBookingUseCaseProvider = Provider<AcceptBookingUseCase>((ProviderRef<AcceptBookingUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return AcceptBookingUseCase(repository);
});

final Provider<DeclineBookingUseCase> declineBookingUseCaseProvider = Provider<DeclineBookingUseCase>((ProviderRef<DeclineBookingUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return DeclineBookingUseCase(repository);
});

final Provider<SendCounterOfferUseCase> sendCounterOfferUseCaseProvider =
    Provider<SendCounterOfferUseCase>((ProviderRef<SendCounterOfferUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return SendCounterOfferUseCase(repository);
});

final Provider<UpdateBookingUseCase> updateBookingUseCaseProvider = Provider<UpdateBookingUseCase>((ProviderRef<UpdateBookingUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return UpdateBookingUseCase(repository);
});

final Provider<GetMyVendorProfileUseCase> getMyVendorProfileUseCaseProvider =
    Provider<GetMyVendorProfileUseCase>((ProviderRef<GetMyVendorProfileUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return GetMyVendorProfileUseCase(repository);
});

final Provider<GetVendorStatsUseCase> getVendorStatsUseCaseProvider = Provider<GetVendorStatsUseCase>((ProviderRef<GetVendorStatsUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return GetVendorStatsUseCase(repository);
});

final Provider<AddResourceUseCase> addResourceUseCaseProvider = Provider<AddResourceUseCase>((ProviderRef<AddResourceUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return AddResourceUseCase(repository);
});

final Provider<GetMyResourcesUseCase> getMyResourcesUseCaseProvider = Provider<GetMyResourcesUseCase>((ProviderRef<GetMyResourcesUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return GetMyResourcesUseCase(repository);
});

final Provider<UpdateResourceUseCase> updateResourceUseCaseProvider = Provider<UpdateResourceUseCase>((ProviderRef<UpdateResourceUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return UpdateResourceUseCase(repository);
});

final Provider<DeleteResourceUseCase> deleteResourceUseCaseProvider = Provider<DeleteResourceUseCase>((ProviderRef<DeleteResourceUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return DeleteResourceUseCase(repository);
});

final Provider<GetVendorDashboardUseCase> getVendorDashboardUseCaseProvider =
    Provider<GetVendorDashboardUseCase>((ProviderRef<GetVendorDashboardUseCase> ref) {
  final MarketplaceRepository repository = ref.watch(marketplaceRepositoryProvider);
  return GetVendorDashboardUseCase(repository);
});

// ViewModel Providers
final AutoDisposeStateNotifierProvider<MarketplaceViewModel, MarketplaceState> marketplaceViewModelProvider = StateNotifierProvider.autoDispose<
    MarketplaceViewModel, MarketplaceState>((AutoDisposeStateNotifierProviderRef<MarketplaceViewModel, MarketplaceState> ref) {
  final GetMarketplaceResourcesUseCase getResourcesUseCase = ref.watch(getMarketplaceResourcesUseCaseProvider);
  final GetVendorProfileUseCase getVendorProfileUseCase = ref.watch(getVendorProfileUseCaseProvider);
  final CreateBookingUseCase createBookingUseCase = ref.watch(createBookingUseCaseProvider);
  final GetMyBookingsUseCase getMyBookingsUseCase = ref.watch(getMyBookingsUseCaseProvider);

  return MarketplaceViewModel(
    getResourcesUseCase,
    getVendorProfileUseCase,
    createBookingUseCase,
    getMyBookingsUseCase,
  );
});

final AutoDisposeStateNotifierProvider<VendorBookingViewModel, VendorBookingState> vendorBookingViewModelProvider = StateNotifierProvider.autoDispose<
    VendorBookingViewModel, VendorBookingState>((AutoDisposeStateNotifierProviderRef<VendorBookingViewModel, VendorBookingState> ref) {
  final GetBookingRequestsUseCase getBookingRequestsUseCase = ref.watch(getBookingRequestsUseCaseProvider);
  final AcceptBookingUseCase acceptBookingUseCase = ref.watch(acceptBookingUseCaseProvider);
  final DeclineBookingUseCase declineBookingUseCase = ref.watch(declineBookingUseCaseProvider);
  final SendCounterOfferUseCase sendCounterOfferUseCase = ref.watch(sendCounterOfferUseCaseProvider);
  final UpdateBookingUseCase updateBookingUseCase = ref.watch(updateBookingUseCaseProvider);

  return VendorBookingViewModel(
    getBookingRequestsUseCase,
    acceptBookingUseCase,
    declineBookingUseCase,
    sendCounterOfferUseCase,
    updateBookingUseCase,
  );
});

final AutoDisposeStateNotifierProvider<VendorDashboardViewModel, VendorDashboardState> vendorDashboardViewModelProvider = StateNotifierProvider.autoDispose<
    VendorDashboardViewModel, VendorDashboardState>((AutoDisposeStateNotifierProviderRef<VendorDashboardViewModel, VendorDashboardState> ref) {
  final GetVendorDashboardUseCase getVendorDashboardUseCase = ref.watch(getVendorDashboardUseCaseProvider);
  final GetMyVendorProfileUseCase getMyVendorProfileUseCase = ref.watch(getMyVendorProfileUseCaseProvider);
  final GetVendorStatsUseCase getVendorStatsUseCase = ref.watch(getVendorStatsUseCaseProvider);

  return VendorDashboardViewModel(
    getVendorDashboardUseCase,
    getMyVendorProfileUseCase,
    getVendorStatsUseCase,
  );
});

final AutoDisposeStateNotifierProvider<VendorResourcesViewModel, VendorResourcesState> vendorResourcesViewModelProvider = StateNotifierProvider.autoDispose<
    VendorResourcesViewModel, VendorResourcesState>((AutoDisposeStateNotifierProviderRef<VendorResourcesViewModel, VendorResourcesState> ref) {
  final GetMyResourcesUseCase getMyResourcesUseCase = ref.watch(getMyResourcesUseCaseProvider);
  final AddResourceUseCase addResourceUseCase = ref.watch(addResourceUseCaseProvider);
  final UpdateResourceUseCase updateResourceUseCase = ref.watch(updateResourceUseCaseProvider);
  final DeleteResourceUseCase deleteResourceUseCase = ref.watch(deleteResourceUseCaseProvider);

  return VendorResourcesViewModel(
    getMyResourcesUseCase,
    addResourceUseCase,
    updateResourceUseCase,
    deleteResourceUseCase,
  );
});
