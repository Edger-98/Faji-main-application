import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/usecases/get_events_usecase.dart';
import '../providers/event_providers.dart';

/// Events ViewModel
class EventsViewModel extends StateNotifier<BaseState<List<EventEntity>>> {
  final GetEventsUseCase _getEventsUseCase;

  EventsViewModel(this._getEventsUseCase) : super(const BaseState.initial());

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

    final result = await _getEventsUseCase(
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
      (failure) => state = BaseState.error(failure),
      (events) => state = BaseState.success(events),
    );
  }

  void reset() {
    state = const BaseState.initial();
  }
}

/// Events ViewModel Provider
final eventsViewModelProvider =
    StateNotifierProvider.autoDispose<EventsViewModel, BaseState<List<EventEntity>>>(
  (ref) {
    final getEventsUseCase = ref.watch(getEventsUseCaseProvider);
    return EventsViewModel(getEventsUseCase);
  },
);
