import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/core/network/network_info.dart';
import '../../data/datasources/event_remote_datasource.dart';
import '../../data/repositories/event_repository_impl.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/repositories/event_repository.dart';
import '../../domain/usecases/add_to_favorites_usecase.dart';
import '../../domain/usecases/get_event_by_id_usecase.dart';
import '../../domain/usecases/get_events_usecase.dart';
import '../../domain/usecases/get_favorite_events_usecase.dart';
import '../../domain/usecases/get_flash_deal_events_usecase.dart';
import '../../domain/usecases/get_trending_events_usecase.dart';
import '../../domain/usecases/get_upcoming_events_usecase.dart';
import '../../domain/usecases/get_user_events_usecase.dart';
import '../../domain/usecases/remove_from_favorites_usecase.dart';
import '../../domain/usecases/search_events_usecase.dart';

/// Event Remote Data Source Provider
final eventRemoteDataSourceProvider = Provider<EventRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return EventRemoteDataSource(dio);
});

/// Event Repository Provider
final eventRepositoryProvider = Provider<EventRepository>((ref) {
  final remoteDataSource = ref.watch(eventRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return EventRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});

/// Use Case Providers
final getEventsUseCaseProvider = Provider<GetEventsUseCase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetEventsUseCase(repository);
});

final getTrendingEventsUseCaseProvider = Provider<GetTrendingEventsUseCase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetTrendingEventsUseCase(repository);
});

final getUpcomingEventsUseCaseProvider = Provider<GetUpcomingEventsUseCase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetUpcomingEventsUseCase(repository);
});

final getFlashDealEventsUseCaseProvider = Provider<GetFlashDealEventsUseCase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetFlashDealEventsUseCase(repository);
});

final getEventByIdUseCaseProvider = Provider<GetEventByIdUseCase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetEventByIdUseCase(repository);
});

final searchEventsUseCaseProvider = Provider<SearchEventsUseCase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return SearchEventsUseCase(repository);
});

final getUserEventsUseCaseProvider = Provider<GetUserEventsUseCase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetUserEventsUseCase(repository);
});

final getFavoriteEventsUseCaseProvider = Provider<GetFavoriteEventsUseCase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return GetFavoriteEventsUseCase(repository);
});

final addToFavoritesUseCaseProvider = Provider<AddToFavoritesUseCase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return AddToFavoritesUseCase(repository);
});

final removeFromFavoritesUseCaseProvider = Provider<RemoveFromFavoritesUseCase>((ref) {
  final repository = ref.watch(eventRepositoryProvider);
  return RemoveFromFavoritesUseCase(repository);
});

/// State Providers for different event lists
final trendingEventsProvider = FutureProvider.autoDispose<List<EventEntity>>((ref) async {
  final useCase = ref.watch(getTrendingEventsUseCaseProvider);
  final result = await useCase(limit: 10);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (events) => events,
  );
});

final upcomingEventsProvider = FutureProvider.autoDispose<List<EventEntity>>((ref) async {
  final useCase = ref.watch(getUpcomingEventsUseCaseProvider);
  final result = await useCase(limit: 10);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (events) => events,
  );
});

final flashDealEventsProvider = FutureProvider.autoDispose<List<EventEntity>>((ref) async {
  final useCase = ref.watch(getFlashDealEventsUseCaseProvider);
  final result = await useCase(limit: 10);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (events) => events,
  );
});

final userEventsProvider = StateNotifierProvider.autoDispose<UserEventsNotifier, AsyncValue<List<EventEntity>>>((ref) {
  final useCase = ref.watch(getUserEventsUseCaseProvider);
  return UserEventsNotifier(useCase);
});

class UserEventsNotifier extends StateNotifier<AsyncValue<List<EventEntity>>> {
  final GetUserEventsUseCase _getUserEventsUseCase;

  UserEventsNotifier(this._getUserEventsUseCase) : super(const AsyncValue.loading());

  Future<void> getUserEvents() async {
    state = const AsyncValue.loading();
    final result = await _getUserEventsUseCase();
    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (events) => AsyncValue.data(events),
    );
  }
}
