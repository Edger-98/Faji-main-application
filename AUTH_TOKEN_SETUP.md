# Authentication Token Setup

## ✅ Token Service Configured

The app now automatically loads and sets the authentication token on startup.

---

## 🔧 How It Works

### 1. On App Start
```dart
// In main.dart
await container.read(authTokenServiceProvider).initialize();
```
This automatically:
- Loads the token from secure storage
- Sets it in the API service
- All API calls will now include the Bearer token

### 2. After Login
```dart
// In your login success handler
final authTokenService = ref.read(authTokenServiceProvider);
await authTokenService.saveToken(token);
```
This:
- Saves the token to secure storage
- Sets it in the API service immediately
- All subsequent API calls will be authenticated

### 3. On Logout
```dart
// In your logout handler
final authTokenService = ref.read(authTokenServiceProvider);
await authTokenService.removeToken();
```
This:
- Removes the token from secure storage
- Removes it from the API service
- All subsequent API calls will be unauthenticated

---

## 📝 Usage Examples

### Example 1: After Login Success

```dart
// In your login screen
Future<void> _handleLogin() async {
  try {
    // Call your login API
    final response = await ref.read(loginUseCaseProvider).call(
      email: emailController.text,
      password: passwordController.text,
    );
    
    // Save the token
    final authTokenService = ref.read(authTokenServiceProvider);
    await authTokenService.saveToken(response.token);
    
    // Navigate to home
    context.go('/home');
    
  } catch (e) {
    // Handle error
    print('Login failed: $e');
  }
}
```

### Example 2: Check if User is Logged In

```dart
// Check if token exists
final authTokenService = ref.read(authTokenServiceProvider);
final token = await authTokenService.getToken();

if (token != null && token.isNotEmpty) {
  // User is logged in
  context.go('/home');
} else {
  // User is not logged in
  context.go('/login');
}
```

### Example 3: Logout

```dart
Future<void> _handleLogout() async {
  // Remove token
  final authTokenService = ref.read(authTokenServiceProvider);
  await authTokenService.removeToken();
  
  // Navigate to login
  context.go('/login');
}
```

---

## 🔐 Token Storage

**Storage:** Flutter Secure Storage (encrypted)  
**Key:** `auth_token`  
**Format:** Bearer token string

---

## 🚀 Quick Test

### Option 1: Set a Test Token Manually

For testing, you can set a token manually in your app:

```dart
// Add this temporarily in your main screen's initState
@override
void initState() {
  super.initState();
  
  // Set test token (REMOVE THIS IN PRODUCTION!)
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    final authTokenService = ref.read(authTokenServiceProvider);
    await authTokenService.saveToken('YOUR_TEST_TOKEN_HERE');
  });
}
```

### Option 2: Login First

1. Navigate to login screen
2. Enter credentials
3. On successful login, token will be saved automatically
4. Navigate to events screen
5. Events will load with authentication

---

## 🐛 Troubleshooting

### Error: "Access denied. No token provided."

**Cause:** Token is not set in the API service.

**Solutions:**

1. **Check if token is saved:**
```dart
final authTokenService = ref.read(authTokenServiceProvider);
final token = await authTokenService.getToken();
print('Token: $token'); // Should not be null
```

2. **Manually set a test token:**
```dart
final authTokenService = ref.read(authTokenServiceProvider);
await authTokenService.saveToken('your_test_token_here');
```

3. **Check API service:**
```dart
final apiService = ref.read(apiServiceProvider);
print(apiService._dio.options.headers['Authorization']);
// Should print: Bearer your_token_here
```

### Error: Token exists but still getting "Access denied"

**Possible causes:**
1. Token is expired
2. Token is invalid
3. Token format is wrong (should be just the token, not "Bearer token")

**Solution:**
Get a fresh token from your backend and save it:
```dart
await authTokenService.saveToken('fresh_token_here');
```

---

## 📋 Integration Checklist

- [x] AuthTokenService created
- [x] Token initialization in main.dart
- [x] Token loads on app start
- [x] Token sets in API service automatically
- [ ] Login screen saves token after success
- [ ] Logout screen removes token
- [ ] Token refresh logic (if needed)

---

## 🎯 Next Steps

### 1. Update Your Login Screen

Add token saving after successful login:

```dart
// After login success
final authTokenService = ref.read(authTokenServiceProvider);
await authTokenService.saveToken(loginResponse.token);
```

### 2. Update Your Logout Logic

Add token removal on logout:

```dart
// On logout
final authTokenService = ref.read(authTokenServiceProvider);
await authTokenService.removeToken();
```

### 3. Test

```bash
flutter run
```

The app will:
1. Load token on start (if exists)
2. Set it in API service
3. All API calls will be authenticated
4. Events will load successfully

---

## 🔑 Quick Fix for Testing

If you need to test right now without login, add this to your `TicketsContent` widget:

```dart
@override
void initState() {
  super.initState();
  _tabController = TabController(length: 3, vsync: this);
  _tabController.addListener(_onTabChanged);
  
  // TEMPORARY: Set test token
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    final authTokenService = ref.read(authTokenServiceProvider);
    await authTokenService.saveToken('YOUR_BACKEND_TOKEN_HERE');
    
    // Refresh events
    ref.invalidate(filteredEventsProvider);
  });
}
```

**Remember to remove this after testing!**

---

## ✅ Status

- ✅ Token service created
- ✅ Auto-initialization on app start
- ✅ Secure storage integration
- ✅ API service integration
- ✅ Ready to use

**Your app is now configured to handle authentication tokens!** 🎉

