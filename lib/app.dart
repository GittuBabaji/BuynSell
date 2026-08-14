import 'package:flutter/material.dart';
import 'package:buynsell/util/theme/app_theme.dart';
import 'package:buynsell/screens/auth/login_screen.dart';
import 'package:buynsell/routes/app_routes.dart';
import 'package:buynsell/screens/home/home_screen.dart';

/// Root widget for the Buy N Sell IIT BHU application.
class BuyNSellApp extends StatelessWidget {
  const BuyNSellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buy N Sell IIT BHU',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: true,
    );
  }
}
