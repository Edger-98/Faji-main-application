import 'package:dio/dio.dart';

/// Interceptor that normalizes API responses to handle multiple formats
/// 
/// Handles:
/// 1. Direct arrays: [] -> {success: true, data: []}
/// 2. Direct objects: {...} -> {success: true, data: {...}}
/// 3. Wrapped responses: {success: true, data: [...]} -> unchanged
/// 4. Responses with message/status: {status: 200, message: "OK", data: [...]} -> normalized
class ResponseNormalizerInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('🔄 NORMALIZER: ========== START ==========');
    print('🔄 NORMALIZER: Status Code: ${response.statusCode}');
    print('🔄 NORMALIZER: Path: ${response.requestOptions.path}');
    print('🔄 NORMALIZER: Original data type: ${response.data.runtimeType}');
    print('🔄 NORMALIZER: Original data: ${response.data}');
    
    try {
      final data = response.data;
      
      // If response is null, return empty success response
      if (data == null) {
        print('🔄 NORMALIZER: Data is null, wrapping...');
        response.data = <String, dynamic>{
          'success': true,
          'message': 'Success',
          'data': null,
        };
        print('🔄 NORMALIZER: ========== END (NULL) ==========');
        return handler.next(response);
      }

      // If response is a direct array, wrap it FIRST (before checking Map)
      if (data is List) {
        print('🔄 NORMALIZER: ✅ Detected direct array with ${data.length} items, wrapping...');
        final normalized = <String, dynamic>{
          'success': true,
          'message': 'Success',
          'data': data,
        };
        response.data = normalized;
        print('🔄 NORMALIZER: ✅ Normalized to: $normalized');
        print('🔄 NORMALIZER: ========== END (ARRAY) ==========');
        return handler.next(response);
      }

      // If response is already in correct format (has 'success' or 'data' field)
      if (data is Map<String, dynamic>) {
        print('🔄 NORMALIZER: Data is Map, checking structure...');
        print('🔄 NORMALIZER: Keys: ${data.keys.toList()}');
        
        // Check if it ALREADY has proper structure (success + data OR status + data)
        // These are considered "already formatted" and should pass through
        if (data.containsKey('data')) {
          print('🔄 NORMALIZER: ✅ Already has "data" field, checking if properly formatted...');
          
          // If it has data + (success OR status), it's properly formatted
          if (data.containsKey('success') || data.containsKey('status')) {
            print('🔄 NORMALIZER: ✅ Properly formatted response, ensuring success field...');
            
            // Ensure 'success' field exists for consistency
            if (!data.containsKey('success')) {
              data['success'] = _determineSuccess(response.statusCode, data);
              print('🔄 NORMALIZER: Added success field: ${data['success']}');
            }
            
            print('🔄 NORMALIZER: ========== END (ALREADY FORMATTED) ==========');
            return handler.next(response);
          }
          
          // Has data but no success/status - add success field
          print('🔄 NORMALIZER: Has data but no success/status, adding success field...');
          data['success'] = _determineSuccess(response.statusCode, data);
          print('🔄 NORMALIZER: ========== END (ADDED SUCCESS) ==========');
          return handler.next(response);
        }
        
        // If it has 'success' but no 'data', it might be an error response or boolean response
        if (data.containsKey('success')) {
          print('🔄 NORMALIZER: Has success but no data, passing through...');
          print('🔄 NORMALIZER: ========== END (SUCCESS ONLY) ==========');
          return handler.next(response);
        }
        
        // If it has status/message but NO data field, it needs normalization
        if (data.containsKey('status') || data.containsKey('message')) {
          print('🔄 NORMALIZER: Has status/message but NO data field, wrapping...');
          response.data = <String, dynamic>{
            'success': _determineSuccess(response.statusCode, data),
            'message': data['message'] ?? 'Success',
            'data': data, // Wrap the entire object as data
            if (data.containsKey('meta')) 'meta': data['meta'],
            if (data.containsKey('errors')) 'errors': data['errors'],
          };
          print('🔄 NORMALIZER: ========== END (WRAPPED STATUS/MESSAGE) ==========');
          return handler.next(response);
        }
        
        // Otherwise, it's a direct object response (like a single event) - wrap it
        print('🔄 NORMALIZER: Direct object with no standard fields, wrapping...');
        response.data = <String, dynamic>{
          'success': _determineSuccess(response.statusCode, data),
          'message': 'Success',
          'data': data,
        };
        print('🔄 NORMALIZER: Wrapped with success: ${_determineSuccess(response.statusCode, data)}');
        print('🔄 NORMALIZER: ========== END (WRAPPED OBJECT) ==========');
        return handler.next(response);
      }

      // For primitive types (String, int, bool, etc.), wrap them
      print('🔄 NORMALIZER: Primitive type, wrapping...');
      response.data = <String, dynamic>{
        'success': true,
        'message': 'Success',
        'data': data,
      };
      print('🔄 NORMALIZER: ========== END (PRIMITIVE) ==========');
      
      handler.next(response);
    } catch (e, stackTrace) {
      print('🔄 NORMALIZER: ❌ ERROR: $e');
      print('🔄 NORMALIZER: ❌ Stack: $stackTrace');
      print('🔄 NORMALIZER: ========== END (ERROR) ==========');
      // If normalization fails, pass through original response
      handler.next(response);
    }
  }

  /// Determine success based on status code and response data
  bool _determineSuccess(int? statusCode, Map<String, dynamic>? data) {
    // Check explicit success field (boolean)
    if (data != null && data.containsKey('success')) {
      final successValue = data['success'];
      if (successValue is bool) {
        return successValue;
      }
    }
    
    // Check status field (only if it looks like an HTTP status)
    if (data != null && data.containsKey('status')) {
      final status = data['status'];
      // Only treat as HTTP status if it's a number or specific success strings
      if (status is int) {
        return status >= 200 && status < 300;
      }
      if (status is String) {
        // Only check for explicit HTTP-like status strings
        final statusLower = status.toLowerCase();
        if (statusLower == 'success' || statusLower == 'ok' || status == '200') {
          return true;
        }
        // If it's a number string, parse it
        final statusCode = int.tryParse(status);
        if (statusCode != null) {
          return statusCode >= 200 && statusCode < 300;
        }
        // Otherwise, ignore this status field (it's probably a domain status like "approved", "pending", etc.)
      }
    }
    
    // Fall back to HTTP status code
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }
}
