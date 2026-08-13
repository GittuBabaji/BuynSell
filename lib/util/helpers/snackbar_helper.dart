import 'package:flutter/material.dart';

/// Helper utility for displaying styled SnackBars across the application.
class SnackbarHelper {
  // Private constructor to prevent instantiation
  SnackbarHelper._();

  /// Displays a success SnackBar with a green background.
  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: const Color(0xFF2E7D32),
      icon: Icons.check_circle_outline,
    );
  }

  /// Displays an error SnackBar with a red background.
  static void showError(BuildContext context, String message) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: const Color(0xFFD32F2F),
      icon: Icons.error_outline,
    );
  }

  /// Displays an informational SnackBar with a blue background.
  static void showInfo(BuildContext context, String message) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: const Color(0xFF0288D1),
      icon: Icons.info_outline,
    );
  }

  /// Displays a warning SnackBar with an amber background.
  static void showWarning(BuildContext context, String message) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: const Color(0xFFED6C02),
      icon: Icons.warning_amber_rounded,
    );
  }

  static void _showSnackBar({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // TODO: Add support for custom action callbacks on SnackBars
}
