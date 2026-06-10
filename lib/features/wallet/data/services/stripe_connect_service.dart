import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/stripe_connect_status.dart';

class StripeConnectService {
  const StripeConnectService(this._dio);
  final Dio _dio;

  /// GET /stripe/connect/status
  Future<StripeConnectStatus> getStatus() async {
    final Response response = await _dio.get('/stripe/connect/status');
    final Map<String, dynamic> data = _extractData(response);
    return StripeConnectStatus.fromJson(data);
  }

  /// POST /stripe/connect/onboard → returns onboardingUrl
  Future<String> startOnboarding({
    String country = 'US',
    String businessType = 'individual',
  }) async {
    final Response response = await _dio.post(
      '/stripe/connect/onboard',
      data: <String, String>{
        'country': country,
        'businessType': businessType,
      },
    );
    final Map<String, dynamic> data = _extractData(response);
    return data['onboardingUrl'] as String;
  }

  /// GET /stripe/connect/refresh → returns new onboardingUrl
  Future<String> refreshOnboarding() async {
    final Response response = await _dio.get('/stripe/connect/refresh');
    final Map<String, dynamic> data = _extractData(response);
    return data['onboardingUrl'] as String;
  }

  /// GET /stripe/connect/dashboard → returns single-use dashboardUrl
  Future<String> getDashboardUrl() async {
    final Response response = await _dio.get('/stripe/connect/dashboard');
    final Map<String, dynamic> data = _extractData(response);
    return data['dashboardUrl'] as String;
  }

  /// GET /stripe/connect/transfers
  Future<List<StripeTransfer>> getTransfers({int limit = 20}) async {
    final Response response = await _dio.get(
      '/stripe/connect/transfers',
      queryParameters: <String, dynamic>{'limit': limit},
    );
    final Map<String, dynamic> data = _extractData(response);
    final List<dynamic> list = data['transfers'] as List<dynamic>? ?? [];
    return list
        .map((e) => StripeTransfer.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /stripe/connect/payout — optional amount; omit to pay full balance
  Future<Map<String, dynamic>> requestPayout({double? amount}) async {
    final Response response = await _dio.post(
      '/stripe/connect/payout',
      data: amount != null ? <String, dynamic>{'amount': amount} : <String, dynamic>{},
    );
    return _extractData(response);
  }

  Map<String, dynamic> _extractData(Response response) {
    final body = response.data as Map<String, dynamic>;
    return (body['data'] as Map<String, dynamic>?) ?? body;
  }
}

final Provider<StripeConnectService> stripeConnectServiceProvider =
    Provider<StripeConnectService>((ProviderRef<StripeConnectService> ref) {
  return StripeConnectService(ref.watch(dioProvider));
});
