import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_token_service.dart';

/// Development helper to set a test token
/// REMOVE THIS FILE IN PRODUCTION!
class DevTokenHelper {
  /// Set a test token for development
  /// Call this in your main screen's initState for quick testing
  static Future<void> setTestToken(WidgetRef ref, String token) async {
    final authTokenService = ref.read(authTokenServiceProvider);
    await authTokenService.saveToken(token);
    debugPrint('✅ Test token set successfully');
  }
  
  /// Clear the token
  static Future<void> clearToken(WidgetRef ref) async {
    final authTokenService = ref.read(authTokenServiceProvider);
    await authTokenService.removeToken();
    debugPrint('✅ Token cleared');
  }
  
  /// Get current token
  static Future<String?> getToken(WidgetRef ref) async {
    final authTokenService = ref.read(authTokenServiceProvider);
    final token = await authTokenService.getToken();
    debugPrint('Current token: ${token ?? "No token"}');
    return token;
  }
}

/// Widget to show token status (for debugging)
class TokenDebugWidget extends ConsumerWidget {
  const TokenDebugWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<String?>(
      future: ref.read(authTokenServiceProvider).getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink();
        }
        
        final hasToken = snapshot.data != null && snapshot.data!.isNotEmpty;
        
        return Container(
          padding: const EdgeInsets.all(8),
          color: hasToken ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                hasToken ? Icons.check_circle : Icons.error,
                color: hasToken ? Colors.green : Colors.red,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                hasToken ? 'Token: Set' : 'Token: Not Set',
                style: TextStyle(
                  color: hasToken ? Colors.green : Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
