import 'package:flutter/material.dart';

class MerchantDashboardScreen extends StatelessWidget {
  const MerchantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Merchant Console')),
      body: const Center(child: Text('Merchant Dashboard')),
    );
  }
}
