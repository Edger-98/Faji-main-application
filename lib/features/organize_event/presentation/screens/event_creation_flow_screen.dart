import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_creation_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_type_selection_screen.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/create_event_details_screen.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_config_screen.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_poster_screen.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_theme_screen.dart';

/// Main coordinator screen for event creation flow
/// Manages navigation between the 5 steps (0-4)
class EventCreationFlowScreen extends ConsumerWidget {
  const EventCreationFlowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(eventCreationViewModelProvider);

    // Return the appropriate screen based on current step
    switch (state.currentStep) {
      case 0:
        return const EventTypeSelectionScreen();
      case 1:
        return const CreateEventDetailsScreen();
      case 2:
        return const EventConfigScreen();
      case 3:
        return const EventPosterScreen();
      case 4:
        return const EventThemeScreen();
      default:
        return const EventTypeSelectionScreen();
    }
  }
}
