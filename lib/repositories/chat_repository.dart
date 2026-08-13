import 'package:buynsell/models/conversation_model.dart';
import 'package:buynsell/models/message_model.dart';

/// Abstract repository defining the real-time chat data contract
/// for buyers and sellers in the IIT BHU Buy & Sell Marketplace app.
abstract class ChatRepository {
  /// Fetches all active conversation threads for a given [userId].
  ///
  /// TODO: Fetch active conversation threads from database or realtime service.
  Future<List<ConversationModel>> getConversations(String userId);

  /// Retrieves a specific conversation by its [conversationId].
  ///
  /// TODO: Fetch single conversation details by ID.
  Future<ConversationModel?> getConversationById(String conversationId);

  /// Retrieves messages for a specific [conversationId] with pagination support.
  ///
  /// TODO: Load message history for conversation.
  Future<List<MessageModel>> getMessages(
    String conversationId, {
    int limit = 50,
    String? beforeId,
  });

  /// Sends a new message in a conversation.
  ///
  /// TODO: Push message to backend and notify recipient.
  Future<MessageModel> sendMessage(MessageModel message);

  /// Marks unread messages in a conversation as read by [userId].
  ///
  /// TODO: Update read receipts in database.
  Future<void> markAsRead(String conversationId, String userId);

  /// Initiates a new conversation between buyer and seller regarding a product.
  ///
  /// TODO: Create or fetch existing conversation thread between buyer and seller.
  Future<ConversationModel> createConversation({
    required String productId,
    required String buyerId,
    required String sellerId,
  });

  /// Deletes a conversation thread by its [conversationId].
  ///
  /// TODO: Remove or hide conversation from user's chat history.
  Future<void> deleteConversation(String conversationId);
}
