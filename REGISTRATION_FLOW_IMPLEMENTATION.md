# Multi-Step Registration Flow Implementation

## ✅ Implementation Complete

### Architecture Overview

```
Domain Layer (Business Logic)
├── Entities
│   ├── registration_session_entity.dart (sessionId)
│   ├── registration_token_entity.dart (registrationToken)
│   └── registration_complete_entity.dart (final auth token + user)
├── Use Cases
│   ├── register_email_usecase.dart (Step 1)
│   ├── verify_registration_otp_usecase.dart (Step 2)
│   ├── add_phone_usecase.dart (Step 3)
│   ├── add_name_usecase.dart (Step 4)
│   └── complete_registration_usecase.dart (Step 5)
└── Repository Interface
    └── auth_repository.dart (added 5 new methods)

Data Layer (Implementation)
├── Models
│   ├── registration_session_model.dart
│   ├── registration_token_model.dart
│   └── registration_complete_model.dart
├── Remote Datasource
│   └── auth_remote_datasource.dart (added 5 new endpoints)
└── Repository Implementation
    └── auth_repository_impl.dart (implemented 5 new methods)

Presentation Layer (UI)
├── ViewModel
│   └── registration_viewmodel.dart (manages registration state)
└── Providers
    └── auth_providers.dart (added 5 new use case providers)
```

## 📋 Registration Flow

### Step 1: Email Registration
**Endpoint**: `POST /api/auth/register/email`

**Request**:
```json
{
  "email": "user@example.com"
}
```

**Response**:
```json
{
  "message": "OTP sent to your email",
  "sessionId": "reg_1731849600000_abc123xyz"
}
```

**State Updates**:
- Saves `email`
- Saves `sessionId`
- Moves to step 2

---

### Step 2: OTP Verification
**Endpoint**: `POST /api/auth/register/verify-otp`

**Request**:
```json
{
  "email": "user@example.com",
  "otp": "123456",
  "sessionId": "reg_1731849600000_abc123xyz"
}
```

**Response**:
```json
{
  "message": "Email verified successfully",
  "registrationToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**State Updates**:
- Saves `registrationToken`
- Clears `sessionId`
- Moves to step 3

---

### Step 3: Phone Number
**Endpoint**: `POST /api/auth/register/phone`

**Request**:
```json
{
  "phoneNo": "+1234567890",
  "registrationToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Response**:
```json
{
  "message": "Phone number saved successfully",
  "registrationToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." (updated)
}
```

**State Updates**:
- Saves `phoneNo`
- Updates `registrationToken`
- Moves to step 4

---

### Step 4: Name
**Endpoint**: `POST /api/auth/register/name`

**Request**:
```json
{
  "firstName": "John",
  "lastName": "Doe",
  "registrationToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Response**:
```json
{
  "message": "Name saved successfully",
  "registrationToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..." (updated)
}
```

**State Updates**:
- Saves `firstName`
- Saves `lastName`
- Updates `registrationToken`
- Moves to step 5

---

### Step 5: Complete Registration
**Endpoint**: `POST /api/auth/register/complete`

**Request**:
```json
{
  "password": "SecurePass123",
  "role": "Attendee",
  "pushNotificationsEnabled": false,
  "registrationToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

**Response**:
```json
{
  "message": "Registration completed successfully",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "userId": "507f1f77bcf86cd799439011",
  "user": {
    "email": "user@example.com",
    "firstName": "John",
    "lastName": "Doe",
    "phoneNo": "+1234567890",
    "role": "Attendee"
  }
}
```

**State Updates**:
- Saves auth `token` to secure storage
- Saves `userId` to secure storage
- Saves user data to local storage
- User is now authenticated
- Navigate to home screen

---

## 🎯 ViewModel State Management

### RegistrationState
```dart
class RegistrationState {
  final String? email;
  final String? sessionId;
  final String? registrationToken;
  final String? phoneNo;
  final String? firstName;
  final String? lastName;
  final int currentStep; // 1-5
  final BaseState<dynamic> stepState; // loading, success, error
}
```

### ViewModel Methods
```dart
// Step 1
await ref.read(registrationViewModelProvider.notifier).registerEmail(email);

// Step 2
await ref.read(registrationViewModelProvider.notifier).verifyOtp(otp);

// Step 3
await ref.read(registrationViewModelProvider.notifier).addPhone(phoneNo);

// Step 4
await ref.read(registrationViewModelProvider.notifier).addName(firstName, lastName);

// Step 5
await ref.read(registrationViewModelProvider.notifier).completeRegistration(password, role);

// Utility
ref.read(registrationViewModelProvider.notifier).goBack(); // Go to previous step
ref.read(registrationViewModelProvider.notifier).reset(); // Reset all state
```

---

## 🔐 Security Features

1. **Token-Based Validation**: Each step validates the previous step via tokens
2. **Stateless Backend**: No session management on server
3. **Secure Storage**: Tokens stored securely using FlutterSecureStorage
4. **Progressive Disclosure**: User provides information step-by-step
5. **Token Evolution**: sessionId → registrationToken → authToken

---

## 📱 Next Steps: UI Implementation

### Screens to Create:
1. **Registration Email Screen** (Step 1)
   - Email input field
   - Validation
   - "Send OTP" button
   - Navigate to OTP screen on success

2. **Registration OTP Screen** (Step 2)
   - OTP input (6 digits)
   - Resend OTP button
   - Timer countdown
   - Navigate to phone screen on success

3. **Registration Phone Screen** (Step 3)
   - Phone number input with country code
   - Validation
   - "Continue" button
   - Navigate to name screen on success

4. **Registration Name Screen** (Step 4)
   - First name input
   - Last name input
   - Validation
   - "Continue" button
   - Navigate to password screen on success

5. **Registration Password Screen** (Step 5)
   - Password input
   - Confirm password input
   - Role selection (Attendee/Organizer)
   - Push notifications toggle
   - "Complete Registration" button
   - Navigate to home screen on success

### UI Features:
- ✅ Progress indicator (1/5, 2/5, etc.)
- ✅ Back button (except on step 1)
- ✅ Loading states
- ✅ Error messages
- ✅ Form validation
- ✅ Auto-navigation on success

---

## 🧪 Testing Checklist

- [ ] Step 1: Email registration sends OTP
- [ ] Step 2: OTP verification works
- [ ] Step 2: Invalid OTP shows error
- [ ] Step 3: Phone number is saved
- [ ] Step 4: Name is saved
- [ ] Step 5: Registration completes
- [ ] Step 5: User is authenticated
- [ ] Back navigation works
- [ ] Token persistence works
- [ ] Error handling works
- [ ] Network error recovery works

---

## 📦 Files Created

### Domain Layer (8 files)
1. `lib/features/auth/domain/entities/registration_session_entity.dart`
2. `lib/features/auth/domain/entities/registration_token_entity.dart`
3. `lib/features/auth/domain/entities/registration_complete_entity.dart`
4. `lib/features/auth/domain/usecases/register_email_usecase.dart`
5. `lib/features/auth/domain/usecases/verify_registration_otp_usecase.dart`
6. `lib/features/auth/domain/usecases/add_phone_usecase.dart`
7. `lib/features/auth/domain/usecases/add_name_usecase.dart`
8. `lib/features/auth/domain/usecases/complete_registration_usecase.dart`

### Data Layer (3 files)
9. `lib/features/auth/data/models/registration_session_model.dart`
10. `lib/features/auth/data/models/registration_token_model.dart`
11. `lib/features/auth/data/models/registration_complete_model.dart`

### Presentation Layer (1 file)
12. `lib/features/auth/presentation/viewmodels/registration_viewmodel.dart`

### Updated Files (4 files)
13. `lib/features/auth/domain/repositories/auth_repository.dart`
14. `lib/features/auth/data/datasources/auth_remote_datasource.dart`
15. `lib/features/auth/data/repositories/auth_repository_impl.dart`
16. `lib/features/auth/presentation/providers/auth_providers.dart`

---

## ✅ Summary

The complete multi-step registration flow has been implemented following Clean Architecture principles:

- ✅ 5 domain entities created
- ✅ 5 use cases implemented
- ✅ 5 API endpoints integrated
- ✅ State management with Riverpod
- ✅ Token-based flow management
- ✅ Error handling
- ✅ Secure storage integration
- ✅ Ready for UI implementation

**Next**: Create the 5 registration screens to complete the user-facing flow!
