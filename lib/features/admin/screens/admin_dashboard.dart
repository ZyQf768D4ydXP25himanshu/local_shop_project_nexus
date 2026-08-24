import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar Drawer Structure
          Container(
            width: 220,
            color: const Color(0xFF0F172A),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Admin Panel",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                ListTile(
                  leading: const Icon(Icons.dashboard, color: Colors.white),
                  title: const Text("Dashboard", style: TextStyle(color: Colors.white)),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.people, color: Colors.white70),
                  title: const Text("Users", style: TextStyle(color: Colors.white70)),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {},
                ),
              ],
            ),
          ),
          // Main Admin Content Area
          Expanded(
            child: Container(
              color: const Color(0xFFF8FAFC),
              padding: const EdgeInsets.all(24),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome, Admin",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Main Admin Content Area",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}