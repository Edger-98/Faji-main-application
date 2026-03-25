import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/usecases/search_events_usecase.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';

/// Search ViewModel
class SearchViewModel extends StateNotifier<BaseState<List<EventEntity>>> {

  SearchViewModel(this._searchEventsUseCase) : super(const BaseState.initial());
  final SearchEventsUseCase _searchEventsUseCase;

  Future<void> search({
    required String query,
    String? category,
    String? location,
    double? latitude,
    double? longitude,
    double? radius,
    double? minPrice,
    double? maxPrice,
    int? page,
    int? limit,
  }) async {
    if (query.trim().isEmpty) {
      state = const BaseState.initial();
      return;
    }

    state = const BaseState.loading();

    final Either<Failure, List<EventEntity>> result = await _searchEventsUseCase(
      query: query,
      category: category,
      location: location,
      latitude: latitude,
      longitude: longitude,
      radius: radius,
      minPrice: minPrice,
      maxPrice: maxPrice,
      page: page,
      limit: limit,
    );

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (List<EventEntity> events) => state = BaseState.success(events),
    );
  }

  void clear() {
    state = const BaseState.initial();
  }
}

/// Search ViewModel Provider
final AutoDisposeStateNotifierProvider<SearchViewModel, BaseState<List<EventEntity>>> searchViewModelProvider =
    StateNotifierProvider.autoDispose<SearchViewModel, BaseState<List<EventEntity>>>(
  (AutoDisposeStateNotifierProviderRef<SearchViewModel, BaseState<List<EventEntity>>> ref) {
    final SearchEventsUseCase searchEventsUseCase = ref.watch(searchEventsUseCaseProvider);
    return SearchViewModel(searchEventsUseCase);
  },
);
