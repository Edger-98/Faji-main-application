import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Network connectivity checker
abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
}

class NetworkInfoImpl implements NetworkInfo {

  NetworkInfoImpl(this.connectivity);
  final Connectivity connectivity;

  @override
  Future<bool> get isConnected async {
    final List<ConnectivityResult> result = await connectivity.checkConnectivity();
    return result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet);
  }

  @override
  Stream<bool> get onConnectivityChanged => connectivity.onConnectivityChanged.map((results) {
      return results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi) ||
          results.contains(ConnectivityResult.ethernet);
    });
}

/// Provider for network info
final Provider<NetworkInfo> networkInfoProvider = Provider<NetworkInfo>((ProviderRef<NetworkInfo> ref) => NetworkInfoImpl(Connectivity()));

/// Provider to check current connectivity status
final StreamProvider<bool> connectivityStatusProvider = StreamProvider<bool>((StreamProviderRef<bool> ref) {
  final NetworkInfo networkInfo = ref.watch(networkInfoProvider);
  return networkInfo.onConnectivityChanged;
});
