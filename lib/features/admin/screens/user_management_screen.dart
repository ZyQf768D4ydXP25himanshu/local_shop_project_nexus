import 'package:flutter/material.dart';

class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({super.key});

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  // Merchant Dataset
  final List<Map<String, dynamic>> _merchants = [
    {
      'shopName': 'Organic Grocery Store',
      'email': 'organic@shop.com',
      'category': 'Grocery',
      'status': 'Pending',
    },
    {
      'shopName': 'Nexus Tech Supplies',
      'email': 'tech@nexus.com',
      'category': 'Electronics',
      'status': 'Approved',
    },
    {
      'shopName': 'Urban Footwear Hub',
      'email': 'merchant@footwear.com',
      'category': 'Fashion',
      'status': 'Rejected',
    },
  ];

  void _updateStatus(int index, String newStatus) {
    setState(() {
      _merchants[index]['status'] = newStatus;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${_merchants[index]['shopName']} marked as $newStatus'),
        backgroundColor: newStatus == 'Approved' ? Colors.green : Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Approved':
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pending & Registered Merchants",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Review documentation and manage verification status of incoming merchants.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(
                          const Color(0xFFF1F5F9),
                        ),
                        horizontalMargin: 20,
                        columnSpacing: 36,
                        columns: const [
                          DataColumn(label: Text('Shop Name', style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Owner Email', style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Category', style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: _merchants.asMap().entries.map((entry) {
                          int index = entry.key;
                          Map<String, dynamic> merchant = entry.value;
                          String status = merchant['status'];

                          return DataRow(
                            cells: [
                              DataCell(Text(merchant['shopName'], style: const TextStyle(fontWeight: FontWeight.w600))),
                              DataCell(Text(merchant['email'])),
                              DataCell(Text(merchant['category'])),
                              DataCell(
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
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      ),
                                      onPressed: status == 'Approved'
                                          ? null
                                          : () => _updateStatus(index, 'Approved'),
                                      child: const Text('Approve'),
                                    ),
                                    const SizedBox(width: 8),
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: Colors.red,
                                        side: const BorderSide(color: Colors.red),
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      ),
                                      onPressed: status == 'Rejected'
                                          ? null
                                          : () => _updateStatus(index, 'Rejected'),
                                      child: const Text('Reject'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}