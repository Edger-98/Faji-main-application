import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/usecases/search_events_usecase.dart';
import '../providers/event_providers.dart';

/// Search ViewModel
class SearchViewModel extends StateNotifier<BaseState<List<EventEntity>>> {
  final SearchEventsUseCase _searchEventsUseCase;

  SearchViewModel(this._searchEventsUseCase) : super(const BaseState.initial());

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      state = const BaseState.initial();
      return;
    }

    state = const BaseState.loading();

    final result = await _searchEventsUseCase(query);

    result.fold(
      (failure) => state = BaseState.error(failure),
      (events) => state = BaseState.success(events),
    );
  }

  void clear() {
    state = const BaseState.initial();
  }
}

/// Search ViewModel Provider
final searchViewModelProvider =
    StateNotifierProvider.autoDispose<SearchViewModel, BaseState<List<EventEntity>>>(
  (ref) {
    final searchEventsUseCase = ref.watch(searchEventsUseCaseProvider);
    return SearchViewModel(searchEventsUseCase);
  },
);
