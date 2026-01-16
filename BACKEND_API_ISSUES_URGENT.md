# Backend API Issues - URGENT FIX REQUIRED ⚠️

**Date**: December 27, 2024  
**Priority**: HIGH - Blocking wallet and marketplace features

---

## 🚨 Critical Issues

### 1. Wallet API Routes Not Found (404 Errors)

All wallet API endpoints are returning 404 with HTML error pages:

```
Error: ENOENT: no such file or directory, stat '/Users/bl/fajiApp/faji-backend/client/build/index.html'
```

**Affected Endpoints**:
- `GET /api/v1/wallet/balance` ❌
- `GET /api/v1/wallet/transactions` ❌
- `GET /api/v1/wallet/earnings` ❌
- `POST /api/v1/wallet/withdraw` ❌

**Root Cause**: These routes don't exist in the backend. The backend is trying to serve a React client build that doesn't exist.

**Required Fix**: Implement these wallet API routes in the backend or update the API paths in the mobile app.

---

### 2. Marketplace API Routes Not Found (404 Errors)

Marketplace API endpoint is also returning 404:

```
GET /api/v1/marketplace/resources
```

**Root Cause**: Same as wallet - route doesn't exist in backend.

**Required Fix**: Implement marketplace routes or update API paths.

---

### 3. Events API Data Format Issues (FIXED IN MOBILE APP)

The events API is returning data in incorrect formats:

#### Issue A: Dates as Empty Objects
```json
{
  "startDate": {},
  "endDate": {},
  "createdAt": {},
  "updatedAt": {}
}
```

**Expected**: ISO 8601 date strings like `"2024-12-27T10:00:00.000Z"`

#### Issue B: Host ID as Buffer Object
```json
{
  "host": {
    "id": {
      "buffer": {
        "0": 105,
        "1": 63,
        ...
      }
    }
  }
}
```

**Expected**: String ID like `"693f2d3f660e87d74ca2e3e5"`

**Status**: ✅ Mobile app now handles these issues gracefully with fallbacks

---

## 🔧 Backend Fixes Required

### Option 1: Implement Missing Routes (Recommended)

Add the following routes to your backend:

```javascript
// Wallet routes
router.get('/api/v1/wallet/balance', authMiddleware, walletController.getBalance);
router.get('/api/v1/wallet/transactions', authMiddleware, walletController.getTransactions);
router.get('/api/v1/wallet/earnings', authMiddleware, walletController.getEarnings);
router.post('/api/v1/wallet/withdraw', authMiddleware, walletController.withdraw);

// Marketplace routes
router.get('/api/v1/marketplace/resources', marketplaceController.getResources);
```

### Option 2: Update Mobile App API Paths

If the routes exist under different paths, update the mobile app:

1. Check `lib/core/config/api_config.dart` for base URL
2. Update route paths in:
   - `lib/features/wallet/data/datasources/wallet_remote_datasource.dart`
   - `lib/features/marketplace/data/datasources/marketplace_remote_datasource.dart`

---

## 📋 Backend Data Format Fixes (Recommended)

### Fix Date Serialization

Ensure Mongoose dates are properly serialized to ISO strings:

```javascript
// In your Mongoose schema or toJSON transform
schema.set('toJSON', {
  transform: function(doc, ret) {
    // Convert dates to ISO strings
    if (ret.startDate) ret.startDate = ret.startDate.toISOString();
    if (ret.endDate) ret.endDate = ret.endDate.toISOString();
    if (ret.createdAt) ret.createdAt = ret.createdAt.toISOString();
    if (ret.updatedAt) ret.updatedAt = ret.updatedAt.toISOString();
    return ret;
  }
});
```

### Fix ObjectId Serialization

Ensure ObjectIds are converted to strings:

```javascript
schema.set('toJSON', {
  transform: function(doc, ret) {
    // Convert ObjectIds to strings
    if (ret.host && ret.host.id) {
      ret.host.id = ret.host.id.toString();
    }
    return ret;
  }
});
```

---

## ✅ Mobile App Fixes Applied

The mobile app has been updated to handle these backend issues gracefully:

1. **Date Parsing**: Added `_parseDateSafely()` helper that:
   - Handles empty objects `{}`
   - Handles date strings
   - Handles Mongoose date objects
   - Falls back to current date if parsing fails

2. **ID Extraction**: Added `_extractIdSafely()` helper that:
   - Handles string IDs
   - Handles Mongoose ObjectId with buffers
   - Skips buffer objects gracefully
   - Returns empty string as fallback

3. **Error Handling**: All API calls have proper error states and fallbacks

---

## 🎯 Next Steps

### Immediate (Backend Team)
1. ✅ Check if wallet/marketplace routes exist under different paths
2. ✅ If not, implement the missing routes
3. ✅ Fix date serialization in Mongoose schemas
4. ✅ Fix ObjectId serialization in Mongoose schemas
5. ✅ Test all endpoints with Postman
6. ✅ Deploy backend updates

### After Backend Fix (Mobile Team)
1. Test wallet feature end-to-end
2. Test marketplace feature end-to-end
3. Verify all date displays are correct
4. Verify all event details load properly

---

## 📞 Contact

If you need help with backend implementation, please provide:
1. Current backend route structure
2. Mongoose schema definitions
3. API response examples

The mobile app is ready and waiting for the backend APIs to be available! 🚀
