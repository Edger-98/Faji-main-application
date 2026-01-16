import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/marketplace_remote_datasource.dart';
import '../../data/repositories/marketplace_repository_impl.dart';
import '../../domain/repositories/marketplace_repository.dart';
import '../../domain/usecases/get_marketplace_resources_usecase.dart';
import '../../domain/usecases/get_vendor_profile_usecase.dart';
import '../../domain/usecases/create_booking_usecase.dart';
import '../../domain/usecases/get_my_bookings_usecase.dart';
import '../../domain/usecases/get_booking_requests_usecase.dart';
import '../../domain/usecases/accept_booking_usecase.dart';
import '../../domain/usecases/decline_booking_usecase.dart';
import '../../domain/usecases/send_counter_offer_usecase.dart';
import '../../domain/usecases/update_booking_usecase.dart';
import '../../domain/usecases/get_my_vendor_profile_usecase.dart';
import '../../domain/usecases/get_vendor_stats_usecase.dart';
import '../../domain/usecases/add_resource_usecase.dart';
import '../../domain/usecases/get_my_resources_usecase.dart';
import '../../domain/usecases/update_resource_usecase.dart';
import '../../domain/usecases/delete_resource_usecase.dart';
import '../../domain/usecases/get_vendor_dashboard_usecase.dart';
import '../viewmodels/marketplace_viewmodel.dart';
import '../viewmodels/vendor_booking_viewmodel.dart';
import '../viewmodels/vendor_dashboard_viewmodel.dart';
import '../viewmodels/vendor_resources_viewmodel.dart';

// Data Source Provider
final marketplaceRemoteDataSourceProvider =
    Provider<MarketplaceRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return MarketplaceRemoteDataSource(dio);
});

// Repository Provider
final marketplaceRepositoryProvider = Provider<MarketplaceRepository>((ref) {
  final remoteDataSource = ref.watch(marketplaceRemoteDataSourceProvider);
  return MarketplaceRepositoryImpl(remoteDataSource);
});

// Use Case Providers
final getMarketplaceResourcesUseCaseProvider =
    Provider<GetMarketplaceResourcesUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return GetMarketplaceResourcesUseCase(repository);
});

final getVendorProfileUseCaseProvider =
    Provider<GetVendorProfileUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return GetVendorProfileUseCase(repository);
});

final createBookingUseCaseProvider = Provider<CreateBookingUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return CreateBookingUseCase(repository);
});

final getMyBookingsUseCaseProvider = Provider<GetMyBookingsUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return GetMyBookingsUseCase(repository);
});

final getBookingRequestsUseCaseProvider =
    Provider<GetBookingRequestsUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return GetBookingRequestsUseCase(repository);
});

final acceptBookingUseCaseProvider = Provider<AcceptBookingUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return AcceptBookingUseCase(repository);
});

final declineBookingUseCaseProvider = Provider<DeclineBookingUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return DeclineBookingUseCase(repository);
});

final sendCounterOfferUseCaseProvider =
    Provider<SendCounterOfferUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return SendCounterOfferUseCase(repository);
});

final updateBookingUseCaseProvider = Provider<UpdateBookingUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return UpdateBookingUseCase(repository);
});

final getMyVendorProfileUseCaseProvider =
    Provider<GetMyVendorProfileUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return GetMyVendorProfileUseCase(repository);
});

final getVendorStatsUseCaseProvider = Provider<GetVendorStatsUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return GetVendorStatsUseCase(repository);
});

final addResourceUseCaseProvider = Provider<AddResourceUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return AddResourceUseCase(repository);
});

final getMyResourcesUseCaseProvider = Provider<GetMyResourcesUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return GetMyResourcesUseCase(repository);
});

final updateResourceUseCaseProvider = Provider<UpdateResourceUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return UpdateResourceUseCase(repository);
});

final deleteResourceUseCaseProvider = Provider<DeleteResourceUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return DeleteResourceUseCase(repository);
});

final getVendorDashboardUseCaseProvider =
    Provider<GetVendorDashboardUseCase>((ref) {
  final repository = ref.watch(marketplaceRepositoryProvider);
  return GetVendorDashboardUseCase(repository);
});

// ViewModel Providers
final marketplaceViewModelProvider = StateNotifierProvider.autoDispose<
    MarketplaceViewModel, MarketplaceState>((ref) {
  final getResourcesUseCase = ref.watch(getMarketplaceResourcesUseCaseProvider);
  final getVendorProfileUseCase = ref.watch(getVendorProfileUseCaseProvider);
  final createBookingUseCase = ref.watch(createBookingUseCaseProvider);
  final getMyBookingsUseCase = ref.watch(getMyBookingsUseCaseProvider);

  return MarketplaceViewModel(
    getResourcesUseCase,
    getVendorProfileUseCase,
    createBookingUseCase,
    getMyBookingsUseCase,
  );
});

final vendorBookingViewModelProvider = StateNotifierProvider.autoDispose<
    VendorBookingViewModel, VendorBookingState>((ref) {
  final getBookingRequestsUseCase = ref.watch(getBookingRequestsUseCaseProvider);
  final acceptBookingUseCase = ref.watch(acceptBookingUseCaseProvider);
  final declineBookingUseCase = ref.watch(declineBookingUseCaseProvider);
  final sendCounterOfferUseCase = ref.watch(sendCounterOfferUseCaseProvider);
  final updateBookingUseCase = ref.watch(updateBookingUseCaseProvider);

  return VendorBookingViewModel(
    getBookingRequestsUseCase,
    acceptBookingUseCase,
    declineBookingUseCase,
    sendCounterOfferUseCase,
    updateBookingUseCase,
  );
});

final vendorDashboardViewModelProvider = StateNotifierProvider.autoDispose<
    VendorDashboardViewModel, VendorDashboardState>((ref) {
  final getVendorDashboardUseCase = ref.watch(getVendorDashboardUseCaseProvider);
  final getMyVendorProfileUseCase = ref.watch(getMyVendorProfileUseCaseProvider);
  final getVendorStatsUseCase = ref.watch(getVendorStatsUseCaseProvider);

  return VendorDashboardViewModel(
    getVendorDashboardUseCase,
    getMyVendorProfileUseCase,
    getVendorStatsUseCase,
  );
});

final vendorResourcesViewModelProvider = StateNotifierProvider.autoDispose<
    VendorResourcesViewModel, VendorResourcesState>((ref) {
  final getMyResourcesUseCase = ref.watch(getMyResourcesUseCaseProvider);
  final addResourceUseCase = ref.watch(addResourceUseCaseProvider);
  final updateResourceUseCase = ref.watch(updateResourceUseCaseProvider);
  final deleteResourceUseCase = ref.watch(deleteResourceUseCaseProvider);

  return VendorResourcesViewModel(
    getMyResourcesUseCase,
    addResourceUseCase,
    updateResourceUseCase,
    deleteResourceUseCase,
  );
});
