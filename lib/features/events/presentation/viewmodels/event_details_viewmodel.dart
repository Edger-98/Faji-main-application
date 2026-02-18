import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/usecases/add_to_favorites_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_event_by_id_usecase.dart';
import 'package:fajimobileapp/features/events/domain/usecases/remove_from_favorites_usecase.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';

/// Event Details ViewModel
class EventDetailsViewModel extends StateNotifier<BaseState<EventEntity>> {

  EventDetailsViewModel(
    this._getEventByIdUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
  ) : super(const BaseState.initial());
  final GetEventByIdUseCase _getEventByIdUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;

  Future<void> getEventById(String eventId) async {
    state = const BaseState.loading();

    final Either<Failure, EventEntity> result = await _getEventByIdUseCase(eventId);

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (EventEntity event) => state = BaseState.success(event),
    );
  }

  Future<bool> toggleFavorite(String eventId, bool currentlyFavorite) async {
    final Either<Failure, void> result = currentlyFavorite
        ? await _removeFromFavoritesUseCase(eventId)
        : await _addToFavoritesUseCase(eventId);

    return result.fold(
      (Failure failure) => false,
      (_) => true,
    );
  }

  void reset() {
    state = const BaseState.initial();
  }
}

/// Event Details ViewModel Provider
final AutoDisposeStateNotifierProvider<EventDetailsViewModel, BaseState<EventEntity>> eventDetailsViewModelProvider =
    StateNotifierProvider.autoDispose<EventDetailsViewModel, BaseState<EventEntity>>(
  (AutoDisposeStateNotifierProviderRef<EventDetailsViewModel, BaseState<EventEntity>> ref) {
    final GetEventByIdUseCase getEventByIdUseCase = ref.watch(getEventByIdUseCaseProvider);
    final AddToFavoritesUseCase addToFavoritesUseCase = ref.watch(addToFavoritesUseCaseProvider);
    final RemoveFromFavoritesUseCase removeFromFavoritesUseCase = ref.watch(removeFromFavoritesUseCaseProvider);
    return EventDetailsViewModel(
      getEventByIdUseCase,
      addToFavoritesUseCase,
      removeFromFavoritesUseCase,
    );
  },
);
