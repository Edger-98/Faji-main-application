# Terminology Update Guide

## Overview
This document outlines the mandatory terminology changes required for the Faji MVP specification compliance.

## Terminology Changes

| Old Term | New Term | Context |
|----------|----------|---------|
| Organizer | Host | Person who creates/manages events |
| Creator | Host | Alternative term for event creator |
| Co-Planner | Co-Host | Person who helps manage events |
| organizer | host | Lowercase usage in code |
| creator | host | Lowercase usage in code |
| co-planner | co-host | Lowercase usage in code |

## Files Requiring Updates

### 1. Domain Entities

#### `lib/features/events/domain/entities/event_entity.dart`
```dart
// BEFORE
@freezed
class EventEntity with _$EventEntity {
  const factory EventEntity({
    required String id,
    required String title,
    required String description,
    required String organizerId,      // ❌ Change to hostId
    required String organizerName,    // ❌ Change to hostName
    String? organizerImage,           // ❌ Change to hostImage
    // ...
  }) = _EventEntity;
}

// AFTER
@freezed
class EventEntity with _$EventEntity {
  const factory EventEntity({
    required String id,
    required String title,
    required String description,
    required String hostId,           // ✅
    required String hostName,         // ✅
    String? hostImage,                // ✅
    // ...
  }) = _EventEntity;
}
```

### 2. Data Models

#### `lib/features/events/data/models/event_model.dart`
```dart
// Update all field names
final String organizerId → final String hostId
final String organizerName → final String hostName
final String? organizerImage → final String? hostImage

// Update JSON mapping
'organizer_id' → 'host_id'
'organizer_name' → 'host_name'
'organizer_image' → 'host_image'
```

### 3. Repository Implementations

#### `lib/features/events/data/repositories/event_repository_impl.dart`
```dart
// Update field mappings
organizerId: host?['id'] → hostId: host?['id']
organizerName: host?['name'] → hostName: host?['name']
organizerImage: host?['avatar'] → hostImage: host?['avatar']
```

### 4. Presentation Layer

#### `lib/features/events/presentation/screens/event_details_screen.dart`
```dart
// Update UI labels
// Organizer → Host
Text('Organizer') → Text('Host')

// Update field access
event.organizerName → event.hostName
event.organizerImage → event.hostImage
```

#### `lib/features/events/presentation/screens/search_screen.dart`
```dart
// Update hint text
hintText: 'Search events, organizers, locations...'
→
hintText: 'Search events, hosts, locations...'
```

### 5. Home Widgets

#### `lib/features/home/presentation/widgets/trending_organizers_section.dart`
```dart
// Rename file to: trending_hosts_section.dart
// Update class name
class TrendingOrganizersSection → class TrendingHostsSection

// Update UI text
'Trending Organizers' → 'Trending Hosts'
```

### 6. Routing

#### `lib/core/routing/route_manager.dart`
```dart
// Update route paths
static const String organizerChat = '/organizer-chat';
→
static const String hostChat = '/host-chat';

// Update route names
static const String organizerChatName = 'organizer-chat';
→
static const String hostChatName = 'host-chat';
```

#### `lib/core/routing/app_router.dart`
```dart
// Update route definitions
GoRoute(
  path: RouteManager.organizerChat,
  name: RouteManager.organizerChatName,
  pageBuilder: (context, state) => _buildPageWithTransition(
    context,
    state,
    const OrganizerChatScreen(),  // ❌
  ),
),
→
GoRoute(
  path: RouteManager.hostChat,
  name: RouteManager.hostChatName,
  pageBuilder: (context, state) => _buildPageWithTransition(
    context,
    state,
    const HostChatScreen(),  // ✅
  ),
),
```

### 7. Chat Feature

#### `lib/features/chat/presentation/screens/organizer_chat_screen.dart`
```dart
// Rename file to: host_chat_screen.dart
// Update class name
class OrganizerChatScreen → class HostChatScreen

// Update UI text
'Chat with Organizer' → 'Chat with Host'
```

### 8. Vendor Feature

#### `lib/features/vendor/presentation/screens/vendor_registration_screen.dart`
```dart
// Update description text
'Join our marketplace and offer your services to event organizers'
→
'Join our marketplace and offer your services to event hosts'
```

## Step-by-Step Update Process

### Phase 1: Domain Layer (Critical)
1. Update `event_entity.dart`
2. Run code generation: `flutter pub run build_runner build --delete-conflicting-outputs`
3. Fix compilation errors in dependent files

### Phase 2: Data Layer
1. Update `event_model.dart`
2. Update `event_repository_impl.dart`
3. Update API field mappings
4. Test data parsing

### Phase 3: Presentation Layer
1. Update all screen files
2. Update widget files
3. Update UI text strings
4. Test UI rendering

### Phase 4: Routing
1. Update `route_manager.dart`
2. Update `app_router.dart`
3. Update `auth_guard.dart`
4. Test navigation

### Phase 5: Feature-Specific
1. Rename chat screen files
2. Update vendor registration text
3. Update home widgets
4. Test all features

## Code Generation Commands

After updating entities and models:

```bash
# Clean previous generated files
flutter clean

# Get dependencies
flutter pub get

# Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# Verify no errors
flutter analyze
```

## Testing Checklist

### Unit Tests
- [ ] Event entity serialization/deserialization
- [ ] Event model JSON parsing
- [ ] Repository data mapping

### Integration Tests
- [ ] Event creation with host info
- [ ] Event details display
- [ ] Search functionality
- [ ] Chat with host

### UI Tests
- [ ] All "Organizer" text replaced with "Host"
- [ ] All "Co-Planner" text replaced with "Co-Host"
- [ ] Navigation labels updated
- [ ] Search hints updated

## API Coordination

### Backend Changes Required
The backend API must also update field names:

```json
// OLD API Response
{
  "id": "123",
  "title": "Event Name",
  "organizer_id": "456",
  "organizer_name": "John Doe",
  "organizer_image": "url"
}

// NEW API Response
{
  "id": "123",
  "title": "Event Name",
  "host_id": "456",
  "host_name": "John Doe",
  "host_image": "url"
}
```

### Migration Strategy
1. Backend supports both old and new field names (transition period)
2. Mobile app updated to use new field names
3. Backend deprecates old field names after mobile rollout

## Search & Replace Patterns

### Safe Replacements (Case-sensitive)
```
Organizer → Host
organizer → host
Creator → Host
creator → host
Co-Planner → Co-Host
co-planner → co-host
```

### Files to Exclude
- Generated files (`.g.dart`, `.freezed.dart`) - will be regenerated
- Build files (`build/`, `.dart_tool/`)
- Documentation files (unless updating terminology)

### Regex Patterns
```regex
# Find organizer fields
\borganizer([A-Z][a-zA-Z]*)\b

# Replace with host
host$1

# Find co-planner references
\bco-?planner\b

# Replace with co-host
co-host
```

## Rollback Plan

If issues arise:
1. Revert entity changes
2. Regenerate code
3. Revert UI text changes
4. Test thoroughly before re-attempting

## Communication

### User-Facing Changes
- Update app store descriptions
- Update help documentation
- Update onboarding screens
- Update marketing materials

### Developer Communication
- Update API documentation
- Update README files
- Update code comments
- Update architecture diagrams

## Timeline Estimate

- **Phase 1 (Domain)**: 1-2 hours
- **Phase 2 (Data)**: 2-3 hours
- **Phase 3 (Presentation)**: 3-4 hours
- **Phase 4 (Routing)**: 1 hour
- **Phase 5 (Features)**: 2-3 hours
- **Testing**: 2-3 hours
- **Total**: 11-16 hours

## Notes

- This is a breaking change requiring careful coordination
- All changes must be made atomically to avoid inconsistencies
- Thorough testing required before deployment
- Consider feature flag for gradual rollout
- Monitor crash reports after deployment
