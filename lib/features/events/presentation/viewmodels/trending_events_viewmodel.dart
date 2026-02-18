import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_trending_events_usecase.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';

/// Trending Events ViewModel
class TrendingEventsViewModel extends StateNotifier<BaseState<List<EventEntity>>> {

  TrendingEventsViewModel(this._getTrendingEventsUseCase)
      : super(const BaseState.initial());
  final GetTrendingEventsUseCase _getTrendingEventsUseCase;

  Future<void> getTrendingEvents({int? limit}) async {
    state = const BaseState.loading();

    final Either<Failure, List<EventEntity>> result = await _getTrendingEventsUseCase(limit: limit);

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (List<EventEntity> events) => state = BaseState.success(events),
    );
  }

  void reset() {
    state = const BaseState.initial();
  }
}

/// Trending Events ViewModel Provider
final AutoDisposeStateNotifierProvider<TrendingEventsViewModel, BaseState<List<EventEntity>>> trendingEventsViewModelProvider = StateNotifierProvider.autoDispose<
    TrendingEventsViewModel, BaseState<List<EventEntity>>>(
  (AutoDisposeStateNotifierProviderRef<TrendingEventsViewModel, BaseState<List<EventEntity>>> ref) {
    final GetTrendingEventsUseCase getTrendingEventsUseCase = ref.watch(getTrendingEventsUseCaseProvider);
    return TrendingEventsViewModel(getTrendingEventsUseCase);
  },
);
