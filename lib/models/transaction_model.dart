/// Status of a marketplace transaction.
enum TransactionStatus {
  pending,
  completed,
  cancelled,
  disputed;

  String toJson() => name;

  static TransactionStatus fromJson(String value) {
    return TransactionStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => TransactionStatus.pending,
    );
  }
}

/// TransactionModel represents a purchase transaction between buyer and seller.
class TransactionModel {
  final String id;
  final String productId;
  final String productTitle;
  final String buyerId;
  final String buyerName;
  final String sellerId;
  final String sellerName;
  final double amount;
  final TransactionStatus status;
  final String paymentMethod;
  final String? meetingPoint;
  final DateTime? completedAt;
  final DateTime createdAt;

  const TransactionModel({
    required this.id,
    required this.productId,
    required this.productTitle,
    required this.buyerId,
    required this.buyerName,
    required this.sellerId,
    required this.sellerName,
    required this.amount,
    this.status = TransactionStatus.pending,
    required this.paymentMethod,
    this.meetingPoint,
    this.completedAt,
    required this.createdAt,
  });

  /// Factory constructor to create a TransactionModel from JSON map.
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String,
      productId: json['productId'] as String,
      productTitle: json['productTitle'] as String,
      buyerId: json['buyerId'] as String,
      buyerName: json['buyerName'] as String,
      sellerId: json['sellerId'] as String,
      sellerName: json['sellerName'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: TransactionStatus.fromJson(json['status'] as String? ?? 'pending'),
      paymentMethod: json['paymentMethod'] as String? ?? 'UPI',
      meetingPoint: json['meetingPoint'] as String?,
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
    );
  }

  /// Converts the TransactionModel instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productTitle': productTitle,
      'buyerId': buyerId,
      'buyerName': buyerName,
      'sellerId': sellerId,
      'sellerName': sellerName,
      'amount': amount,
      'status': status.toJson(),
      'paymentMethod': paymentMethod,
      'meetingPoint': meetingPoint,
      'completedAt': completedAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// Creates a copy of TransactionModel with updated fields.
  TransactionModel copyWith({
    String? id,
    String? productId,
    String? productTitle,
    String? buyerId,
    String? buyerName,
    String? sellerId,
    String? sellerName,
    double? amount,
    TransactionStatus? status,
    String? paymentMethod,
    String? meetingPoint,
    DateTime? completedAt,
    DateTime? createdAt,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productTitle: productTitle ?? this.productTitle,
      buyerId: buyerId ?? this.buyerId,
      buyerName: buyerName ?? this.buyerName,
      sellerId: sellerId ?? this.sellerId,
      sellerName: sellerName ?? this.sellerName,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      meetingPoint: meetingPoint ?? this.meetingPoint,
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // TODO: Add transaction completion logic and receipt generation helpers.
}
