import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/usecases/get_trending_events_usecase.dart';
import '../providers/event_providers.dart';

/// Trending Events ViewModel
class TrendingEventsViewModel extends StateNotifier<BaseState<List<EventEntity>>> {
  final GetTrendingEventsUseCase _getTrendingEventsUseCase;

  TrendingEventsViewModel(this._getTrendingEventsUseCase)
      : super(const BaseState.initial());

  Future<void> getTrendingEvents({int? limit}) async {
    state = const BaseState.loading();

    final result = await _getTrendingEventsUseCase(limit: limit);

    result.fold(
      (failure) => state = BaseState.error(failure),
      (events) => state = BaseState.success(events),
    );
  }

  void reset() {
    state = const BaseState.initial();
  }
}

/// Trending Events ViewModel Provider
final trendingEventsViewModelProvider = StateNotifierProvider.autoDispose<
    TrendingEventsViewModel, BaseState<List<EventEntity>>>(
  (ref) {
    final getTrendingEventsUseCase = ref.watch(getTrendingEventsUseCaseProvider);
    return TrendingEventsViewModel(getTrendingEventsUseCase);
  },
);
