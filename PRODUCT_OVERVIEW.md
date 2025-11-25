# Faji Mobile App - Product Overview

**Role**: Senior Product Manager  
**Last Updated**: November 19, 2025  
**Project Status**: Active Development - MVP Phase

---

## 🎯 Executive Summary

Faji is an **enterprise-grade event ticketing and management mobile application** built with Flutter. The app enables users to discover events, purchase tickets, organize events, and interact with event communities. We're building a comprehensive platform that connects event attendees with organizers through a seamless, modern mobile experience.

**Current Phase**: Multi-step registration flow complete, core features in development  
**Architecture**: Clean Architecture with Riverpod state management  
**Target Platforms**: iOS & Android

---

## 📱 Product Vision

**Mission**: Voyage through virtual tickets - Making event discovery and ticketing seamless, social, and delightful.

**Core Value Propositions**:
- **For Attendees**: Discover trending events, purchase tickets securely, manage your event calendar
- **For Organizers**: Create and manage events, sell tickets, engage with attendees
- **For Both**: Real-time chat, wallet management, social features

---

## ✅ What We've Built (Completed Features)

### 1. **Authentication & Onboarding** ✅ COMPLETE
**Status**: Fully implemented and integrated with backend API

#### Screens Delivered:
- **Splash Screen** - Animated logo with auto-navigation
- **Intro Screen** - Hero section with "Voyage through virtual tickets" messaging
- **Multi-Step Registration Flow** (5 steps):
  1. Email input with validation
  2. OTP verification (6-digit PIN)
  3. Phone number with country picker
  4. Name collection (first & last)
  5. Password creation with role selection

#### Technical Implementation:
- ✅ Clean Architecture (Domain → Data → Presentation layers)
- ✅ 5 domain entities created
- ✅ 5 use cases implemented
- ✅ 5 API endpoints integrated
- ✅ Token-based flow (sessionId → registrationToken → authToken)
- ✅ Riverpod state management
- ✅ Secure storage integration
- ✅ Form validation with real-time feedback
- ✅ Error handling with user-friendly messages
- ✅ Smooth page transitions (fade, slide, scale)

#### API Flow:
```
POST /api/auth/register/email          → sessionId
POST /api/auth/register/verify-otp     → registrationToken
POST /api/auth/register/phone          → updated registrationToken
POST /api/auth/register/name           → updated registrationToken
POST /api/auth/register/complete       → authToken + user data
```

**Documentation**: See `REGISTRATION_FLOW_IMPLEMENTATION.md` and `REGISTRATION_SCREENS_INTEGRATION.md`

---

### 2. **Home Dashboard** ✅ COMPLETE (UI)
**Status**: UI complete, needs backend integration

#### Features Delivered:
- **Bottom Navigation** - 5 tabs with blur effect (Home, Search, Tickets, Messages, Profile)
- **Home Header** - Personalized greeting + notification bell
- **Search Bar** - With filter functionality
- **Trending Events** - Horizontal scrollable cards with live badges
- **Category Filter** - All, Concert, Sports, Music, Artist
- **Upcoming Events** - Grid layout with date badges
- **Flash Deals** - Promotional cards with countdown timers
- **Your Events** - User's registered events
- **Trending Organizers** - Profile cards with gradient overlays

#### Design System:
- ✅ Figma design compliance (node-id: 2-648)
- ✅ Custom color palette (Primary: #FD99C9, Background: #1F1F1F)
- ✅ Typography: Neue Haas Grotesk Display Pro + PP Neue Montreal
- ✅ Backdrop blur effects (40px sigma)
- ✅ Responsive design with ScreenUtil

**Documentation**: See `lib/features/home/README.md`

---

### 3. **Core Infrastructure** ✅ COMPLETE

#### Architecture Components:
- **Clean Architecture** - Separation of concerns (Domain, Data, Presentation)
- **State Management** - Riverpod with providers
- **Networking** - Dio + Retrofit for API calls
- **Routing** - GoRouter with custom transitions
- **Error Handling** - Centralized failure handling
- **Storage** - FlutterSecureStorage + SharedPreferences
- **Environment Config** - Multi-environment support (.env files)

#### Design System:
- **Colors** - Comprehensive color palette with semantic naming
- **Typography** - Custom font families with weight variants
- **Components** - Reusable UI components (buttons, text fields, cards)
- **Spacing** - Consistent spacing system
- **Animations** - Smooth transitions and micro-interactions

#### Services:
- **Toast Service** - User notifications
- **Bottom Sheet Service** - Modal presentations
- **Logger** - Debug and error logging
- **Validators** - Form validation utilities
- **Formatters** - Data formatting helpers

---

## 🚧 What We're Building (In Progress)

### 1. **Events Feature** 🔨 IN PROGRESS
**Priority**: HIGH

#### Planned Screens:
- ✅ Events List Screen - Browse all events
- ✅ Event Details Screen - Full event information
- ✅ Search Screen - Filter and search events
- ✅ My Events Screen - User's registered events
- ✅ Favorites Screen - Bookmarked events

#### Backend Integration Needed:
- [ ] Connect to events API endpoints
- [ ] Implement event filtering and search
- [ ] Add favorite/bookmark persistence
- [ ] Implement pull-to-refresh
- [ ] Add skeleton loaders for async data

**Current Status**: UI screens created, awaiting API integration

---

### 2. **Tickets Feature** 🔨 IN PROGRESS
**Priority**: HIGH

#### Screens:
- ✅ My Tickets Screen - View purchased tickets
- ✅ Ticket Information Screen - Ticket details
- ✅ Buy Ticket Screen - Ticket purchase flow
- ✅ Make Payment Screen - Payment processing
- ✅ Payment Successful Screen - Confirmation

#### Needs:
- [ ] Payment gateway integration
- [ ] QR code generation for tickets
- [ ] Ticket validation system
- [ ] Refund/cancellation flow

---

### 3. **Wallet Feature** 🔨 IN PROGRESS
**Priority**: MEDIUM

#### Screens:
- ✅ Balance Detail Screen - View wallet balance
- ✅ Enter Withdrawal Amount Screen
- ✅ Review Withdrawal Screen
- ✅ Withdrawal Confirmation Screen
- ✅ Transaction History Screen

#### Needs:
- [ ] Backend API integration
- [ ] Payment method management
- [ ] Transaction receipts
- [ ] Security features (PIN/biometric)

---

### 4. **Profile & Settings** 🔨 IN PROGRESS
**Priority**: MEDIUM

#### Screens:
- ✅ Profile Screen - User profile view
- ✅ Account Settings Screen - Edit profile
- ✅ Support Screen - Help and support
- ✅ Terms Screen - Terms and conditions

#### Needs:
- [ ] Profile editing functionality
- [ ] Avatar upload
- [ ] Notification preferences
- [ ] Privacy settings
- [ ] Account deletion

---

### 5. **Chat Feature** 🔨 IN PROGRESS
**Priority**: MEDIUM

#### Screens:
- ✅ Chat List Screen - All conversations
- ✅ Chat Detail Screen - Message thread
- ✅ Organizer Chat Screen - Chat with event organizers

#### Needs:
- [ ] Real-time messaging (WebSocket/Firebase)
- [ ] Message persistence
- [ ] Push notifications
- [ ] Image/file sharing
- [ ] Read receipts

---

### 6. **Organize Event Feature** ✅ COMPLETE (UI Flow)
**Priority**: MEDIUM

#### Screens Delivered:
- ✅ Event Creation Flow (4-step process)
  - Step 1: Event Details Screen - Title, description, date, time, location
  - Step 2: Event Configuration Screen - Guests, budget, feature toggles
  - Step 3: Poster Selection Screen - Visual poster templates
  - Step 4: Theme Selection Screen - Color themes
- ✅ Legacy Organize Event Screen - Single-page form (kept for backward compatibility)

#### Technical Implementation:
- ✅ Clean Architecture (Domain entities, ViewModels, Providers)
- ✅ Riverpod state management
- ✅ Multi-step navigation with progress indicator
- ✅ Form validation at each step
- ✅ Feature toggles (Wishlist, Budget Tracking, Co-host Marketplace)
- ✅ Date/time pickers
- ✅ Visual selection for posters and themes

#### Backend Integration Needed:
- [ ] Connect to event creation API
- [ ] Image upload for event cover photos
- [ ] Poster and theme data from backend
- [ ] Event preview functionality
- [ ] Draft saving

#### Future Enhancements:
- [ ] Ticket tier management
- [ ] Event analytics dashboard
- [ ] Attendee management
- [ ] Co-host marketplace integration (Phase 2)

---

## 📋 Planned Features (Backlog)

### Phase 2 Features:

1. **Social Features**
   - [ ] User profiles with followers/following
   - [ ] Event sharing to social media
   - [ ] Friend invitations
   - [ ] Activity feed

2. **Enhanced Discovery**
   - [ ] Personalized recommendations
   - [ ] Location-based event discovery
   - [ ] Calendar integration
   - [ ] Event reminders

3. **Organizer Tools**
   - [ ] Event analytics and insights
   - [ ] Attendee check-in system
   - [ ] Promotional tools
   - [ ] Revenue reports

4. **Advanced Ticketing**
   - [ ] Group ticket purchases
   - [ ] Ticket transfers
   - [ ] Waitlist management
   - [ ] Early bird pricing

5. **Notifications**
   - [ ] Push notifications (Firebase)
   - [ ] In-app notifications
   - [ ] Email notifications
   - [ ] SMS notifications

---

## 🏗️ Technical Architecture

### Architecture Pattern: Clean Architecture

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (Screens, Widgets, ViewModels)         │
│         ↓ Riverpod Providers            │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│          Domain Layer                   │
│  (Entities, Use Cases, Repositories)    │
│         ↓ Business Logic                │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│           Data Layer                    │
│  (Models, Datasources, Repositories)    │
│         ↓ API Calls                     │
└─────────────────────────────────────────┘
                    ↓
              Backend API
```

### Key Technologies:

**Framework**: Flutter 3.8.1  
**State Management**: Riverpod 2.5.1  
**Navigation**: GoRouter 14.6.2  
**Networking**: Dio 5.7.0 + Retrofit 4.4.1  
**Storage**: FlutterSecureStorage 9.2.2 + SharedPreferences 2.3.2  
**Code Generation**: Freezed 2.5.7 + JsonSerializable 6.8.0  
**Firebase**: Core, Messaging, Analytics, Crashlytics  
**UI**: ScreenUtil 5.9.3 for responsive design

---

## 📊 Feature Completion Status

| Feature | Status | Completion | Priority |
|---------|--------|------------|----------|
| Authentication | ✅ Complete | 100% | HIGH |
| Home Dashboard | ✅ Complete (UI) | 80% | HIGH |
| Core Infrastructure | ✅ Complete | 100% | HIGH |
| Events | 🔨 In Progress | 60% | HIGH |
| Tickets | 🔨 In Progress | 50% | HIGH |
| Wallet | 🔨 In Progress | 40% | MEDIUM |
| Profile | 🔨 In Progress | 40% | MEDIUM |
| Chat | 🔨 In Progress | 30% | MEDIUM |
| Organize Event | 🔨 In Progress | 20% | MEDIUM |
| Social Features | 📋 Planned | 0% | LOW |
| Notifications | 📋 Planned | 0% | MEDIUM |

**Overall Project Completion**: ~45%

---

## 🎯 Next Sprint Priorities

### Sprint Goal: Complete Core User Journey

#### Must Have (P0):
1. **Events API Integration** - Connect events list, details, search to backend
2. **Ticket Purchase Flow** - Complete end-to-end ticket buying
3. **User Authentication Persistence** - Keep users logged in
4. **Profile Management** - Allow users to edit their profiles

#### Should Have (P1):
5. **Favorites/Bookmarks** - Save events for later
6. **Wallet Integration** - Connect wallet to payment system
7. **Push Notifications** - Firebase messaging setup
8. **Error Handling** - Improve error messages and recovery

#### Nice to Have (P2):
9. **Chat Implementation** - Real-time messaging
10. **Event Creation** - Complete organizer flow
11. **Analytics** - Track user behavior
12. **Performance Optimization** - Image caching, lazy loading

---

## 🔐 Security & Compliance

### Implemented:
- ✅ Secure token storage (FlutterSecureStorage)
- ✅ HTTPS API communication
- ✅ Input validation and sanitization
- ✅ Password strength requirements

### Planned:
- [ ] Biometric authentication
- [ ] Two-factor authentication (2FA)
- [ ] Data encryption at rest
- [ ] GDPR compliance
- [ ] Payment security (PCI DSS)
- [ ] Rate limiting
- [ ] Session management

---

## 📈 Success Metrics (KPIs)

### User Engagement:
- Daily Active Users (DAU)
- Monthly Active Users (MAU)
- Session duration
- Events viewed per session
- Ticket purchase conversion rate

### Business Metrics:
- Gross Merchandise Value (GMV)
- Average order value
- Revenue per user
- Organizer acquisition rate
- Event creation rate

### Technical Metrics:
- App crash rate
- API response time
- App load time
- Error rate
- User retention (D1, D7, D30)

---

## 🚀 Deployment Strategy

### Environments:
- **Development** (.env.dev) - Local testing
- **Staging** (.env.staging) - QA and testing
- **Production** (.env.production) - Live app

### Release Plan:
1. **Alpha** (Internal) - Team testing
2. **Beta** (Closed) - Selected users
3. **Soft Launch** - Limited regions
4. **Full Launch** - All markets

### App Stores:
- Apple App Store (iOS)
- Google Play Store (Android)

---

## 🐛 Known Issues & Technical Debt

### Current Issues:
1. Home screen needs API integration
2. Events feature missing backend connection
3. Chat feature needs real-time implementation
4. Wallet needs payment gateway integration
5. Missing error recovery flows
6. No offline support yet

### Technical Debt:
1. Need comprehensive unit tests
2. Need integration tests
3. Need E2E tests
4. Code documentation incomplete
5. Performance optimization needed
6. Accessibility improvements needed

---

## 👥 Team & Stakeholders

### Development Team:
- Flutter Developers
- Backend Engineers
- UI/UX Designers
- QA Engineers
- DevOps Engineers

### Stakeholders:
- Product Management
- Business Development
- Marketing
- Customer Support
- Legal & Compliance

---

## 📚 Documentation

### Technical Docs:
- `README.md` - Project overview
- `REGISTRATION_FLOW_IMPLEMENTATION.md` - Auth flow details
- `REGISTRATION_SCREENS_INTEGRATION.md` - Screen integration guide
- `lib/features/*/README.md` - Feature-specific documentation

### Design Resources:
- Figma Design System
- Brand Guidelines
- UI Component Library

### API Documentation:
- Backend API endpoints
- Authentication flow
- Data models
- Error codes

---

## 🎨 Design System

### Brand Colors:
- **Primary Pink**: #FD99C9
- **Background Dark**: #1F1F1F
- **Surface**: rgba(40, 40, 40, 0.81)
- **Text Primary**: #F8F8F8
- **Text Secondary**: #A1A1A1
- **Blue Accent**: #043D9E
- **Red Live**: #CA4638

### Typography:
- **Display**: Neue Haas Grotesk Display Pro (100-900 weights)
- **Body**: PP Neue Montreal (100-700 weights)

### Components:
- AuthButton - Primary CTA button
- AppTextField - Input fields
- EventCard - Event display cards
- OrganizerCard - Organizer profiles
- BackButtonWidget - Navigation
- PinInputWidget - OTP input

---

## 🔮 Future Vision

### Long-term Goals:
1. **AI-Powered Recommendations** - Personalized event discovery
2. **AR Venue Preview** - Virtual venue tours
3. **Live Streaming** - Hybrid events support
4. **NFT Tickets** - Blockchain-based ticketing
5. **Multi-language Support** - Global expansion
6. **Accessibility Features** - WCAG compliance
7. **Web Platform** - Cross-platform expansion
8. **API for Partners** - Third-party integrations

---

## 📞 Contact & Resources

### Project Links:
- Repository: [Internal Git]
- Figma: [Design Files]
- API Docs: [Backend Documentation]
- Jira: [Project Board]
- Slack: #faji-mobile-app

### Key Contacts:
- Product Manager: [Name]
- Tech Lead: [Name]
- Design Lead: [Name]
- Backend Lead: [Name]

---

## 📝 Change Log

### November 2025:
- ✅ Completed multi-step registration flow
- ✅ Integrated all 5 registration screens with backend
- ✅ Built home dashboard UI
- ✅ Established core infrastructure
- ✅ Created design system components

### Upcoming:
- 🔨 Events API integration
- 🔨 Ticket purchase flow
- 🔨 Wallet implementation
- 🔨 Chat functionality

---

**Document Version**: 1.0  
**Last Review**: November 19, 2025  
**Next Review**: December 2025
