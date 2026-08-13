/// CategoryModel represents an item category in the marketplace.
class CategoryModel {
  final String id;
  final String name;
  final String icon;
  final int productCount;
  final String? description;

  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.productCount = 0,
    this.description,
  });

  /// Factory constructor to create a CategoryModel instance from JSON map.
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      productCount: json['productCount'] as int? ?? 0,
      description: json['description'] as String?,
    );
  }

  /// Converts the CategoryModel instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'productCount': productCount,
      'description': description,
    };
  }

  /// Creates a copy of CategoryModel with updated fields.
  CategoryModel copyWith({
    String? id,
    String? name,
    String? icon,
    int? productCount,
    String? description,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      productCount: productCount ?? this.productCount,
      description: description ?? this.description,
    );
  }

  // TODO: Add category filter utilities and predefined categories list.
}
