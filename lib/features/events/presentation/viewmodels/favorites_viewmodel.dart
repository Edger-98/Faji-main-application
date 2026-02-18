import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/usecases/add_to_favorites_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_favorite_events_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/remove_from_favorites_usecase.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';

/// Favorites ViewModel
class FavoritesViewModel extends StateNotifier<BaseState<List<EventEntity>>> {

  FavoritesViewModel(
    this._getFavoriteEventsUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
  ) : super(const BaseState.initial());
  final GetFavoriteEventsUseCase _getFavoriteEventsUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;

  Future<void> getFavorites() async {
    state = const BaseState.loading();

    final Either<Failure, List<EventEntity>> result = await _getFavoriteEventsUseCase();

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (List<EventEntity> events) => state = BaseState.success(events),
    );
  }

  Future<bool> addToFavorites(String eventId) async {
    final Either<Failure, void> result = await _addToFavoritesUseCase(eventId);
    
    return result.fold(
      (Failure failure) => false,
      (success) {
        // Refresh the favorites list
        getFavorites();
        return true;
      },
    );
  }

  Future<bool> removeFromFavorites(String eventId) async {
    final Either<Failure, void> result = await _removeFromFavoritesUseCase(eventId);
    
    return result.fold(
      (Failure failure) => false,
      (success) {
        // Refresh the favorites list
        getFavorites();
        return true;
      },
    );
  }

  Future<bool> toggleFavorite(EventEntity event) async {
    // Check if event is currently in favorites
    final List<EventEntity> currentFavorites = state.maybeWhen(
      success: (List<EventEntity> events) => events,
      orElse: () => <EventEntity>[],
    );
    
    final bool isFavorite = currentFavorites.any((EventEntity e) => e.id == event.id);
    
    if (isFavorite) {
      return removeFromFavorites(event.id);
    } else {
      return addToFavorites(event.id);
    }
  }

  bool isFavorite(String eventId) => state.maybeWhen(
      success: (events) => events.any((e) => e.id == eventId),
      orElse: () => false,
    );

  void reset() {
    state = const BaseState.initial();
  }
}

/// Favorites ViewModel Provider
final AutoDisposeStateNotifierProvider<FavoritesViewModel, BaseState<List<EventEntity>>> favoritesViewModelProvider =
    StateNotifierProvider.autoDispose<FavoritesViewModel, BaseState<List<EventEntity>>>(
  (AutoDisposeStateNotifierProviderRef<FavoritesViewModel, BaseState<List<EventEntity>>> ref) {
    final GetFavoriteEventsUseCase getFavoriteEventsUseCase = ref.watch(getFavoriteEventsUseCaseProvider);
    final AddToFavoritesUseCase addToFavoritesUseCase = ref.watch(addToFavoritesUseCaseProvider);
    final RemoveFromFavoritesUseCase removeFromFavoritesUseCase = ref.watch(removeFromFavoritesUseCaseProvider);
    return FavoritesViewModel(
      getFavoriteEventsUseCase,
      addToFavoritesUseCase,
      removeFromFavoritesUseCase,
    );
  },
);
