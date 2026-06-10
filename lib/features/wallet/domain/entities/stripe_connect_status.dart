/// Stripe Connect account status
class StripeConnectStatus {
  const StripeConnectStatus({
    required this.connected,
    required this.isReady,
    required this.message,
    this.accountId,
    this.chargesEnabled = false,
    this.payoutsEnabled = false,
    this.detailsSubmitted = false,
    this.requirementsOutstanding = const [],
  });

  factory StripeConnectStatus.fromJson(Map<String, dynamic> json) =>
      StripeConnectStatus(
        connected: json['connected'] as bool? ?? false,
        isReady: json['isReady'] as bool? ?? false,
        message: json['message'] as String? ?? '',
        accountId: json['accountId'] as String?,
        chargesEnabled: json['chargesEnabled'] as bool? ?? false,
        payoutsEnabled: json['payoutsEnabled'] as bool? ?? false,
        detailsSubmitted: json['detailsSubmitted'] as bool? ?? false,
        requirementsOutstanding: (json['requirementsOutstanding'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
      );

  final bool connected;
  final bool isReady;
  final String message;
  final String? accountId;
  final bool chargesEnabled;
  final bool payoutsEnabled;
  final bool detailsSubmitted;
  final List<String> requirementsOutstanding;
}

/// Stripe Transfer record
class StripeTransfer {
  const StripeTransfer({
    required this.transferId,
    required this.amount,
    required this.currency,
    required this.created,
    this.eventName,
    this.type,
  });

  factory StripeTransfer.fromJson(Map<String, dynamic> json) {
    final meta = json['metadata'] as Map<String, dynamic>?;
    return StripeTransfer(
      transferId: json['transferId'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? 'usd',
      created: json['created'] as String? ?? '',
      eventName: meta?['eventName'] as String?,
      type: meta?['type'] as String?,
    );
  }

  final String transferId;
  final double amount;
  final String currency;
  final String created;
  final String? eventName;
  final String? type;
}
