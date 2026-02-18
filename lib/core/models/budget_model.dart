class BudgetDetailModel {

  BudgetDetailModel({
    required this.total,
    required this.spent,
    required this.remaining,
    required this.currency,
    required this.currencySymbol,
    required this.items,
    required this.progress,
  });

  factory BudgetDetailModel.fromJson(Map<String, dynamic> json) {
    return BudgetDetailModel(
      total: (json['total'] as num).toDouble(),
      spent: (json['spent'] as num).toDouble(),
      remaining: (json['remaining'] as num).toDouble(),
      currency: json['currency'] as String,
      currencySymbol: json['currencySymbol'] as String,
      items: (json['items'] as List?)
              ?.map((e) => BudgetItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
    );
  }
  final double total;
  final double spent;
  final double remaining;
  final String currency;
  final String currencySymbol;
  final List<BudgetItemModel> items;
  final double progress;
}

class BudgetItemModel {

  BudgetItemModel({
    required this.id,
    required this.category,
    required this.amount,
    required this.status,
    this.paidAt,
  });

  factory BudgetItemModel.fromJson(Map<String, dynamic> json) {
    return BudgetItemModel(
      id: json['id'] as String,
      category: json['category'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      paidAt: json['paidAt'] != null
          ? DateTime.parse(json['paidAt'] as String)
          : null,
    );
  }
  final String id;
  final String category;
  final double amount;
  final String status;
  final DateTime? paidAt;
}
