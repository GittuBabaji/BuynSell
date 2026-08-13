/// Status of a scheduled meeting between buyer and seller.
enum MeetingStatus {
  proposed,
  accepted,
  completed,
  cancelled;

  String toJson() => name;

  static MeetingStatus fromJson(String value) {
    return MeetingStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => MeetingStatus.proposed,
    );
  }
}

/// MeetingModel represents a campus handover meeting between buyer and seller.
class MeetingModel {
  final String id;
  final String transactionId;
  final String productId;
  final String buyerId;
  final String sellerId;
  final String location;
  final DateTime dateTime;
  final MeetingStatus status;
  final String? notes;

  const MeetingModel({
    required this.id,
    required this.transactionId,
    required this.productId,
    required this.buyerId,
    required this.sellerId,
    required this.location,
    required this.dateTime,
    this.status = MeetingStatus.proposed,
    this.notes,
  });

  /// Factory constructor to create a MeetingModel from JSON map.
  factory MeetingModel.fromJson(Map<String, dynamic> json) {
    return MeetingModel(
      id: json['id'] as String,
      transactionId: json['transactionId'] as String,
      productId: json['productId'] as String,
      buyerId: json['buyerId'] as String,
      sellerId: json['sellerId'] as String,
      location: json['location'] as String,
      dateTime: json['dateTime'] != null
          ? DateTime.parse(json['dateTime'] as String)
          : DateTime.now(),
      status: MeetingStatus.fromJson(json['status'] as String? ?? 'proposed'),
      notes: json['notes'] as String?,
    );
  }

  /// Converts the MeetingModel instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transactionId': transactionId,
      'productId': productId,
      'buyerId': buyerId,
      'sellerId': sellerId,
      'location': location,
      'dateTime': dateTime.toIso8601String(),
      'status': status.toJson(),
      'notes': notes,
    };
  }

  /// Creates a copy of MeetingModel with updated fields.
  MeetingModel copyWith({
    String? id,
    String? transactionId,
    String? productId,
    String? buyerId,
    String? sellerId,
    String? location,
    DateTime? dateTime,
    MeetingStatus? status,
    String? notes,
  }) {
    return MeetingModel(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      productId: productId ?? this.productId,
      buyerId: buyerId ?? this.buyerId,
      sellerId: sellerId ?? this.sellerId,
      location: location ?? this.location,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }

  // TODO: Add notification reminder logic and location map coordinate helpers.
}
