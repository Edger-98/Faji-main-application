# Event Creation Flow - Visual Diagram

## 📱 Complete User Journey

```
┌─────────────────────────────────────────────────────────────────┐
│                     EVENT CREATION FLOW                         │
│                    (4-Step Process)                             │
└─────────────────────────────────────────────────────────────────┘

                              START
                                │
                                ▼
┌───────────────────────────────────────────────────────────────────┐
│                        STEP 1/4                                   │
│                   EVENT DETAILS SCREEN                            │
├───────────────────────────────────────────────────────────────────┤
│  Progress: ████░░░░░░░░ 1/4                                      │
│                                                                   │
│  📝 Event Title: [_____________________]                         │
│  📄 Description: [                    ] (0-500 words)            │
│  📷 Cover Photo: [Upload]                                        │
│  📅 Event Date: [DD/MM/YYYY] 📆                                  │
│  🕐 Event Time: [HH:MM]                                          │
│  📍 Location: [_____________________] 📍                         │
│                                                                   │
│  Validation: All fields required                                 │
│                                                                   │
│                    [Continue →]                                   │
└───────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌───────────────────────────────────────────────────────────────────┐
│                        STEP 2/4                                   │
│                EVENT CONFIGURATION SCREEN                         │
├───────────────────────────────────────────────────────────────────┤
│  Progress: ████████░░░░ 2/4                                      │
│                                                                   │
│  👥 Expected Guests: [_____] 0                                   │
│  💰 Budget (₦): [_____] 0                                        │
│                                                                   │
│  Features you might need:                                         │
│                                                                   │
│  ┌─────────────────────────────────────────────┐                │
│  │ 🎁 Enable Wishlist Feature          [ON/OFF]│                │
│  │ Let guests know what you'd love to receive  │                │
│  └─────────────────────────────────────────────┘                │
│                                                                   │
│  ┌─────────────────────────────────────────────┐                │
│  │ 💵 Enable Budget Feature            [ON/OFF]│                │
│  │ Create & manage a budget for your event     │                │
│  └─────────────────────────────────────────────┘                │
│                                                                   │
│  ┌─────────────────────────────────────────────┐                │
│  │ 🛒 Enable Vendors Feature           [ON/OFF]│ ⭐ KEY TOGGLE  │
│  │ Find & manage vendors, order drinks, food   │                │
│  └─────────────────────────────────────────────┘                │
│                                                                   │
│  Validation: Expected guests > 0                                 │
│                                                                   │
│         [← Previous]      [Continue →]                           │
└───────────────────────────────────────────────────────────────────┘
                                │
                                ▼
                    ┌───────────────────────┐
                    │ Vendors Toggle ON?    │
                    └───────────────────────┘
                         │           │
                      YES│           │NO
                         │           │
                         ▼           ▼
        ┌────────────────────┐      │
        │   PHASE 2 FLOW     │      │
        │  (Not Yet Built)   │      │
        ├────────────────────┤      │
        │ 1. Categories      │      │
        │ 2. Co-Host List    │      │
        │ 3. Profile View    │      │
        │ 4. Negotiation     │      │
        └────────────────────┘      │
                 │                  │
                 └──────────────────┘
                         │
                         ▼
┌───────────────────────────────────────────────────────────────────┐
│                        STEP 3/4                                   │
│                  POSTER SELECTION SCREEN                          │
├───────────────────────────────────────────────────────────────────┤
│  Progress: ████████████░ 3/4                                     │
│                                                                   │
│  Choose your poster!                                              │
│  Select a poster for your event that guests will see             │
│                                                                   │
│  ┌─────────┐  ┌─────────┐                                       │
│  │ Poster  │  │ Poster  │                                       │
│  │   1     │  │   2  ✓  │ ← Selected                            │
│  └─────────┘  └─────────┘                                       │
│                                                                   │
│  ┌─────────┐  ┌─────────┐                                       │
│  │ Poster  │  │ Poster  │                                       │
│  │   3     │  │   4     │                                       │
│  └─────────┘  └─────────┘                                       │
│                                                                   │
│  ┌─────────┐  ┌─────────┐                                       │
│  │ Poster  │  │ Poster  │                                       │
│  │   5     │  │   6     │                                       │
│  └─────────┘  └─────────┘                                       │
│                                                                   │
│  Validation: Must select a poster                                │
│                                                                   │
│                    [Continue →]                                   │
└───────────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌───────────────────────────────────────────────────────────────────┐
│                        STEP 4/4                                   │
│                   THEME SELECTION SCREEN                          │
├───────────────────────────────────────────────────────────────────┤
│  Progress: ████████████████ 4/4                                  │
│                                                                   │
│  Choose your party's theme                                        │
│  Swipe through stunning themes and customize the feel            │
│                                                                   │
│  ┌─────────┐  ┌─────────┐                                       │
│  │ Theme   │  │ Theme   │                                       │
│  │   1     │  │   2     │                                       │
│  └─────────┘  └─────────┘                                       │
│                                                                   │
│  ┌─────────┐  ┌─────────┐                                       │
│  │ Theme   │  │ Theme   │                                       │
│  │   3  ✓  │  │   4     │ ← Selected                            │
│  └─────────┘  └─────────┘                                       │
│                                                                   │
│  ┌─────────┐  ┌─────────┐                                       │
│  │ Theme   │  │ Theme   │                                       │
│  │   5     │  │   6     │                                       │
│  └─────────┘  └─────────┘                                       │
│                                                                   │
│  Pick a design that sets the tone for your event                 │
│                                                                   │
│  Validation: Must select a theme                                 │
│                                                                   │
│                  [Create Event]                                   │
└───────────────────────────────────────────────────────────────────┘
                                │
                                ▼
                    ┌───────────────────────┐
                    │   Loading...          │
                    │   Creating event...   │
                    └───────────────────────┘
                                │
                                ▼
                    ┌───────────────────────┐
                    │   ✅ Success!         │
                    │   Event created!      │
                    └───────────────────────┘
                                │
                                ▼
                    ┌───────────────────────┐
                    │   Navigate to Home    │
                    └───────────────────────┘
                                │
                                ▼
                              END
```

---

## 🔄 State Flow

```
EventCreationViewModel State:
┌──────────────────────────────────────────────────────────────┐
│ EventCreationState                                           │
├──────────────────────────────────────────────────────────────┤
│ • eventData: EventCreationEntity                             │
│   ├─ title: String?                                          │
│   ├─ description: String?                                    │
│   ├─ coverPhotoPath: String?                                │
│   ├─ eventDate: DateTime?                                   │
│   ├─ eventTime: String?                                     │
│   ├─ location: String?                                      │
│   ├─ totalSeats: int?                                       │
│   ├─ ticketPrice: double?                                   │
│   ├─ expectedGuests: int?                                   │
│   ├─ budget: double?                                        │
│   ├─ enableWishlist: bool (default: false)                 │
│   ├─ enableBudgetTracking: bool (default: false)           │
│   ├─ enableCohostMarketplace: bool (default: false) ⭐     │
│   ├─ selectedPosterId: String?                             │
│   ├─ selectedThemeId: String?                              │
│   └─ selectedCohostIds: List<String>? (Phase 2)            │
│                                                              │
│ • currentStep: int (0-3)                                     │
│ • isLoading: bool                                            │
│ • error: String?                                             │
└──────────────────────────────────────────────────────────────┘

State Updates:
Step 1 → updateTitle(), updateDescription(), updateEventDate(), etc.
Step 2 → updateExpectedGuests(), updateBudget(), toggleWishlist(), etc.
Step 3 → selectPoster()
Step 4 → selectTheme()

Navigation:
nextStep() → currentStep++
previousStep() → currentStep--
goToStep(n) → currentStep = n

Validation:
canProceedFromStep1() → Check required fields
canProceedFromStep2() → Check expectedGuests > 0
canProceedFromStep3() → Check selectedPosterId != null
canProceedFromStep4() → Check selectedThemeId != null

Submission:
createEvent() → API call → Success → reset() → navigate home
```

---

## 🎨 Screen Transitions

```
┌─────────────┐
│   Step 1    │
│  (Details)  │
└──────┬──────┘
       │ Continue (validated)
       ▼
┌─────────────┐
│   Step 2    │ ◄─── Back button
│  (Config)   │
└──────┬──────┘
       │ Continue (validated)
       │
       ├─── IF enableCohostMarketplace == true
       │    └─── [Phase 2: Co-host Flow]
       │         └─── Return here
       │
       ▼
┌─────────────┐
│   Step 3    │ ◄─── Back button
│  (Poster)   │
└──────┬──────┘
       │ Continue (validated)
       ▼
┌─────────────┐
│   Step 4    │ ◄─── Back button
│  (Theme)    │
└──────┬──────┘
       │ Create Event
       ▼
┌─────────────┐
│   Loading   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Success   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│    Home     │
└─────────────┘
```

---

## 🔌 Integration Points

### Current Integration:
```
Home Screen
    │
    ├─ "Create Event" button
    │       │
    │       ▼
    └─ context.push('/event-creation-flow')
            │
            ▼
    EventCreationFlowScreen (Coordinator)
            │
            ├─ Step 0 → EventDetailsScreen
            ├─ Step 1 → EventConfigScreen
            ├─ Step 2 → EventPosterScreen
            └─ Step 3 → EventThemeScreen
```

### Phase 2 Integration (Planned):
```
EventConfigScreen (Step 2)
    │
    ├─ enableCohostMarketplace == true
    │       │
    │       ▼
    └─ Navigate to ResourceCategoriesScreen
            │
            ├─ Select Category
            │       │
            │       ▼
            └─ CohostListScreen
                    │
                    ├─ View Profile
                    │       │
                    │       ▼
                    └─ CohostProfileScreen
                            │
                            ├─ Request Co-host
                            │       │
                            │       ▼
                            └─ NegotiationScreen
                                    │
                                    ├─ Agree on terms
                                    │       │
                                    │       ▼
                                    └─ Return to EventPosterScreen (Step 3)
```

---

## 📊 Data Flow

```
User Input → ViewModel → State Update → UI Re-render

Example: User enters event title
┌──────────────┐
│ User types   │
│ "My Event"   │
└──────┬───────┘
       │
       ▼
┌──────────────────────────────────────┐
│ TextField.onChanged()                │
│ → viewModel.updateTitle("My Event")  │
└──────┬───────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────┐
│ EventCreationViewModel               │
│ state = state.copyWith(              │
│   eventData: eventData.copyWith(     │
│     title: "My Event"                │
│   )                                  │
│ )                                    │
└──────┬───────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────┐
│ Riverpod notifies listeners          │
└──────┬───────────────────────────────┘
       │
       ▼
┌──────────────────────────────────────┐
│ UI rebuilds with new state           │
│ (if watching the state)              │
└──────────────────────────────────────┘
```

---

## 🎯 Key Features Highlighted

### ✅ Implemented:
- [x] 4-step guided flow
- [x] Progress indicator (X/4)
- [x] Form validation at each step
- [x] Date/time pickers
- [x] Feature toggles (3 toggles)
- [x] Visual selection (posters & themes)
- [x] Back navigation
- [x] Loading states
- [x] Success feedback
- [x] State persistence across steps
- [x] Clean Architecture
- [x] Riverpod state management
- [x] Responsive design

### 🔜 Phase 2 (Co-Host Marketplace):
- [ ] Resource categories screen
- [ ] Co-host discovery
- [ ] Profile viewing
- [ ] Price negotiation
- [ ] Booking system
- [ ] Escrow payments
- [ ] Ratings & reviews

---

## 🚀 Quick Start

### 1. Navigate to Flow:
```dart
context.push('/event-creation-flow');
```

### 2. Access State:
```dart
final state = ref.watch(eventCreationViewModelProvider);
```

### 3. Update Data:
```dart
final viewModel = ref.read(eventCreationViewModelProvider.notifier);
viewModel.updateTitle('My Event');
```

### 4. Navigate Steps:
```dart
viewModel.nextStep();
viewModel.previousStep();
```

### 5. Submit:
```dart
await viewModel.createEvent();
```

---

**Status**: ✅ Phase 1 Complete  
**Ready for**: Phase 2 (Co-Host Marketplace)  
**Date**: November 23, 2025
