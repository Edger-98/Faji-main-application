/// Ticketing information model
class TicketingModel {

  TicketingModel({
    required this.enabled,
    required this.price,
    required this.currency,
    required this.currencySymbol,
    this.totalTickets,
    this.availableTickets,
    this.soldTickets,
    required this.isSoldOut,
    required this.isFree,
  });

  factory TicketingModel.fromJson(Map<String, dynamic> json) {
    return TicketingModel(
      enabled: json['enabled'] as bool? ?? false,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] as String? ?? 'USD',
      currencySymbol: json['currencySymbol'] as String? ?? '\$',
      totalTickets: json['totalTickets'] as int?,
      availableTickets: json['availableTickets'] as int?,
      soldTickets: json['soldTickets'] as int?,
      isSoldOut: json['isSoldOut'] as bool? ?? false,
      isFree: json['isFree'] as bool? ?? true,
    );
  }
  final bool enabled;
  final double price;
  final String currency;
  final String currencySymbol;
  final int? totalTickets;
  final int? availableTickets;
  final int? soldTickets;
  final bool isSoldOut;
  final bool isFree;

  Map<String, dynamic> toJson() => {
      'enabled': enabled,
      'price': price,
      'currency': currency,
      'currencySymbol': currencySymbol,
      'totalTickets': totalTickets,
      'availableTickets': availableTickets,
      'soldTickets': soldTickets,
      'isSoldOut': isSoldOut,
      'isFree': isFree,
    };

  // Helper getters
  int get ticketsRemaining => availableTickets ?? 0;
  int get ticketsSold => soldTickets ?? 0;
  bool get hasTickets => enabled && !isFree;
  String get formattedPrice => '$currencySymbol${price.toStringAsFixed(2)}';
}
