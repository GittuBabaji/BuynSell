import 'package:flutter/material.dart';

/// Screen displaying the list of active chat conversations.
class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch user conversations from backend/state manager
    final List<Map<String, dynamic>> conversations = [
      {
        'id': 'conv_1',
        'userName': 'Siddharth Rao',
        'productTitle': 'MacBook Air M1 256GB',
        'lastMessage': 'Can we meet at VT today around 6 PM?',
        'timestamp': '10:42 AM',
        'unreadCount': 2,
        'productThumbnail': '',
      },
      {
        'id': 'conv_2',
        'userName': 'Neha Gupta',
        'productTitle': 'Lab Coat & Safety Goggles',
        'lastMessage': 'Yes, ₹300 works for me.',
        'timestamp': 'Yesterday',
        'unreadCount': 0,
        'productThumbnail': '',
      },
      {
        'id': 'conv_3',
        'userName': 'Rohan Sharma',
        'productTitle': 'Badminton Racket Yonex',
        'lastMessage': 'Is this still available?',
        'timestamp': 'Aug 9',
        'unreadCount': 0,
        'productThumbnail': '',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement conversation search
            },
          ),
        ],
      ),
      body: conversations.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No messages yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              itemCount: conversations.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final conv = conversations[index];
                final int unread = conv['unreadCount'] ?? 0;

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.deepPurple.shade100,
                        child: Text(
                          (conv['userName'] as String)[0],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: const Icon(
                            Icons.shopping_bag,
                            size: 10,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          conv['userName'] ?? '',
                          style: TextStyle(
                            fontWeight: unread > 0 ? FontWeight.bold : FontWeight.w600,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        conv['timestamp'] ?? '',
                        style: TextStyle(
                          fontSize: 12,
                          color: unread > 0 ? Colors.deepPurple : Colors.grey,
                          fontWeight: unread > 0 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        'Re: ${conv['productTitle']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.deepPurple.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              conv['lastMessage'] ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: unread > 0 ? Colors.black87 : Colors.grey.shade600,
                                fontWeight: unread > 0 ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                          ),
                          if (unread > 0)
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.deepPurple,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '$unread',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    // TODO: Navigate to ChatScreen(conversationId: conv['id'])
                  },
                );
              },
            ),
    );
  }
}
