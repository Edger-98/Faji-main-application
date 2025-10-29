# Authentication Feature

This feature implements the authentication flow based on the Faji App Figma designs.

## Screens Implemented

### 1. Splash Screen (`/splash`)
- **Figma Node ID**: `1-286`
- Displays the Faji logo with animated background
- Auto-navigates to intro screen after 3 seconds
- Uses exact colors and positioning from Figma design

### 2. Intro Screen (`/intro`)
- **Figma Node ID**: `1-313`
- Hero section with circular background image
- "Voyage through virtual tickets" heading
- Get Started button leading to email registration
- Sign in link for existing users

### 3. Email Screen (`/auth/email`)
- **Figma Node ID**: `2-393`
- Email input with validation
- Back navigation button
- Terms & conditions text
- Continue button (enabled only when valid email entered)

### 4. PIN Verification Screen (`/auth/pin`)
- **Figma Node ID**: `2-455`
- 6-digit PIN input with visual indicators
- Custom PIN input widget matching Figma design
- Resend code functionality
- Auto-navigation when PIN is complete

### 5. Phone Number Screen (`/auth/phone`)
- **Figma Node ID**: `2-481`
- Phone input with country picker
- Country flag emoji display
- Phone number validation
- Navigates to name screen

### 6. Name Screen (`/auth/name`)
- **Figma Node ID**: `2-528`
- First name and last name input fields
- Form validation (both fields required)
- Smooth fade and slide animations
- Navigates to password screen

### 7. Password Screen (`/auth/password`)
- **Figma Node ID**: `2-565`
- Password creation with minimum 6 characters
- Password visibility toggle
- Real-time password strength indicator
- Completes registration flow

## Design System Compliance

All screens follow the Faji design system:

### Colors
- **Primary**: `#FD99C9` (Pink)
- **Background**: `#1F1F1F` (Dark)
- **Surface**: `rgba(40, 40, 40, 0.81)` (Semi-transparent)
- **Text Primary**: `#F8F8F8` (Light)
- **Text Secondary**: `#A1A1A1` (Gray)

### Typography
- **Primary Font**: Neue Haas Grotesk Display Pro (headings, buttons)
- **Secondary Font**: PP Neue Montreal (body text)
- **Font Weights**: 600 (semibold), 100 (thin)

### Components
- **AuthButton**: Reusable button component with Faji styling
- **AppTextField**: Standardized input field with prefix/suffix support
- **BackButtonWidget**: Circular back button with navigation
- **PinInputWidget**: Custom 6-digit PIN input with animations

### Features
- Smooth page transitions (fade, slide, scale)
- Responsive design with ScreenUtil
- Form validation with visual feedback
- Country picker integration (country_picker package)
- Password visibility toggle
- Auto-focus and keyboard management
- Real-time validation indicators

## Navigation Flow

### Sign Up Flow (Get Started)
```
/splash → /intro → /auth/name → /auth/password → /home
```

### Sign In Flow
```
/splash → /intro → /auth/email → /auth/pin → /auth/phone → /auth/name → /auth/password → /home
```

## Assets Required

- `assets/images/splash_background.png`
- `assets/images/intro_background.png`
- `assets/images/faji_logo.svg`
- `assets/images/faji_logo_dot.svg`
- `assets/images/faji_logo_accent.svg`
- `assets/images/vietnam_flag.png`

## Usage

The authentication screens are automatically integrated with the app router. Users start at the splash screen and progress through the authentication flow.

```dart
// Navigation examples
context.go('/splash');        // Start authentication
context.go('/auth/email');    // Direct to email input
context.go('/auth/pin');      // Direct to PIN verification
context.go('/auth/phone');    // Direct to phone input
```

## State Management

- Uses Riverpod for state management
- Form validation with reactive UI updates
- Proper disposal of controllers and focus nodes
- Theme integration with existing design system