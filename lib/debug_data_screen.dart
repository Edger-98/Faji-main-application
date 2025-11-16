import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';

/// Debug screen to check what data is saved
class DebugDataScreen extends ConsumerStatefulWidget {
  const DebugDataScreen({super.key});

  @override
  ConsumerState<DebugDataScreen> createState() => _DebugDataScreenState();
}

class _DebugDataScreenState extends ConsumerState<DebugDataScreen> {
  Map<String, dynamic> _debugInfo = {};

  @override
  void initState() {
    super.initState();
    _loadDebugInfo();
  }

  Future<void> _loadDebugInfo() async {
    final authRepo = ref.read(authRepositoryProvider);
    final localDataSource = ref.read(authLocalDataSourceProvider);
    
    final isLoggedIn = await authRepo.isLoggedIn();
    final userId = await authRepo.getUserId();
    final token = await authRepo.getToken();
    final userData = await localDataSource.getUserData();
    final currentUser = ref.read(currentUserProvider);
    
    setState(() {
      _debugInfo = {
        'Is Logged In': isLoggedIn,
        'User ID': userId ?? 'null',
        'Token': token != null ? '${token.substring(0, 20)}...' : 'null',
        'Saved First Name': userData['firstName'] ?? 'null',
        'Saved Last Name': userData['lastName'] ?? 'null',
        'Saved Email': userData['email'] ?? 'null',
        'Saved Phone': userData['phoneNo'] ?? 'null',
        'Provider First Name': currentUser?.firstName ?? 'null',
        'Provider Last Name': currentUser?.lastName ?? 'null',
        'Provider Email': currentUser?.email ?? 'null',
        'Provider Phone': currentUser?.phoneNo ?? 'null',
      };
    });
    
    print('=== DEBUG INFO ===');
    _debugInfo.forEach((key, value) {
      print('$key: $value');
    });
    print('==================');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Data'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadDebugInfo,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Stored Data:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ..._debugInfo.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${entry.key}:',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${entry.value}',
                      style: TextStyle(
                        color: entry.value == 'null' ? Colors.red : Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () async {
              await ref.read(authStateViewModelProvider.notifier).checkAuthStatus();
              _loadDebugInfo();
            },
            child: const Text('Trigger checkAuthStatus'),
          ),
        ],
      ),
    );
  }
}
