/// UserModel represents a user in the BuyNSell IIT BHU marketplace application.
class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? profileImageUrl;
  final String? hostel;
  final String? room;
  final double rating;
  final DateTime createdAt;
  final bool isVerified;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.profileImageUrl,
    this.hostel,
    this.room,
    this.rating = 0.0,
    required this.createdAt,
    this.isVerified = false,
  });

  /// Factory constructor to create a UserModel instance from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      hostel: json['hostel'] as String?,
      room: json['room'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
      isVerified: json['isVerified'] as bool? ?? false,
    );
  }

  /// Converts the UserModel instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
      'hostel': hostel,
      'room': room,
      'rating': rating,
      'createdAt': createdAt.toIso8601String(),
      'isVerified': isVerified,
    };
  }

  /// Creates a copy of UserModel with updated fields.
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? profileImageUrl,
    String? hostel,
    String? room,
    double? rating,
    DateTime? createdAt,
    bool? isVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      hostel: hostel ?? this.hostel,
      room: room ?? this.room,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  // TODO: Add methods for calculation of hosteller badge, verification helper, etc.
}
