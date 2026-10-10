import 'package:flutter/material.dart';
import 'package:buynsell/util/theme/app_theme.dart';
// import 'package:buynsell/screens/auth/login_screen.dart';
import 'package:buynsell/routes/app_routes.dart';
import 'package:buynsell/screens/splash/splash_screen.dart';
import 'package:buynsell/screens/onboarding/onboarding.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:get/get.dart';


/// Root widget for the Buy N Sell IIT BHU application.
class BuyNSellApp extends StatelessWidget {
  const BuyNSellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Textconstants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const SplashScreen(nextScreen: OnboardingScreen()),
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
