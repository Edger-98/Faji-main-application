import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/organize_event/presentation/viewmodels/event_creation_viewmodel.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/event_creation_repository.dart';

/// Provider for event creation viewmodel
final StateNotifierProvider<EventCreationViewModel, EventCreationState> eventCreationViewModelProvider =
    StateNotifierProvider<EventCreationViewModel, EventCreationState>(
  (StateNotifierProviderRef<EventCreationViewModel, EventCreationState> ref) {
    final EventCreationRepository repository = ref.read(eventCreationRepositoryProvider);
    return EventCreationViewModel(repository);
  },
);
