import 'package:flutter/material.dart';

/// Screen displaying the detailed information of a specific purchase.
class PurchaseDetailsScreen extends StatelessWidget {
  final String transactionId;

  const PurchaseDetailsScreen({
    super.key,
    required this.transactionId,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch purchase details based on transactionId
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Transaction Status Card
            Card(
              color: Colors.green.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.green.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.verified, color: Colors.green, size: 36),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Transaction Completed',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Transaction ID: $transactionId',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Product Details Section
            const Text(
              'Item Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.shopping_bag, size: 36, color: Colors.grey),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Study Table with Chair',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('Category: Furniture'),
                          SizedBox(height: 4),
                          Text(
                            '₹1,500',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Seller Details
            const Text(
              'Seller Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text('Aman Gupta'),
                subtitle: Text('Dhanrajgiri Hostel (DG) • CSE Batch \'25'),
                trailing: IconButton(
                  icon: Icon(Icons.chat_bubble_outline),
                  onPressed: null, // TODO: Navigate to chat
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Payment & Meeting Summary
            const Text(
              'Payment & Delivery Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    _DetailRow(label: 'Payment Method', value: 'UPI / Escrow'),
                    Divider(),
                    _DetailRow(label: 'Meeting Point', value: 'Limbdi Corner (LC)'),
                    Divider(),
                    _DetailRow(label: 'Date & Time', value: 'Aug 8, 2026 at 5:30 PM'),
                    Divider(),
                    _DetailRow(label: 'Amount Paid', value: '₹1,500', isBold: true),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Actions
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // TODO: Download invoice or report issue
                },
                icon: const Icon(Icons.receipt_long),
                label: const Text('Download Receipt'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _DetailRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
