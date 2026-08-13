import 'package:flutter/material.dart';

/// Screen displaying the list of items purchased by the user.
class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch user purchase history from API/database
    final List<Map<String, dynamic>> purchases = [
      {
        'transactionId': 'TXN100982',
        'productTitle': 'Study Table with Chair',
        'price': '₹1,500',
        'date': 'Aug 8, 2026',
        'sellerName': 'Aman Gupta',
        'sellerHostel': 'Dhanrajgiri Hostel',
        'status': 'Completed',
      },
      {
        'transactionId': 'TXN100741',
        'productTitle': 'Logitech Wireless Mouse',
        'price': '₹450',
        'date': 'Jul 28, 2026',
        'sellerName': 'Priya Singh',
        'sellerHostel': 'RSC Hostel',
        'status': 'Completed',
      },
      {
        'transactionId': 'TXN100612',
        'productTitle': 'Kettle 1.5L Kent',
        'price': '₹600',
        'date': 'Jul 15, 2026',
        'sellerName': 'Rohit Verma',
        'sellerHostel': 'Limbdi Hostel',
        'status': 'Completed',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Purchases'),
      ),
      body: purchases.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No purchases yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: purchases.length,
              itemBuilder: (context, index) {
                final item = purchases[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      ),
                    ),
                    title: Text(
                      item['productTitle'] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text('Seller: ${item['sellerName']} (${item['sellerHostel']})'),
                        Text('Date: ${item['date']}'),
                        const SizedBox(height: 4),
                        Chip(
                          label: Text(
                            item['status'] ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.zero,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          item['price'] ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                    onTap: () {
                      // TODO: Navigate to PurchaseDetailsScreen(transactionId: item['transactionId'])
                    },
                  ),
                );
              },
            ),
    );
  }
}
