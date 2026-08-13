import 'dart:io';
import 'package:flutter/material.dart';

/// Helper utility for device-specific properties, dimensions, and actions.
class DeviceUtils {
  // Private constructor to prevent instantiation
  DeviceUtils._();

  /// Checks if the current operating system is Android.
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  /// Checks if the current operating system is iOS.
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Gets the screen width of the given context.
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Gets the screen height of the given context.
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Checks if the device is a tablet based on screen shortest side.
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 600;
  }

  /// Hides the soft keyboard if currently displayed.
  static void hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  // TODO: Add support for checking device orientation, status bar height, and navigation bar padding
}
