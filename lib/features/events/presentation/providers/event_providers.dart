import 'package:dartz/dartz.dart';
import 'package:dio/src/dio.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/core/network/network_info.dart';
import 'package:fajimobileapp/core/usecases/usecase.dart';
import 'package:fajimobileapp/features/events/data/datasources/event_remote_datasource.dart';
import 'package:fajimobileapp/features/events/data/repositories/event_repository_impl.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/repositories/event_repository.dart';
import 'package:fajimobileapp/features/events/domain/usecases/add_to_favorites_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_event_by_id_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_events_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_favorite_events_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_flash_deal_events_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_trending_events_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_upcoming_events_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_user_events_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/remove_from_favorites_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/search_events_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_categories_usecase.dart';
import 'package:fajimobileapp/features/events/domain/entities/category_entity.dart';

/// Event Remote Data Source Provider
final Provider<EventRemoteDataSource> eventRemoteDataSourceProvider = Provider<EventRemoteDataSource>((ProviderRef<EventRemoteDataSource> ref) {
  final Dio dio = ref.watch(dioProvider);
  return EventRemoteDataSource(dio);
});

/// Event Repository Provider
final Provider<EventRepository> eventRepositoryProvider = Provider<EventRepository>((ProviderRef<EventRepository> ref) {
  final EventRemoteDataSource remoteDataSource = ref.watch(eventRemoteDataSourceProvider);
  final NetworkInfo networkInfo = ref.watch(networkInfoProvider);
  final Dio dio = ref.watch(dioProvider);
  return EventRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
    dio: dio,
  );
});

/// Use Case Providers
final Provider<GetEventsUseCase> getEventsUseCaseProvider = Provider<GetEventsUseCase>((ProviderRef<GetEventsUseCase> ref) {
  final EventRepository repository = ref.watch(eventRepositoryProvider);
  return GetEventsUseCase(repository);
});

final Provider<GetTrendingEventsUseCase> getTrendingEventsUseCaseProvider = Provider<GetTrendingEventsUseCase>((ProviderRef<GetTrendingEventsUseCase> ref) {
  final EventRepository repository = ref.watch(eventRepositoryProvider);
  return GetTrendingEventsUseCase(repository);
});

final Provider<GetUpcomingEventsUseCase> getUpcomingEventsUseCaseProvider = Provider<GetUpcomingEventsUseCase>((ProviderRef<GetUpcomingEventsUseCase> ref) {
  final EventRepository repository = ref.watch(eventRepositoryProvider);
  return GetUpcomingEventsUseCase(repository);
});

final Provider<GetFlashDealEventsUseCase> getFlashDealEventsUseCaseProvider = Provider<GetFlashDealEventsUseCase>((ProviderRef<GetFlashDealEventsUseCase> ref) {
  final EventRepository repository = ref.watch(eventRepositoryProvider);
  return GetFlashDealEventsUseCase(repository);
});

final Provider<GetEventByIdUseCase> getEventByIdUseCaseProvider = Provider<GetEventByIdUseCase>((ProviderRef<GetEventByIdUseCase> ref) {
  final EventRepository repository = ref.watch(eventRepositoryProvider);
  return GetEventByIdUseCase(repository);
});

final Provider<SearchEventsUseCase> searchEventsUseCaseProvider = Provider<SearchEventsUseCase>((ProviderRef<SearchEventsUseCase> ref) {
  final EventRepository repository = ref.watch(eventRepositoryProvider);
  return SearchEventsUseCase(repository);
});

final Provider<GetUserEventsUseCase> getUserEventsUseCaseProvider = Provider<GetUserEventsUseCase>((ProviderRef<GetUserEventsUseCase> ref) {
  final EventRepository repository = ref.watch(eventRepositoryProvider);
  return GetUserEventsUseCase(repository);
});

final Provider<GetFavoriteEventsUseCase> getFavoriteEventsUseCaseProvider = Provider<GetFavoriteEventsUseCase>((ProviderRef<GetFavoriteEventsUseCase> ref) {
  final EventRepository repository = ref.watch(eventRepositoryProvider);
  return GetFavoriteEventsUseCase(repository);
});

final Provider<AddToFavoritesUseCase> addToFavoritesUseCaseProvider = Provider<AddToFavoritesUseCase>((ProviderRef<AddToFavoritesUseCase> ref) {
  final EventRepository repository = ref.watch(eventRepositoryProvider);
  return AddToFavoritesUseCase(repository);
});

final Provider<RemoveFromFavoritesUseCase> removeFromFavoritesUseCaseProvider = Provider<RemoveFromFavoritesUseCase>((ProviderRef<RemoveFromFavoritesUseCase> ref) {
  final EventRepository repository = ref.watch(eventRepositoryProvider);
  return RemoveFromFavoritesUseCase(repository);
});

final Provider<GetCategoriesUseCase> getCategoriesUseCaseProvider = Provider<GetCategoriesUseCase>((ProviderRef<GetCategoriesUseCase> ref) {
  final EventRepository repository = ref.watch(eventRepositoryProvider);
  return GetCategoriesUseCase(repository);
});

/// State Providers for different event lists
final AutoDisposeFutureProvider<List<EventEntity>> trendingEventsProvider = FutureProvider.autoDispose<List<EventEntity>>((AutoDisposeFutureProviderRef<List<EventEntity>> ref) async {
  final GetTrendingEventsUseCase useCase = ref.watch(getTrendingEventsUseCaseProvider);
  final String? selectedCategory = ref.watch(selectedCategoryProvider);
  final Either<Failure, List<EventEntity>> result = await useCase(limit: 10, category: selectedCategory);
  return result.fold(
    (Failure failure) => throw Exception(failure.message),
    (List<EventEntity> events) => events,
  );
});

final AutoDisposeFutureProvider<List<EventEntity>> upcomingEventsProvider = FutureProvider.autoDispose<List<EventEntity>>((AutoDisposeFutureProviderRef<List<EventEntity>> ref) async {
  final GetUpcomingEventsUseCase useCase = ref.watch(getUpcomingEventsUseCaseProvider);
  final String? selectedCategory = ref.watch(selectedCategoryProvider);
  final Either<Failure, List<EventEntity>> result = await useCase(limit: 10, category: selectedCategory);
  return result.fold(
    (Failure failure) => throw Exception(failure.message),
    (List<EventEntity> events) => events,
  );
});

final AutoDisposeFutureProvider<List<EventEntity>> flashDealEventsProvider = FutureProvider.autoDispose<List<EventEntity>>((AutoDisposeFutureProviderRef<List<EventEntity>> ref) async {
  final GetFlashDealEventsUseCase useCase = ref.watch(getFlashDealEventsUseCaseProvider);
  final Either<Failure, List<EventEntity>> result = await useCase(limit: 10);
  return result.fold(
    (Failure failure) => throw Exception(failure.message),
    (List<EventEntity> events) => events,
  );
});

final AutoDisposeStateNotifierProvider<UserEventsNotifier, AsyncValue<List<EventEntity>>> userEventsProvider = StateNotifierProvider.autoDispose<UserEventsNotifier, AsyncValue<List<EventEntity>>>((AutoDisposeStateNotifierProviderRef<UserEventsNotifier, AsyncValue<List<EventEntity>>> ref) {
  final GetUserEventsUseCase useCase = ref.watch(getUserEventsUseCaseProvider);
  return UserEventsNotifier(useCase);
});

class UserEventsNotifier extends StateNotifier<AsyncValue<List<EventEntity>>> {

  UserEventsNotifier(this._getUserEventsUseCase) : super(const AsyncValue.loading()) {
    getUserEvents();
  }
  final GetUserEventsUseCase _getUserEventsUseCase;

  Future<void> getUserEvents() async {
    state = const AsyncValue.loading();
    final Either<Failure, List<EventEntity>> result = await _getUserEventsUseCase();
    state = result.fold(
      (Failure failure) => AsyncValue.error(failure.message, StackTrace.current),
      AsyncValue.data,
    );
  }
}

/// Categories Provider
final AutoDisposeFutureProvider<List<CategoryEntity>> categoriesProvider = FutureProvider.autoDispose<List<CategoryEntity>>((AutoDisposeFutureProviderRef<List<CategoryEntity>> ref) async {
  final GetCategoriesUseCase useCase = ref.watch(getCategoriesUseCaseProvider);
  final Either<Failure, List<CategoryEntity>> result = await useCase(NoParams());
  return result.fold(
    (Failure failure) => throw Exception(failure.message),
    (List<CategoryEntity> categories) => categories,
  );
});

/// Selected Category Provider for filtering
final StateProvider<String?> selectedCategoryProvider = StateProvider<String?>((StateProviderRef<String?> ref) => null);
