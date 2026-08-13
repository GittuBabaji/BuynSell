/// Type of chat message.
enum MessageType {
  text,
  image,
  offer,
  system;

  String toJson() => name;

  static MessageType fromJson(String value) {
    return MessageType.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => MessageType.text,
    );
  }
}

/// MessageModel represents an individual chat message in a conversation.
class MessageModel {
  final String id;
  final String conversationId;
  final String senderId;
  final String text;
  final String? imageUrl;
  final MessageType type;
  final DateTime createdAt;
  final bool isRead;

  const MessageModel({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.text,
    this.imageUrl,
    this.type = MessageType.text,
    required this.createdAt,
    this.isRead = false,
  });

  /// Factory constructor to create a MessageModel from JSON map.
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as String,
      conversationId: json['conversationId'] as String,
      senderId: json['senderId'] as String,
      text: json['text'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      type: MessageType.fromJson(json['type'] as String? ?? 'text'),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
      isRead: json['isRead'] as bool? ?? false,
    );
  }

  /// Converts the MessageModel instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'conversationId': conversationId,
      'senderId': senderId,
      'text': text,
      'imageUrl': imageUrl,
      'type': type.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'isRead': isRead,
    };
  }

  /// Creates a copy of MessageModel with updated fields.
  MessageModel copyWith({
    String? id,
    String? conversationId,
    String? senderId,
    String? text,
    String? imageUrl,
    MessageType? type,
    DateTime? createdAt,
    bool? isRead,
  }) {
    return MessageModel(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      senderId: senderId ?? this.senderId,
      text: text ?? this.text,
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
    );
  }

  // TODO: Add formatted timestamp utilities and payload parsing for offer messages.
}
