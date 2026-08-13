import 'package:flutter/material.dart';

/// Screen listing recent buy and sell transactions.
class RecentTransactionsScreen extends StatelessWidget {
  const RecentTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Fetch transaction history list
    final List<Map<String, dynamic>> transactions = [
      {
        'id': 'TXN9901',
        'type': 'BUY',
        'title': 'Hero Cycle 21 Speed',
        'counterparty': 'Vikas Kumar',
        'amount': '₹3,200',
        'date': 'Aug 11, 2026',
        'status': 'Pending Meeting',
      },
      {
        'id': 'TXN9884',
        'type': 'SELL',
        'title': 'Engineering Drawing Kit',
        'counterparty': 'Kartik Gupta',
        'amount': '₹700',
        'date': 'Aug 10, 2026',
        'status': 'Completed',
      },
      {
        'id': 'TXN9765',
        'type': 'BUY',
        'title': 'Study Table with Chair',
        'counterparty': 'Aman Gupta',
        'amount': '₹1,500',
        'date': 'Aug 8, 2026',
        'status': 'Completed',
      },
      {
        'id': 'TXN9650',
        'type': 'SELL',
        'title': 'Induction Cooktop Philips',
        'counterparty': 'Divya Patel',
        'amount': '₹1,200',
        'date': 'Aug 2, 2026',
        'status': 'Completed',
      },
      {
        'id': 'TXN9500',
        'type': 'BUY',
        'title': 'Electric Kettle',
        'counterparty': 'Suresh Kumar',
        'amount': '₹600',
        'date': 'Jul 28, 2026',
        'status': 'Cancelled',
      },
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recent Transactions'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Purchases'),
              Tab(text: 'Sales'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _TransactionListView(transactions: transactions),
            _TransactionListView(
              transactions: transactions.where((t) => t['type'] == 'BUY').toList(),
            ),
            _TransactionListView(
              transactions: transactions.where((t) => t['type'] == 'SELL').toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionListView extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const _TransactionListView({required this.transactions});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Pending Meeting':
        return Colors.orange;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return Center(
        child: Text(
          'No transactions found',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final txn = transactions[index];
        final bool isBuy = txn['type'] == 'BUY';

        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            leading: CircleAvatar(
              backgroundColor: isBuy ? Colors.blue.shade100 : Colors.green.shade100,
              child: Icon(
                isBuy ? Icons.arrow_downward : Icons.arrow_upward,
                color: isBuy ? Colors.blue : Colors.green,
              ),
            ),
            title: Text(
              txn['title'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text('${isBuy ? 'Seller' : 'Buyer'}: ${txn['counterparty']}'),
                Text('Date: ${txn['date']}'),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: _getStatusColor(txn['status'] ?? '').withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    txn['status'] ?? '',
                    style: TextStyle(
                      color: _getStatusColor(txn['status'] ?? ''),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            trailing: Text(
              txn['amount'] ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isBuy ? Colors.black : Colors.green,
              ),
            ),
            onTap: () {
              // TODO: Navigate to TransactionDetailsScreen(transactionId: txn['id'])
            },
          ),
        );
      },
    );
  }
}
