import 'package:flutter/material.dart';

/// Screen displaying the user's wishlisted items.
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch wishlist items from provider/state management
    final List<Map<String, dynamic>> wishlistedItems = [
      {
        'id': 'w1',
        'title': 'Engineering Physics Textbook (HC Verma)',
        'price': '₹350',
        'category': 'Books',
        'seller': 'Rahul Sharma (DG Hostel)',
        'imageUrl': '',
      },
      {
        'id': 'w2',
        'title': 'Calculus Casio FX-991EX Scientific Calculator',
        'price': '₹800',
        'category': 'Electronics',
        'seller': 'Ananya Patel (Gargi Hostel)',
        'imageUrl': '',
      },
      {
        'id': 'w3',
        'title': 'Hero Cycle 21 Speed',
        'price': '₹3,200',
        'category': 'Vehicles',
        'seller': 'Vikas Kumar (Morvi Hostel)',
        'imageUrl': '',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep_outlined),
            onPressed: () {
              // TODO: Clear all wishlist items
            },
            tooltip: 'Clear Wishlist',
          ),
        ],
      ),
      body: wishlistedItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your wishlist is empty',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Navigate to browse products
                    },
                    child: const Text('Explore Marketplace'),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(12.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: wishlistedItems.length,
              itemBuilder: (context, index) {
                final item = wishlistedItems[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 16,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // TODO: Remove item from wishlist
                                    },
                                    tooltip: 'Remove from wishlist',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'] ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['price'] ?? '',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['seller'] ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
