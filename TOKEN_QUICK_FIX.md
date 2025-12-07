# 🔑 Quick Fix: Set Authentication Token

## Problem
You're getting: `{"message":"Access denied. No token provided."}`

## Solution
The token needs to be set. Here are 3 ways to fix it:

---

## ✅ Option 1: Quick Test (Recommended for Testing)

Add this to your `TicketsContent` widget:

```dart
import 'package:fajimobileapp/core/utils/dev_token_helper.dart';

class _TicketsContentState extends ConsumerState<TicketsContent>
    with SingleTickerProviderStateMixin {
  // ... existing code ...

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
    
    // 🔑 SET YOUR TOKEN HERE
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await DevTokenHelper.setTestToken(ref, 'YOUR_BACKEND_TOKEN_HERE');
      // Refresh events after setting token
      ref.invalidate(filteredEventsProvider);
    });
  }
  
  // ... rest of code ...
}
```

**Steps:**
1. Get a valid token from your backend
2. Replace `'YOUR_BACKEND_TOKEN_HERE'` with your actual token
3. Run the app
4. Events will load! ✅

---

## ✅ Option 2: Set Token via Login

If you have a login screen, update it to save the token:

```dart
// After successful login
import 'package:fajimobileapp/core/services/auth_token_service.dart';

Future<void> _handleLogin() async {
  try {
    // Your login logic
    final response = await loginApi();
    
    // Save token
    final authTokenService = ref.read(authTokenServiceProvider);
    await authTokenService.saveToken(response.token);
    
    // Navigate to home
    context.go('/home');
    
  } catch (e) {
    print('Login failed: $e');
  }
}
```

---

## ✅ Option 3: Set Token Manually in Main

For quick testing, add this to `main.dart`:

```dart
void main() async {
  // ... existing initialization ...
  
  // Initialize auth token
  await container.read(authTokenServiceProvider).initialize();
  
  // 🔑 TEMPORARY: Set test token
  await container.read(authTokenServiceProvider).saveToken('YOUR_TOKEN_HERE');
  
  // Run app
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}
```

---

## 🎯 How to Get a Token

### Method 1: From Your Backend API

```bash
curl -X POST https://faji-backend-52878caa6589.herokuapp.com/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"your@email.com","password":"yourpassword"}'
```

The response will contain a token.

### Method 2: From Your Backend Team

Ask your backend team for a test token.

### Method 3: Use Postman

1. Open Postman
2. POST to `https://faji-backend-52878caa6589.herokuapp.com/api/v1/auth/login`
3. Body: `{"email":"test@example.com","password":"password"}`
4. Copy the token from response

---

## 🐛 Verify Token is Set

Add this debug widget to see token status:

```dart
import 'package:fajimobileapp/core/utils/dev_token_helper.dart';

// In your screen
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('My Events'),
      actions: [
        TokenDebugWidget(), // Shows if token is set
      ],
    ),
    // ... rest of your UI
  );
}
```

---

## ✅ Complete Example

Here's a complete example for `TicketsContent`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_details_tabbed_screen.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/core/models/event_model.dart';
import 'package:fajimobileapp/core/utils/dev_token_helper.dart'; // ADD THIS

class TicketsContent extends ConsumerStatefulWidget {
  const TicketsContent({super.key});

  @override
  ConsumerState<TicketsContent> createState() => _TicketsContentState();
}

class _TicketsContentState extends ConsumerState<TicketsContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
    
    // 🔑 SET YOUR TOKEN HERE (REMOVE IN PRODUCTION)
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await DevTokenHelper.setTestToken(ref, 'YOUR_BACKEND_TOKEN_HERE');
      ref.invalidate(filteredEventsProvider);
    });
  }
  
  // ... rest of your code ...
}
```

---

## 🚀 Test It

1. Set your token using one of the methods above
2. Run the app: `flutter run`
3. Navigate to My Events screen
4. Events should load! ✅

---

## 📝 Important Notes

1. **Remove test tokens before production!**
2. **Never commit tokens to git!**
3. **Use environment variables for sensitive data**
4. **Implement proper login flow for production**

---

## ✅ Status After Fix

Once you set the token:
- ✅ API calls will include `Authorization: Bearer YOUR_TOKEN`
- ✅ Events will load from backend
- ✅ Event details will load
- ✅ No more "Access denied" errors

---

## 🆘 Still Having Issues?

### Check 1: Token is Set
```dart
final token = await DevTokenHelper.getToken(ref);
print('Token: $token'); // Should not be null
```

### Check 2: Token Format
Token should be just the token string, not "Bearer token".

### Check 3: Token is Valid
Test your token with curl:
```bash
curl -H "Authorization: Bearer YOUR_TOKEN" \
  https://faji-backend-52878caa6589.herokuapp.com/api/v1/events
```

If this works, your token is valid!

---

**Quick Fix:** Use Option 1 above to set a test token and start testing immediately! 🚀

