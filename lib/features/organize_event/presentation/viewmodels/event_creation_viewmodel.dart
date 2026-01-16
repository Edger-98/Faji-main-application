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

  void updateLocalImagePath(String path) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(localImagePath: path),
    );
  }
  
  void updateImageUrl(String url) {
    state = state.copyWith(
      eventData: state.eventData.copyWith(imageUrl: url),
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

  // Image upload removed poster/theme selection

  // Navigation (now only 3 steps: 0=Type, 1=Details, 2=Config)
  void nextStep() {
    if (state.currentStep < 2) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void goToStep(int step) {
    if (step >= 0 && step <= 2) {
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
      
      // Validate required fields with detailed error messages
      if (data.title == null || data.title!.isEmpty) {
        final errorMsg = 'Event title is required';
        print('❌ Validation error: $errorMsg');
        state = state.copyWith(isLoading: false, error: errorMsg);
        return null;
      }
      
      if (data.eventDate == null) {
        final errorMsg = 'Event date is required';
        print('❌ Validation error: $errorMsg');
        state = state.copyWith(isLoading: false, error: errorMsg);
        return null;
      }
      
      if (data.expectedGuests == null || data.expectedGuests! <= 0) {
        final errorMsg = 'Expected guests must be greater than 0';
        print('❌ Validation error: $errorMsg');
        state = state.copyWith(isLoading: false, error: errorMsg);
        return null;
      }
      
      final DateTime finalStartDate = startDate ?? data.eventDate!;
      final DateTime finalEndDate = endDate ?? finalStartDate.add(const Duration(hours: 3));
      
      print('📤 Calling repository.createEvent...');
      print('   name: ${data.title}');
      print('   category: ${data.eventType ?? 'Other'}');
      print('   startDate: $finalStartDate');
      print('   endDate: $finalEndDate');
      print('   expectedGuests: ${data.expectedGuests}');
      print('   imageUrl: ${data.imageUrl ?? "none"}');
      
      final createdEvent = await _repository.createEvent(
        name: data.title!,
        description: data.description,
        category: data.eventType ?? 'Other',
        emoji: _getEmojiForEventType(data.eventType),
        startDate: finalStartDate,
        endDate: finalEndDate,
        imageUrl: data.imageUrl, // NEW: Cloudinary image URL
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
        ticketing: (data.ticketPrice != null && data.ticketPrice! > 0) || (data.totalSeats != null && data.totalSeats! > 0)
            ? {
                'enabled': true,
                'types': [
                  {
                    'name': 'General Admission',
                    'price': data.ticketPrice ?? 0.0,
                    'quantity': data.totalSeats ?? data.expectedGuests ?? 100,
                    'description': 'Standard entry ticket',
                  }
                ],
              }
            : null,
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
      
      // Extract meaningful error message
      String errorMessage = 'Failed to create event';
      if (e.toString().contains('SocketException') || e.toString().contains('Connection')) {
        errorMessage = 'Network error. Please check your connection.';
      } else if (e.toString().contains('401') || e.toString().contains('Unauthorized')) {
        errorMessage = 'Session expired. Please login again.';
      } else if (e.toString().contains('400') || e.toString().contains('Bad Request')) {
        errorMessage = 'Invalid event data. Please check all fields.';
      } else if (e.toString().contains('500')) {
        errorMessage = 'Server error. Please try again later.';
      } else if (e.toString().contains('timeout')) {
        errorMessage = 'Request timeout. Please try again.';
      } else {
        // Try to extract error message from exception
        final match = RegExp(r'Exception: (.+)').firstMatch(e.toString());
        if (match != null) {
          errorMessage = match.group(1) ?? errorMessage;
        }
      }
      
      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
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
