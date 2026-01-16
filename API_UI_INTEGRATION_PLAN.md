# API to UI Integration Plan - CRITICAL FIXES

**Issue**: Infrastructure created but NOT connected to UI screens  
**Status**: Mock data still being used  
**Priority**: URGENT - Production blocker

---

## 🚨 Critical Issues to Fix

### 1. Wallet Screen
- **Current**: Shows `$0.00` hardcoded
- **Fix Needed**: Connect to `walletViewModelProvider`
- **APIs**: 
  - GET /api/v1/wallet/balance
  - GET /api/v1/wallet/transactions
  - GET /api/v1/wallet/earnings

### 2. Event List Screen
- **Current**: Returns error / shows mock data
- **Fix Needed**: Connect to existing event providers
- **APIs**: 
  - GET /api/events
  - GET /api/events/my-events

### 3. Event Details Screen
- **Current**: Not loading properly
- **Fix Needed**: Fix data parsing and display
- **APIs**: 
  - GET /api/events/:id

### 4. Marketplace/Vendor Screen
- **Current**: Not calling API
- **Fix Needed**: Connect to `marketplaceViewModelProvider`
- **APIs**: 
  - GET /api/v1/marketplace/resources
  - GET /api/v1/marketplace/vendors/:id

### 5. Vendor Dashboard
- **Current**: Looks unchanged
- **Fix Needed**: Connect to `vendorDashboardViewModelProvider`
- **APIs**: 
  - GET /api/v1/marketplace/vendors/me/dashboard
  - GET /api/v1/marketplace/vendors/me/stats

---

## 📋 Implementation Priority

### Phase 1: Critical Screens (IMMEDIATE)
1. ✅ Wallet Screen - Connect real balance & transactions
2. ✅ Event List Screen - Fix API calls
3. ✅ Event Details Screen - Fix data parsing
4. ✅ Marketplace Screen - Connect vendor browsing

### Phase 2: Important Screens
5. ✅ Vendor Dashboard - Connect stats
6. ✅ My Tickets Screen - Connect ticket list
7. ✅ Co-Host Invitations - Connect invitations

### Phase 3: Secondary Screens
8. ✅ Vendor Registration - Connect registration flow
9. ✅ Booking Screens - Connect booking APIs
10. ✅ Host Dashboard - Connect verification & revenue

---

## 🔧 Implementation Strategy

### For Each Screen:
1. **Remove mock data**
2. **Import correct provider**
3. **Watch ViewModel state**
4. **Handle loading/error/success states**
5. **Display real data**
6. **Add refresh functionality**

### Example Pattern:
```dart
// OLD (Mock)
final balance = '\$0.00';

// NEW (Real API)
final viewModel = ref.watch(walletViewModelProvider.notifier);
final state = ref.watch(walletViewModelProvider);

useEffect(() {
  viewModel.getWalletBalance();
  return null;
}, []);

state.balanceState.when(
  loading: () => LoadingIndicator(),
  success: (balance) => Text('\$${balance.availableBalance}'),
  error: (failure) => ErrorWidget(failure.message),
);
```

---

## 🎯 Next Steps

1. Start with Wallet Screen (highest visibility)
2. Fix Event List (core functionality)
3. Fix Event Details (user flow)
4. Connect Marketplace (vendor discovery)
5. Connect remaining screens

---

**Status**: Plan Created  
**Action**: Begin implementation immediately
