import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/organize_event/presentation/viewmodels/event_creation_viewmodel.dart';

/// Provider for event creation viewmodel
final eventCreationViewModelProvider =
    StateNotifierProvider<EventCreationViewModel, EventCreationState>(
  (ref) => EventCreationViewModel(),
);
