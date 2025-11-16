import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/usecases/add_to_favorites_usecase.dart';
import '../../domain/usecases/get_event_by_id_usecase.dart';
import '../../domain/usecases/remove_from_favorites_usecase.dart';
import '../providers/event_providers.dart';

/// Event Details ViewModel
class EventDetailsViewModel extends StateNotifier<BaseState<EventEntity>> {
  final GetEventByIdUseCase _getEventByIdUseCase;
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;

  EventDetailsViewModel(
    this._getEventByIdUseCase,
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
  ) : super(const BaseState.initial());

  Future<void> getEventById(String eventId) async {
    state = const BaseState.loading();

    final result = await _getEventByIdUseCase(eventId);

    result.fold(
      (failure) => state = BaseState.error(failure),
      (event) => state = BaseState.success(event),
    );
  }

  Future<bool> toggleFavorite(String eventId, bool currentlyFavorite) async {
    final result = currentlyFavorite
        ? await _removeFromFavoritesUseCase(eventId)
        : await _addToFavoritesUseCase(eventId);

    return result.fold(
      (failure) => false,
      (_) => true,
    );
  }

  void reset() {
    state = const BaseState.initial();
  }
}

/// Event Details ViewModel Provider
final eventDetailsViewModelProvider =
    StateNotifierProvider.autoDispose<EventDetailsViewModel, BaseState<EventEntity>>(
  (ref) {
    final getEventByIdUseCase = ref.watch(getEventByIdUseCaseProvider);
    final addToFavoritesUseCase = ref.watch(addToFavoritesUseCaseProvider);
    final removeFromFavoritesUseCase = ref.watch(removeFromFavoritesUseCaseProvider);
    return EventDetailsViewModel(
      getEventByIdUseCase,
      addToFavoritesUseCase,
      removeFromFavoritesUseCase,
    );
  },
);
