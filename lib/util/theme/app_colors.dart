import 'package:flutter/material.dart';

/// Color palette definitions for the Buy N Sell IIT BHU app.
/// Implements a college-inspired Blue/Teal theme.
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary Colors (Deep Navy / IIT BHU Blue)
  static const Color primary = Color(0xFF0F4C81);
  static const Color primaryDark = Color(0xFF0A3357);
  static const Color primaryLight = Color(0xFF3B7BBF);
  static const primarywidgetlight=Color(0xFF3B7BBF);
  static const primarywidgetdark=Color(0xFF0A3357);
  static const primarywhite=Color(0xFFE0E0E0);
  static const secondarywhite=Color(0xFFFFFFFF);
  static const primaryblack=Color(0xFF000000);
  static const secondaryblack=Color(0xFF1E1E1E);
  // Secondary & Accent Colors (Teal Palette)
  static const Color secondary = Color(0xFF008080);
  static const Color accent = Color(0xFF00A896);

  // Surface & Background Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);

  // Status & System Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFED6C02);
  static const Color info = Color(0xFF0288D1);

  // Element & Shimmer Colors
  static const Color divider = Color(0xFFE0E0E0);
  static const Color shimmer = Color(0xFFE0E0E0);
  static const Color border = Color(0xFFCCCCCC);

  // TODO: Add category-specific badge colors (e.g. Books, Electronics, Bicycles)
}
