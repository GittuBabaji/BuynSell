import 'package:flutter/material.dart';

/// Screen for reviewing and accepting deal terms & meeting agreement.
class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  bool _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deal Agreement'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Deal Header Summary
            Card(
              color: Colors.deepPurple.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Agreement Summary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Please verify the agreed deal terms before finalizing the meeting proposal.',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Item and Price Details
            const Text(
              'Item Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    _RowItem(label: 'Item Title', value: 'Hero Cycle 21 Speed'),
                    Divider(),
                    _RowItem(label: 'Agreed Price', value: '₹3,200', isBold: true),
                    Divider(),
                    _RowItem(label: 'Seller', value: 'Vikas Kumar (Morvi Hostel)'),
                    Divider(),
                    _RowItem(label: 'Buyer', value: 'Rahul Sharma (DG Hostel)'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Meeting Details
            const Text(
              'Meeting Location & Time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    _RowItem(label: 'Meeting Spot', value: 'Limbdi Corner (LC)'),
                    Divider(),
                    _RowItem(label: 'Date & Time', value: 'Today at 6:00 PM'),
                    Divider(),
                    _RowItem(label: 'Payment Mode', value: 'UPI / Escrow Deposit'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Terms Checklist
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              value: _isTermsAccepted,
              title: const Text(
                'I agree to inspect the product thoroughly during meeting and transfer payment upon satisfaction.',
                style: TextStyle(fontSize: 13),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (val) {
                setState(() {
                  _isTermsAccepted = val ?? false;
                });
              },
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: Propose changes or decline deal
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      foregroundColor: Colors.red,
                    ),
                    child: const Text('Propose Changes'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isTermsAccepted
                        ? () {
                            // TODO: Confirm deal agreement logic
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Deal Agreement Confirmed!'),
                              ),
                            );
                          }
                        : null,
                    child: const Text('Accept Deal'),
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

class _RowItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _RowItem({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              fontSize: isBold ? 16 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
