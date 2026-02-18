import 'package:fajimobileapp/features/organize_event/presentation/viewmodels/event_creation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_creation_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_type_selection_screen.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/create_event_details_screen.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_config_screen.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_location_picker_screen.dart';

/// Main coordinator screen for event creation flow
/// Manages navigation between the 4 steps (0-3)
/// Step 0: Event Type Selection
/// Step 1: Event Details (with image upload)
/// Step 2: Event Configuration (guests, budget, etc.)
/// Step 3: Location Picker (map with search)
class EventCreationFlowScreen extends ConsumerWidget {
  const EventCreationFlowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EventCreationState state = ref.watch(eventCreationViewModelProvider);

    // Return the appropriate screen based on current step
    switch (state.currentStep) {
      case 0:
        return const EventTypeSelectionScreen();
      case 1:
        return const CreateEventDetailsScreen();
      case 2:
        return const EventConfigScreen();
      case 3:
        return const EventLocationPickerScreen();
      default:
        return const EventTypeSelectionScreen();
    }
  }
}
