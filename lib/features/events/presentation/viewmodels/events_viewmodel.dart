import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_events_usecase.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';

/// Events ViewModel
class EventsViewModel extends StateNotifier<BaseState<List<EventEntity>>> {

  EventsViewModel(this._getEventsUseCase) : super(const BaseState.initial());
  final GetEventsUseCase _getEventsUseCase;

  Future<void> getEvents({
    int? page,
    int? limit,
    String? category,
    String? search,
    DateTime? startDate,
    DateTime? endDate,
    double? minPrice,
    double? maxPrice,
    String? location,
  }) async {
    state = const BaseState.loading();

    final Either<Failure, List<EventEntity>> result = await _getEventsUseCase(
      page: page,
      limit: limit,
      category: category,
      search: search,
      startDate: startDate,
      endDate: endDate,
      minPrice: minPrice,
      maxPrice: maxPrice,
      location: location,
    );

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (List<EventEntity> events) => state = BaseState.success(events),
    );
  }

  void reset() {
    state = const BaseState.initial();
  }
}

/// Events ViewModel Provider
final AutoDisposeStateNotifierProvider<EventsViewModel, BaseState<List<EventEntity>>> eventsViewModelProvider =
    StateNotifierProvider.autoDispose<EventsViewModel, BaseState<List<EventEntity>>>(
  (AutoDisposeStateNotifierProviderRef<EventsViewModel, BaseState<List<EventEntity>>> ref) {
    final GetEventsUseCase getEventsUseCase = ref.watch(getEventsUseCaseProvider);
    return EventsViewModel(getEventsUseCase);
  },
);
