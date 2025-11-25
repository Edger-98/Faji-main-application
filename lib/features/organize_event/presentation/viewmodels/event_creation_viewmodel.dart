import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/organize_event/domain/entities/event_creation_entity.dart';

/// State for event creation flow
class EventCreationState {
  final EventCreationEntity eventData;
  final int currentStep;
  final bool isLoading;
  final String? error;

  const EventCreationState({
    required this.eventData,
    this.currentStep = 0,
    this.isLoading = false,
    this.error,
  });

  EventCreationState copyWith({
    EventCreationEntity? eventData,
    int? currentStep,
    bool? isLoading,
    String? error,
  }) {
    return EventCreationState(
      eventData: eventData ?? this.eventData,
      currentStep: currentStep ?? this.currentStep,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// ViewModel for managing event creation flow
class EventCreationViewModel extends StateNotifier<EventCreationState> {
  EventCreationViewModel()
      : super(EventCreationState(
          eventData: const EventCreationEntity(),
          currentStep: 0,
        ));

  // Step 0: Update event type
  void updateEventType(String eventType) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(eventType: eventType),
    );
  }

  // Step 1: Update event details
  void updateTitle(String title) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(title: title),
    );
  }

  void updateDescription(String description) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(description: description),
    );
  }

  void updateCoverPhoto(String path) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(coverPhotoPath: path),
    );
  }

  void updateEventDate(DateTime date) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(eventDate: date),
    );
  }

  void updateEventTime(String time) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(eventTime: time),
    );
  }

  void updateLocation(String location) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(location: location),
    );
  }

  void updateTotalSeats(int seats) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(totalSeats: seats),
    );
  }

  void updateTicketPrice(double price) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(ticketPrice: price),
    );
  }

  // Step 2: Update event configuration
  void updateExpectedGuests(int guests) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(expectedGuests: guests),
    );
  }

  void updateBudget(double budget) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(budget: budget),
    );
  }

  void toggleWishlist(bool enabled) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(enableWishlist: enabled),
    );
  }

  void toggleBudgetTracking(bool enabled) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(enableBudgetTracking: enabled),
    );
  }

  void toggleCohostMarketplace(bool enabled) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(enableCohostMarketplace: enabled),
    );
  }

  // Step 3: Update poster selection
  void selectPoster(String posterId) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(selectedPosterId: posterId),
    );
  }

  // Step 4: Update theme selection
  void selectTheme(String themeId) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(selectedThemeId: themeId),
    );
  }

  // Navigation
  void nextStep() {
    if (state.currentStep < 4) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void goToStep(int step) {
    if (step >= 0 && step <= 4) {
      state = state.copyWith(currentStep: step);
    }
  }

  // Validation
  bool canProceedFromStep1() {
    final data = state.eventData;
    return data.title != null &&
        data.title!.isNotEmpty &&
        data.description != null &&
        data.description!.isNotEmpty &&
        data.eventDate != null &&
        data.eventTime != null &&
        data.location != null &&
        data.location!.isNotEmpty;
  }

  bool canProceedFromStep2() {
    final data = state.eventData;
    return data.expectedGuests != null && data.expectedGuests! > 0;
  }

  bool canProceedFromStep3() {
    return state.eventData.selectedPosterId != null;
  }

  bool canProceedFromStep4() {
    return state.eventData.selectedThemeId != null;
  }

  // Submit event
  Future<void> createEvent() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // TODO: Implement API call to create event
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      
      // Reset state after successful creation
      state = EventCreationState(
        eventData: const EventCreationEntity(),
        currentStep: 0,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  // Reset
  void reset() {
    state = EventCreationState(
      eventData: const EventCreationEntity(),
      currentStep: 0,
    );
  }
}
