import 'package:flutter/material.dart';

class MerchantApprovalScreen extends StatefulWidget {
  const MerchantApprovalScreen({super.key});

  @override
  State<MerchantApprovalScreen> createState() => _MerchantApprovalScreenState();
}

class _MerchantApprovalScreenState extends State<MerchantApprovalScreen> {
  // Merchant Moderation Dataset
  final List<Map<String, dynamic>> _merchants = [
    {
      'shopName': 'Organic Foods Store',
      'license': '#559403',
      'ownerEmail': 'contact@organicfoods.com',
      'status': 'Pending',
    },
    {
      'shopName': 'Prime Electronics Mart',
      'license': '#882194',
      'ownerEmail': 'support@primeelectronic.in',
      'status': 'Pending',
    },
    {
      'shopName': 'Daily Needs Supermarket',
      'license': '#331084',
      'ownerEmail': 'dailyneeds@retail.com',
      'status': 'Verified',
    },
    {
      'shopName': 'City Footwear & Apparel',
      'license': '#119022',
      'ownerEmail': 'cityfootwear@gmail.com',
      'status': 'Rejected',
    },
  ];

  void _verifyMerchant(int index) {
    setState(() {
      _merchants[index]['status'] = 'Verified';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${_merchants[index]['shopName']} license verified successfully!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _rejectMerchant(int index) {
    setState(() {
      _merchants[index]['status'] = 'Rejected';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${_merchants[index]['shopName']} application rejected.'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Verified':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      case 'Pending':
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          "Merchant Verification Panel",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Merchant License & KYC Moderation",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Review merchant business credentials and update their operational verification status.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: _merchants.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final merchant = _merchants[index];
                  final String status = merchant['status'];

                  return Card(
                    elevation: 1.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE2E8F0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.store, color: Color(0xFF0F172A)),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  merchant['shopName'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0F172A),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "License: ${merchant['license']}  •  ${merchant['ownerEmail']}",
                                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getStatusColor(status).withOpacity(0.12),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: _getStatusColor(status)),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                color: _getStatusColor(status),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                ),
                                onPressed: status == 'Verified'
                                    ? null
                                    : () => _verifyMerchant(index),
                                child: const Text("Verify"),
                              ),
                              const SizedBox(width: 8),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                  side: const BorderSide(color: Colors.red),
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                ),
                                onPressed: status == 'Rejected'
                                    ? null
                                    : () => _rejectMerchant(index),
                                child: const Text("Reject"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}