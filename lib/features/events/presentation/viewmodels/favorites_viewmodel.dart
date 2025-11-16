import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/usecases/get_favorite_events_usecase.dart';
import '../providers/event_providers.dart';

/// Favorites ViewModel
class FavoritesViewModel extends StateNotifier<BaseState<List<EventEntity>>> {
  final GetFavoriteEventsUseCase _getFavoriteEventsUseCase;

  FavoritesViewModel(this._getFavoriteEventsUseCase) : super(const BaseState.initial());

  Future<void> getFavorites() async {
    state = const BaseState.loading();

    final result = await _getFavoriteEventsUseCase();

    result.fold(
      (failure) => state = BaseState.error(failure),
      (events) => state = BaseState.success(events),
    );
  }

  void reset() {
    state = const BaseState.initial();
  }
}

/// Favorites ViewModel Provider
final favoritesViewModelProvider =
    StateNotifierProvider.autoDispose<FavoritesViewModel, BaseState<List<EventEntity>>>(
  (ref) {
    final getFavoriteEventsUseCase = ref.watch(getFavoriteEventsUseCaseProvider);
    return FavoritesViewModel(getFavoriteEventsUseCase);
  },
);
