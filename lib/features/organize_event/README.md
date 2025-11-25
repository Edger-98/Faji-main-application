# Organize Event Feature

## Overview
Multi-step event creation flow with co-host marketplace integration. Users can create events through a guided 4-step process with optional vendor/co-host discovery.

## Architecture
Follows Clean Architecture pattern with Domain, Data, and Presentation layers.

## Features Implemented

### Phase 1: Event Creation Flow ✅ COMPLETE

#### 4-Step Creation Process:

**Step 1: Event Details** (`event_details_screen.dart`)
- Event title
- Description (with word count)
- Cover photo upload
- Event date (date picker)
- Event time (time picker)
- Location
- Form validation before proceeding

**Step 2: Event Configuration** (`event_config_screen.dart`)
- Expected number of guests (numeric input)
- Budget estimation (₦)
- Feature toggles:
  - Enable Wishlist Feature 🎁
  - Enable Budget Tracking
  - Enable Vendors/Co-host Marketplace
- Previous/Continue navigation

**Step 3: Poster Selection** (`event_poster_screen.dart`)
- Grid of poster templates
- Visual selection with checkmark indicator
- 6 pre-designed poster options
- Selected poster highlighted with border

**Step 4: Theme Selection** (`event_theme_screen.dart`)
- Grid of color themes
- Gradient-based theme cards
- 10 theme options
- Final "Create Event" button
- Loading state during creation

## File Structure

```
lib/features/organize_event/
├── domain/
│   └── entities/
│       ├── event_creation_entity.dart          # Main event data entity
│       ├── poster_template_entity.dart         # Poster template entity
│       └── theme_entity.dart                   # Theme entity
├── presentation/
│   ├── screens/
│   │   ├── event_creation_flow_screen.dart     # Main coordinator
│   │   ├── event_details_screen.dart           # Step 1
│   │   ├── event_config_screen.dart            # Step 2
│   │   ├── event_poster_screen.dart            # Step 3
│   │   ├── event_theme_screen.dart             # Step 4
│   │   └── organize_event_screen.dart          # Legacy (single screen)
│   ├── viewmodels/
│   │   └── event_creation_viewmodel.dart       # State management
│   ├── providers/
│   │   └── event_creation_providers.dart       # Riverpod providers
│   └── widgets/
│       ├── step_progress_indicator.dart        # Progress bar (X/4)
│       └── feature_toggle_card.dart            # Toggle switch cards
└── organize_event.dart                         # Feature exports
```

## State Management

### EventCreationViewModel
Manages the entire event creation flow state using Riverpod StateNotifier.

**State Properties:**
- `eventData`: EventCreationEntity - All form data
- `currentStep`: int - Current step (0-3)
- `isLoading`: bool - Loading state
- `error`: String? - Error message

**Methods:**
- `updateTitle()`, `updateDescription()`, etc. - Update form fields
- `toggleWishlist()`, `toggleBudgetTracking()`, `toggleCohostMarketplace()` - Toggle features
- `selectPoster()`, `selectTheme()` - Select visual elements
- `nextStep()`, `previousStep()`, `goToStep()` - Navigation
- `canProceedFromStepX()` - Validation
- `createEvent()` - Submit event
- `reset()` - Clear state

## Usage

### Navigate to Event Creation Flow:
```dart
context.push('/event-creation-flow');
// or
context.pushNamed('event-creation-flow');
```

### Access ViewModel:
```dart
// In a ConsumerWidget
final state = ref.watch(eventCreationViewModelProvider);
final viewModel = ref.read(eventCreationViewModelProvider.notifier);

// Update data
viewModel.updateTitle('My Event');
viewModel.toggleCohostMarketplace(true);

// Navigate
viewModel.nextStep();
```

## Design System Integration

### Colors
- Primary: `AppColors.primary` (#FD99C9)
- Background: `AppColors.background` (#1F1F1F)
- Surface: `AppColors.surfaceContainerHighest`
- Text: `AppColors.onSurface`, `AppColors.onSurfaceVariant`

### Typography
- Display: `AppText.displayLarge()` - Neue Haas Display Pro
- Body: `AppText.bodyMedium()` - PP Neue Montreal
- Labels: `AppText.labelLarge()` - Buttons

### Components
- `AppTextField` - Standardized input fields
- `StepProgressIndicator` - Progress bar with step count
- `FeatureToggleCard` - Toggle switches with descriptions

## Validation Rules

### Step 1 (Event Details):
- Title: Required, non-empty
- Description: Required, non-empty
- Event Date: Required
- Event Time: Required
- Location: Required, non-empty

### Step 2 (Configuration):
- Expected Guests: Required, > 0

### Step 3 (Poster):
- Selected Poster: Required

### Step 4 (Theme):
- Selected Theme: Required

## Next Steps (Phase 2)

### Co-Host Marketplace Integration
When `enableCohostMarketplace` is toggled ON in Step 2:
- After Step 2, navigate to Resource Categories screen
- Allow host to browse and select co-hosts
- Integrate negotiation and booking flow
- Return to Step 3 (Poster) after co-host selection

### Backend Integration
- Connect to event creation API
- Upload cover photos
- Save event data
- Handle API errors
- Success/failure feedback

### Enhancements
- Image upload for cover photos
- Location autocomplete/map picker
- Ticket tier management
- Event preview before creation
- Draft saving
- Edit existing events

## API Integration (TODO)

### Expected Endpoints:
```
POST /api/events/create
Body: {
  title: string,
  description: string,
  coverPhoto: file,
  eventDate: datetime,
  eventTime: string,
  location: string,
  expectedGuests: int,
  budget: double,
  enableWishlist: bool,
  enableBudgetTracking: bool,
  enableCohostMarketplace: bool,
  posterId: string,
  themeId: string,
  cohostIds: string[]
}

Response: {
  eventId: string,
  status: string,
  message: string
}
```

## Testing

### Manual Testing Checklist:
- [ ] Navigate through all 4 steps
- [ ] Back button works on each step
- [ ] Progress indicator updates correctly
- [ ] Form validation prevents invalid submissions
- [ ] Date/time pickers work
- [ ] Toggle switches update state
- [ ] Poster selection highlights correctly
- [ ] Theme selection highlights correctly
- [ ] Create Event button shows loading
- [ ] Success message appears
- [ ] Navigation to home after creation

## Known Issues
- Cover photo upload not implemented (placeholder only)
- Mock data for posters and themes (needs API)
- Event creation API call is simulated
- No draft saving functionality
- No edit mode for existing events

## Dependencies
- `flutter_riverpod` - State management
- `freezed` - Immutable entities
- `go_router` - Navigation
- `flutter_screenutil` - Responsive sizing

## Version History
- **v1.0.0** (Nov 2025) - Initial 4-step event creation flow
  - Event details screen
  - Configuration with feature toggles
  - Poster selection
  - Theme selection
  - State management with Riverpod
  - Form validation
  - Progress indicator
