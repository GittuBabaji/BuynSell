import 'package:flutter/material.dart';
import 'package:buynsell/screens/auth/login_screen.dart';
import 'package:buynsell/screens/auth/register_screen.dart';
import 'package:buynsell/screens/auth/privacy_policy_screen.dart';
import 'package:buynsell/screens/auth/terms_conditions_screen.dart';

/// Routes manager and route definitions for Buy N Sell app.
class AppRoutes {
  AppRoutes._();

  // Route Name Constants
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String categories = '/categories';
  static const String productList = '/productList';
  static const String productDetails = '/productDetails';
  static const String search = '/search';
  static const String filters = '/filters';
  static const String sellerDashboard = '/sellerDashboard';
  static const String uploadProduct = '/uploadProduct';
  static const String editProduct = '/editProduct';
  static const String myProducts = '/myProducts';
  static const String sales = '/sales';
  static const String wishlist = '/wishlist';
  static const String purchases = '/purchases';
  static const String purchaseDetails = '/purchaseDetails';
  static const String conversations = '/conversations';
  static const String chat = '/chat';
  static const String transactions = '/transactions';
  static const String recentTransactions = '/recentTransactions';
  static const String transactionDetails = '/transactionDetails';
  static const String meetingPoint = '/meetingPoint';
  static const String agreement = '/agreement';
  static const String profile = '/profile';
  static const String appSettings = '/settings';
  static const String privacyPolicy = '/privacyPolicy';
  static const String termsConditions = '/termsConditions';

  /// Dynamically generates MaterialPageRoute for specified route [settings].
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );

      case register:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
          settings: settings,
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Home'),
          settings: settings,
        );

      case categories:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Categories'),
          settings: settings,
        );

      case productList:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Product List'),
          settings: settings,
        );

      case productDetails:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Product Details'),
          settings: settings,
        );

      case search:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Search'),
          settings: settings,
        );

      case filters:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Filters'),
          settings: settings,
        );

      case sellerDashboard:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Seller Dashboard'),
          settings: settings,
        );

      case uploadProduct:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Upload Product'),
          settings: settings,
        );

      case editProduct:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Edit Product'),
          settings: settings,
        );

      case myProducts:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('My Products'),
          settings: settings,
        );

      case sales:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Sales'),
          settings: settings,
        );

      case wishlist:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Wishlist'),
          settings: settings,
        );

      case purchases:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Purchases'),
          settings: settings,
        );

      case purchaseDetails:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Purchase Details'),
          settings: settings,
        );

      case conversations:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Conversations'),
          settings: settings,
        );

      case chat:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Chat'),
          settings: settings,
        );

      case transactions:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Transactions'),
          settings: settings,
        );

      case recentTransactions:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Recent Transactions'),
          settings: settings,
        );

      case transactionDetails:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Transaction Details'),
          settings: settings,
        );

      case meetingPoint:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Meeting Point'),
          settings: settings,
        );

      case agreement:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Agreement'),
          settings: settings,
        );

      case profile:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Profile'),
          settings: settings,
        );

      case appSettings:
        return MaterialPageRoute(
          builder: (_) => _buildPlaceholderScreen('Settings'),
          settings: settings,
        );

      case privacyPolicy:
        return MaterialPageRoute(
          builder: (_) => const PrivacyPolicyScreen(),
          settings: settings,
        );

      case termsConditions:
        return MaterialPageRoute(
          builder: (_) => const TermsAndConditionsScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }

  /// Helper to create starter placeholder screens with TODO comments.
  static Widget _buildPlaceholderScreen(String title) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('$title Screen Placeholder - TODO: Implement screen layout'),
      ),
    );
  }
}
