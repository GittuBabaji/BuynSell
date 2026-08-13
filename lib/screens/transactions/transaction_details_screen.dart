import 'package:flutter/material.dart';

/// Screen displaying comprehensive details and status timeline of a transaction.
class TransactionDetailsScreen extends StatelessWidget {
  final String transactionId;

  const TransactionDetailsScreen({
    super.key,
    required this.transactionId,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch details for transactionId
    final List<Map<String, dynamic>> timelineSteps = [
      {
        'title': 'Deal Agreed',
        'subtitle': 'Price and terms confirmed',
        'time': 'Aug 10, 2026 • 04:15 PM',
        'isCompleted': true,
      },
      {
        'title': 'Meeting Scheduled',
        'subtitle': 'Campus spot: Limbdi Corner (LC)',
        'time': 'Aug 11, 2026 • 06:00 PM',
        'isCompleted': true,
      },
      {
        'title': 'Item Handover & Inspection',
        'subtitle': 'Buyer verifies item physical condition',
        'time': 'Pending',
        'isCompleted': false,
      },
      {
        'title': 'Payment Released',
        'subtitle': 'Escrow funds sent to seller',
        'time': 'Pending',
        'isCompleted': false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Transaction ID Header
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Transaction Ref',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          transactionId,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                    const Chip(
                      label: Text(
                        'In Progress',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      backgroundColor: Colors.orange,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Item Details Card
            const Text(
              'Item Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.directions_bike, color: Colors.deepPurple),
                ),
                title: const Text(
                  'Hero Cycle 21 Speed',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Category: Vehicles • Condition: Like New'),
                trailing: const Text(
                  '₹3,200',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Status Timeline
            const Text(
              'Status Timeline',
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
                  children: List.generate(timelineSteps.length, (index) {
                    final step = timelineSteps[index];
                    final bool isLast = index == timelineSteps.length - 1;
                    final bool isDone = step['isCompleted'] == true;

                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor:
                                    isDone ? Colors.green : Colors.grey.shade300,
                                child: Icon(
                                  isDone ? Icons.check : Icons.circle,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                              if (!isLast)
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    color: isDone ? Colors.green : Colors.grey.shade300,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    step['title'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: isDone ? Colors.black : Colors.grey.shade700,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    step['subtitle'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    step['time'],
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: isDone ? Colors.green.shade700 : Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // TODO: Open chat with counterparty
                    },
                    icon: const Icon(Icons.chat),
                    label: const Text('Open Chat'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Confirm item handover & release payment
                    },
                    icon: const Icon(Icons.check_circle),
                    label: const Text('Confirm Deal'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
