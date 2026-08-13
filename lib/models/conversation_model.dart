/// ConversationModel represents a chat conversation between buyer and seller.
class ConversationModel {
  final String id;
  final String productId;
  final String productTitle;
  final String? productImage;
  final String buyerId;
  final String buyerName;
  final String sellerId;
  final String sellerName;
  final String lastMessage;
  final DateTime lastMessageTime;
  final int unreadCount;
  final bool isActive;

  const ConversationModel({
    required this.id,
    required this.productId,
    required this.productTitle,
    this.productImage,
    required this.buyerId,
    required this.buyerName,
    required this.sellerId,
    required this.sellerName,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unreadCount = 0,
    this.isActive = true,
  });

  /// Factory constructor to create a ConversationModel from JSON map.
  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['id'] as String,
      productId: json['productId'] as String,
      productTitle: json['productTitle'] as String,
      productImage: json['productImage'] as String?,
      buyerId: json['buyerId'] as String,
      buyerName: json['buyerName'] as String,
      sellerId: json['sellerId'] as String,
      sellerName: json['sellerName'] as String,
      lastMessage: json['lastMessage'] as String? ?? '',
      lastMessageTime: json['lastMessageTime'] != null
          ? DateTime.parse(json['lastMessageTime'] as String)
          : DateTime.now(),
      unreadCount: json['unreadCount'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? true,
    );
  }

  /// Converts the ConversationModel instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'productTitle': productTitle,
      'productImage': productImage,
      'buyerId': buyerId,
      'buyerName': buyerName,
      'sellerId': sellerId,
      'sellerName': sellerName,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime.toIso8601String(),
      'unreadCount': unreadCount,
      'isActive': isActive,
    };
  }

  /// Creates a copy of ConversationModel with updated fields.
  ConversationModel copyWith({
    String? id,
    String? productId,
    String? productTitle,
    String? productImage,
    String? buyerId,
    String? buyerName,
    String? sellerId,
    String? sellerName,
    String? lastMessage,
    DateTime? lastMessageTime,
    int? unreadCount,
    bool? isActive,
  }) {
    return ConversationModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productTitle: productTitle ?? this.productTitle,
      productImage: productImage ?? this.productImage,
      buyerId: buyerId ?? this.buyerId,
      buyerName: buyerName ?? this.buyerName,
      sellerId: sellerId ?? this.sellerId,
      sellerName: sellerName ?? this.sellerName,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      unreadCount: unreadCount ?? this.unreadCount,
      isActive: isActive ?? this.isActive,
    );
  }

  // TODO: Add helper methods to get current partner ID/name given current userId.
}
