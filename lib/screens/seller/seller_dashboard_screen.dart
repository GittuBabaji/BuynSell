import 'package:flutter/material.dart';

/// Dashboard screen for sellers displaying key statistics and active product listings.
class SellerDashboardScreen extends StatelessWidget {
  const SellerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch dashboard statistics and seller products from state/API

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Upload Product',
            onPressed: () {
              // TODO: Navigate to UploadProductScreen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Overview Cards
            Row(
              children: [
                _buildStatCard(
                  title: 'Total Products',
                  value: '12',
                  icon: Icons.inventory_2_outlined,
                  color: Colors.blue,
                ),
                const SizedBox(width: 12),
                _buildStatCard(
                  title: 'Active Listings',
                  value: '8',
                  icon: Icons.storefront_outlined,
                  color: Colors.green,
                ),
                const SizedBox(width: 12),
                _buildStatCard(
                  title: 'Total Sales',
                  value: '₹4,500',
                  icon: Icons.attach_money_outlined,
                  color: Colors.orange,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Navigation Quick Links
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Your Products',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to MyProductsScreen
                  },
                  child: const Text('View All'),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Seller's Recent Products List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4, // Sample placeholder count
              itemBuilder: (context, index) {
                // TODO: Map to actual seller product data
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.image, color: Colors.grey),
                    ),
                    title: Text('Seller Listing #${index + 1}'),
                    subtitle: const Text('₹699 • Active'),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'edit') {
                          // TODO: Navigate to EditProductScreen(productId: '...')
                        } else if (value == 'delete') {
                          // TODO: Delete product item
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to UploadProductScreen
        },
        icon: const Icon(Icons.add_a_photo),
        label: const Text('Add Listing'),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: color.withValues(alpha: 0.15),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(height: 12),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
