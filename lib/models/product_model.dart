/// Condition of a product item listed in the marketplace.
enum ProductCondition {
  brandNew,
  likeNew,
  good,
  fair;

  String toJson() {
    switch (this) {
      case ProductCondition.brandNew:
        return 'new';
      case ProductCondition.likeNew:
        return 'likeNew';
      case ProductCondition.good:
        return 'good';
      case ProductCondition.fair:
        return 'fair';
    }
  }

  static ProductCondition fromJson(String value) {
    switch (value.toLowerCase()) {
      case 'new':
      case 'brandnew':
        return ProductCondition.brandNew;
      case 'likenew':
        return ProductCondition.likeNew;
      case 'good':
        return ProductCondition.good;
      case 'fair':
        return ProductCondition.fair;
      default:
        return ProductCondition.good;
    }
  }
}

/// Status of a product listing in the marketplace.
enum ProductStatus {
  available,
  sold,
  reserved;

  String toJson() => name;

  static ProductStatus fromJson(String value) {
    return ProductStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => ProductStatus.available,
    );
  }
}

/// ProductModel represents an item listed for buy/sell in IIT BHU campus.
class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final double? originalPrice;
  final String category;
  final ProductCondition condition;
  final List<String> images;
  final String sellerId;
  final String sellerName;
  final ProductStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? location;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.category,
    required this.condition,
    required this.images,
    required this.sellerId,
    required this.sellerName,
    this.status = ProductStatus.available,
    required this.createdAt,
    this.updatedAt,
    this.location,
  });

  /// Factory constructor to create a ProductModel instance from JSON map.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      category: json['category'] as String,
      condition: ProductCondition.fromJson(json['condition'] as String? ?? 'good'),
      images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      sellerId: json['sellerId'] as String,
      sellerName: json['sellerName'] as String,
      status: ProductStatus.fromJson(json['status'] as String? ?? 'available'),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      location: json['location'] as String?,
    );
  }

  /// Converts the ProductModel instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'originalPrice': originalPrice,
      'category': category,
      'condition': condition.toJson(),
      'images': images,
      'sellerId': sellerId,
      'sellerName': sellerName,
      'status': status.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'location': location,
    };
  }

  /// Creates a copy of ProductModel with updated fields.
  ProductModel copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    double? originalPrice,
    String? category,
    ProductCondition? condition,
    List<String>? images,
    String? sellerId,
    String? sellerName,
    ProductStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? location,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      category: category ?? this.category,
      condition: condition ?? this.condition,
      images: images ?? this.images,
      sellerId: sellerId ?? this.sellerId,
      sellerName: sellerName ?? this.sellerName,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      location: location ?? this.location,
    );
  }

  // TODO: Add helper methods such as discountPercentage calculation and location filters.
}
