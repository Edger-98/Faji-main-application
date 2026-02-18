/// Payment Sheet Response Model
class PaymentSheetModel {
  PaymentSheetModel({
    required this.paymentIntentClientSecret,
    required this.ephemeralKey,
    required this.customerId,
    required this.orderId,
    required this.publishableKey,
  });

  factory PaymentSheetModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;
    
    return PaymentSheetModel(
      paymentIntentClientSecret: data['paymentIntentClientSecret'] as String,
      ephemeralKey: data['ephemeralKey'] as String,
      customerId: data['customerId'] as String,
      orderId: data['orderId'] as String,
      publishableKey: data['publishableKey'] as String,
    );
  }

  final String paymentIntentClientSecret;
  final String ephemeralKey;
  final String customerId;
  final String orderId;
  final String publishableKey;

  Map<String, dynamic> toJson() => {
        'paymentIntentClientSecret': paymentIntentClientSecret,
        'ephemeralKey': ephemeralKey,
        'customerId': customerId,
        'orderId': orderId,
        'publishableKey': publishableKey,
      };
}
