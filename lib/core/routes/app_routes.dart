import 'package:flutter/material.dart';
import '../../features/customer/presentation/screens/customer_home_screen.dart';
import '../../features/merchant/presentation/screens/merchant_dashboard_screen.dart';

class AppRoutes {
  AppRoutes._();
  static const String customerHome = '/customer-home';
  static const String merchantDashboard = '/merchant-dashboard';

  static Map<String, WidgetBuilder> get routes {
    return {
      customerHome: (context) => const CustomerHomeScreen(),
      merchantDashboard: (context) => const MerchantDashboardScreen(),
    };
  }
}
