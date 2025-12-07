import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/organize_event/domain/entities/event_creation_entity.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/event_creation_repository.dart';
import 'package:fajimobileapp/core/models/event_model.dart';

/// State for event creation flow
class EventCreationState {
  final EventCreationEntity eventData;
  final int currentStep;
  final bool isLoading;
  final String? error;
  final EventModel? createdEvent;

  const EventCreationState({
    required this.eventData,
    this.currentStep = 0,
    this.isLoading = false,
    this.error,
    this.createdEvent,
  });

  EventCreationState copyWith({
    EventCreationEntity? eventData,
    int? currentStep,
    bool? isLoading,
    String? error,
    EventModel? createdEvent,
  }) {
    return EventCreationState(
      eventData: eventData ?? this.eventData,
      currentStep: currentStep ?? this.currentStep,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      createdEvent: createdEvent ?? this.createdEvent,
    );
  }
}

/// ViewModel for managing event creation flow
class EventCreationViewModel extends StateNotifier<EventCreationState> {
  final EventCreationRepository _repository;
  
  EventCreationViewModel(this._repository)
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

  void updateStartDate(DateTime date) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(eventDate: date),
    );
  }

  void updateEndDate(DateTime date) {
    // Store end date in eventTime field temporarily (we'll refactor entity later)
    state = state.copyWith(
      eventData: state.eventData.copyWith(eventTime: date.toIso8601String()),
    );
  }

  void updateWebsiteLink(String link) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(location: link), // Temporarily store in location
    );
  }

  void updateRsvpButtonText(String text) {
    // Store in description temporarily (we'll refactor entity later)
    final currentDesc = state.eventData.description ?? '';
    state = state.copyWith(
      eventData: state.eventData.copyWith(
        description: currentDesc.isEmpty ? text : currentDesc,
      ),
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

  // Submit event - REAL API CALL
  Future<EventModel?> createEvent({
    DateTime? startDate,
    DateTime? endDate,
    String? websiteLink,
    String? rsvpButtonText,
  }) async {
    print('🔄 ViewModel.createEvent called');
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final data = state.eventData;
      
      // Validate required fields
      if (data.title == null || data.title!.isEmpty) {
        throw Exception('Event title is required');
      }
      
      final DateTime finalStartDate = startDate ?? data.eventDate ?? DateTime.now().add(const Duration(days: 7));
      final DateTime finalEndDate = endDate ?? finalStartDate.add(const Duration(hours: 3));
      
      print('📤 Calling repository.createEvent...');
      print('   name: ${data.title}');
      print('   category: ${data.eventType ?? 'Other'}');
      print('   startDate: $finalStartDate');
      print('   endDate: $finalEndDate');
      
      final createdEvent = await _repository.createEvent(
        name: data.title!,
        description: data.description,
        category: data.eventType ?? 'Other',
        emoji: _getEmojiForEventType(data.eventType),
        startDate: finalStartDate,
        endDate: finalEndDate,
        themeId: data.selectedThemeId,
        posterId: data.selectedPosterId,
        websiteLink: websiteLink,
        rsvpButtonText: rsvpButtonText ?? 'Celebrate With Us',
        expectedGuests: data.expectedGuests,
        budget: data.budget,
        location: data.location != null && data.location!.isNotEmpty
            ? {
                'address': data.location!,
                'latitude': 0.0,
                'longitude': 0.0,
              }
            : null,
        settings: {
          'isPublic': false,
          'keepMemoriesPrivate': false,
          'disableGuestMemories': false,
          'acceptGuestContributions': true,
          'disablePublicRSVP': false,
        },
      );
      
      print('✅ Repository returned event: ${createdEvent.id}');
      
      state = state.copyWith(
        isLoading: false,
        createdEvent: createdEvent,
      );
      
      return createdEvent;
    } catch (e, stackTrace) {
      print('❌ ViewModel.createEvent error: $e');
      print('Stack trace: $stackTrace');
      
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return null;
    }
  }
  
  DateTime _parseDateTime(DateTime date, String time) {
    // Parse time string (e.g., "14:30" or "2:30 PM")
    final timeParts = time.replaceAll(RegExp(r'[APM\s]'), '').split(':');
    int hour = int.parse(timeParts[0]);
    final minute = int.parse(timeParts[1]);
    
    // Handle PM times
    if (time.toUpperCase().contains('PM') && hour != 12) {
      hour += 12;
    }
    
    return DateTime(date.year, date.month, date.day, hour, minute);
  }
  
  String _getEmojiForEventType(String? eventType) {
    switch (eventType?.toLowerCase()) {
      case 'wedding':
        return '💒';
      case 'birthday':
        return '🎂';
      case 'conference':
        return '🎤';
      case 'party':
        return '🎉';
      case 'meeting':
        return '👥';
      default:
        return '🎊';
    }
  }
  
  String _getColorTheme(String? themeId) {
    // Map theme IDs to color names
    switch (themeId) {
      case 'theme_1':
        return 'green';
      case 'theme_2':
        return 'blue';
      case 'theme_3':
        return 'purple';
      case 'theme_4':
        return 'orange';
      default:
        return 'green';
    }
  }
  
  String _generateWebsiteLink(String title) {
    // Generate URL-friendly link from title
    return title
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');
  }

  // Reset
  void reset() {
    state = EventCreationState(
      eventData: const EventCreationEntity(),
      currentStep: 0,
    );
  }
}
