import 'package:flutter/material.dart';

/// Quick helper functions for screen dimensions.
///
/// Usage:
/// ```dart
/// import 'package:buynsell/util/helpers/screen_helper.dart';
///
/// final width  = TScreenHelper.screenWidth(context);
/// final height = TScreenHelper.screenHeight(context);
/// final half   = TScreenHelper.percentWidth(context, 50);
/// ```
class TScreenHelper {
  TScreenHelper._();

  /// Full screen width in logical pixels.
  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  /// Full screen height in logical pixels.
  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  /// A percentage of screen width (e.g. 50 → half the width).
  static double percentWidth(BuildContext context, double percent) =>
      MediaQuery.sizeOf(context).width * (percent / 100);

  /// A percentage of screen height (e.g. 50 → half the height).
  static double percentHeight(BuildContext context, double percent) =>
      MediaQuery.sizeOf(context).height * (percent / 100);

  /// Status bar height (top safe area).
  static double statusBarHeight(BuildContext context) =>
      MediaQuery.paddingOf(context).top;

  /// Bottom safe area (home indicator / nav bar).
  static double bottomSafeArea(BuildContext context) =>
      MediaQuery.paddingOf(context).bottom;

  /// App bar height + status bar height.
  static double appBarHeight() =>
      kToolbarHeight;
}
