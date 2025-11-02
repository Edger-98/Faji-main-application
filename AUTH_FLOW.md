# Authentication Flow Documentation

## Overview

The Faji App has two main authentication flows:
1. **Sign Up Flow** - For new users
2. **Login Flow** - For existing users

---

## 🔐 Sign Up Flow (New Users)

### Flow Diagram
```
Intro Screen (Get Started)
    ↓
Email Screen
    ↓
Verify Screen (PIN)
    ↓
Your Name Screen
    ↓
Password Screen
    ↓
Home Screen
```

**Note**: Phone screen is NOT part of the main sign-up flow.

### Detailed Steps

#### 1. Intro Screen (`/intro`)
- **Purpose:** Welcome screen with app introduction
- **Actions:**
  - "Get Started" button → Navigate to Email Screen
  - "Already have an account? Sign in" → Navigate to Login Screen
- **File:** `lib/features/auth/presentation/screens/intro_screen.dart`

#### 2. Email Screen (`/auth/email`)
- **Purpose:** Collect user's email address
- **Validation:** Email must contain '@' and '.'
- **Actions:**
  - Continue button → Navigate to PIN Screen (Verify)
  - Back button → Return to Intro
- **File:** `lib/features/auth/presentation/screens/email_screen.dart`

#### 3. Verify Screen - PIN (`/auth/pin`)
- **Purpose:** Verify email with 6-digit PIN code
- **Features:**
  - 6-digit PIN input (visual lines)
  - Auto-continue when complete
  - Resend code option
- **Actions:**
  - Auto-navigate when PIN complete → Navigate to Name Screen
  - Continue button → Navigate to Name Screen
  - Back button → Return to Email Screen
- **File:** `lib/features/auth/presentation/screens/pin_screen.dart`

#### 4. Your Name Screen (`/auth/name`)
- **Purpose:** Collect user's full name
- **Validation:** Name must not be empty
- **Actions:**
  - Continue button → Navigate to Password Screen
  - Back button → Return to PIN Screen
- **File:** `lib/features/auth/presentation/screens/name_screen.dart`

#### 5. Password Screen (`/auth/password`)
- **Purpose:** Create account password
- **Features:**
  - Password visibility toggle
  - Password strength indicator
  - Minimum requirements display
- **Actions:**
  - Continue button → Navigate to Home Screen
  - Back button → Return to Name Screen
- **File:** `lib/features/auth/presentation/screens/password_screen.dart`

#### 6. Home Screen (`/home`)
- **Purpose:** Main app screen after successful registration
- **File:** `lib/features/home/presentation/screens/home_screen.dart`

---

## 🔑 Login Flow (Existing Users)

### Flow Diagram
```
Intro Screen (Sign in)
    ↓
Login Screen
    ↓
Home Screen
```

### Detailed Steps

#### 1. Intro Screen (`/intro`)
- **Actions:**
  - "Already have an account? Sign in" → Navigate to Login Screen

#### 2. Login Screen (`/login`)
- **Purpose:** Authenticate existing users
- **Fields:**
  - Email address
  - Password (with visibility toggle)
- **Features:**
  - "Forgot password?" link
  - "Don't have an account? Sign up" link → Navigate to Email Screen
- **Actions:**
  - Sign In button → Navigate to Home Screen
  - Back button → Return to Intro Screen
- **File:** `lib/features/auth/presentation/screens/login_screen.dart`

#### 3. Home Screen (`/home`)
- **Purpose:** Main app screen after successful login

---

## 📱 Screen Components

### Common Components

All auth screens use consistent components from:
`lib/features/auth/presentation/widgets/`

#### AuthButton
- Primary action button
- Pink background (#FD99C9)
- Configurable width and height
- Disabled state support

#### BackButtonWidget
- Circular back button
- Consistent positioning
- Dark background with white icon

#### Input Fields
- Rounded containers (37px border radius)
- Dark background (rgba(40, 40, 40, 0.81))
- Consistent padding and styling

---

## 🎨 Design System

### Colors
- **Primary:** `#FD99C9` (Pink)
- **Background:** `#1F1F1F` (Dark)
- **Surface:** `rgba(40, 40, 40, 0.81)` (Input fields)
- **Text Primary:** `#F8F8F8` (White)
- **Text Secondary:** `#A1A1A1` (Gray)

### Typography
- **Headings:** Neue Haas Grotesk Display Pro, 37px, 600 weight
- **Body:** PP Neue Montreal, 16px, 100 weight
- **Labels:** PP Neue Montreal, 16px, 400 weight

### Spacing
- Screen padding: 24px horizontal
- Section spacing: 40-60px vertical
- Input field height: 69px
- Button height: 59-69px

---

## 🛣️ Route Configuration

### Route Paths
```dart
// Auth routes
static const String intro = '/intro';
static const String authEmail = '/auth/email';
static const String authPhone = '/auth/phone';
static const String authPin = '/auth/pin';
static const String authName = '/auth/name';
static const String authPassword = '/auth/password';
static const String login = '/login';

// Main app
static const String home = '/home';
```

### Route Names
```dart
static const String introName = 'intro';
static const String authEmailName = 'auth-email';
static const String authPhoneName = 'auth-phone';
static const String authPinName = 'auth-pin';
static const String authNameName = 'auth-name';
static const String authPasswordName = 'auth-password';
static const String loginName = 'login';
static const String homeName = 'home';
```

---

## 🔄 Navigation Methods

### Using go_router

```dart
// Navigate to a route
context.goNamed(RouteManager.authEmailName);

// Navigate with replacement (no back)
context.go(RouteManager.home);

// Go back
context.pop();
```

---

## ✅ Validation Rules

### Email
- Must contain '@'
- Must contain '.'
- Not empty

### Phone
- Must be valid for selected country
- Uses country_picker package
- Validates format per country

### PIN
- Exactly 6 digits
- Auto-continues when complete

### Name
- Not empty
- Minimum 2 characters recommended

### Password
- Minimum 8 characters
- Should contain uppercase, lowercase, number, special char
- Visibility toggle available

---

## 🎯 User Experience Features

### Sign Up Flow
1. **Progressive disclosure** - One field at a time
2. **Auto-continue** - PIN screen auto-advances
3. **Validation feedback** - Real-time validation
4. **Back navigation** - Can go back at any step
5. **Clear progress** - User knows where they are

### Login Flow
1. **Quick access** - Direct from intro screen
2. **Password visibility** - Toggle to show/hide
3. **Forgot password** - Recovery option available
4. **Sign up link** - Easy switch to registration

---

## 📝 Implementation Notes

### State Management
- Uses `flutter_riverpod` for state management
- Each screen manages its own local state
- Form validation is real-time

### Animations
- Smooth page transitions (400ms)
- Slide and fade effects
- Scale animations for dynamic feel

### Responsive Design
- Uses `flutter_screenutil` for responsive sizing
- All dimensions scale with screen size
- Maintains aspect ratios

### Accessibility
- Proper focus management
- Keyboard navigation support
- Screen reader compatible

---

## 🧪 Testing Checklist

### Sign Up Flow
- [ ] Can navigate from Intro to Email
- [ ] Email validation works correctly
- [ ] Can navigate Email → Phone
- [ ] Country picker works
- [ ] Phone validation works
- [ ] Can navigate Phone → PIN
- [ ] PIN input accepts 6 digits
- [ ] Auto-continue works on PIN complete
- [ ] Can navigate PIN → Name
- [ ] Name validation works
- [ ] Can navigate Name → Password
- [ ] Password visibility toggle works
- [ ] Can navigate Password → Home
- [ ] Back button works at each step

### Login Flow
- [ ] Can navigate from Intro to Login
- [ ] Email field accepts input
- [ ] Password field accepts input
- [ ] Password visibility toggle works
- [ ] Sign In button navigates to Home
- [ ] "Sign up" link navigates to Email screen
- [ ] Back button returns to Intro

### Edge Cases
- [ ] Empty field validation
- [ ] Invalid email format
- [ ] Invalid phone number
- [ ] Incomplete PIN
- [ ] Weak password
- [ ] Network errors (future)
- [ ] Session management (future)

---

## 🚀 Future Enhancements

1. **Email Verification**
   - Send verification email
   - Verify email before proceeding

2. **Phone Verification**
   - Send SMS code
   - Verify phone number with real OTP

3. **Social Login**
   - Google Sign In
   - Apple Sign In
   - Facebook Login

4. **Biometric Auth**
   - Fingerprint
   - Face ID

5. **Password Recovery**
   - Forgot password flow
   - Reset password via email

6. **Session Management**
   - Remember me option
   - Auto-login
   - Token refresh

7. **Error Handling**
   - Network error messages
   - Server error handling
   - Retry mechanisms

---

## 📚 Related Files

### Core Files
- `lib/core/routing/route_manager.dart` - Route constants
- `lib/core/routing/app_router.dart` - Route configuration
- `lib/core/design_system/` - Design tokens

### Auth Feature Files
- `lib/features/auth/auth_feature.dart` - Feature barrel
- `lib/features/auth/presentation/screens/` - All auth screens
- `lib/features/auth/presentation/widgets/` - Reusable widgets

### Main App Files
- `lib/features/home/presentation/screens/home_screen.dart` - Home screen
- `lib/main.dart` - App entry point

---

## 🎓 Best Practices

1. **Always validate input** before navigation
2. **Provide clear feedback** on validation errors
3. **Allow back navigation** at every step
4. **Use consistent styling** across all screens
5. **Handle loading states** during async operations
6. **Implement proper error handling**
7. **Follow Material Design guidelines**
8. **Maintain accessibility standards**
9. **Test on multiple devices**
10. **Keep user data secure**
