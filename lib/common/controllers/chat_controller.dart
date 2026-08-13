import 'package:flutter/foundation.dart';

class ChatController extends ChangeNotifier {
  List<Map<String, dynamic>> conversations = [];
  List<Map<String, dynamic>> messages = [];
  bool isLoading = false;

  Future<void> fetchConversations() async {
    // TODO: Implement fetching list of chat conversations
  }

  Future<void> fetchMessages(String conversationId) async {
    // TODO: Implement fetching chat messages for a conversation
  }

  Future<bool> sendMessage(String conversationId, String messageText) async {
    // TODO: Implement sending a message to a buyer/seller
    return false;
  }
}
