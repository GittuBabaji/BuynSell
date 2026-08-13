import 'package:flutter/material.dart';

/// Helper utility for Flutter Navigator operations.
class NavigationHelper {
  // Private constructor to prevent instantiation
  NavigationHelper._();

  /// Pushes a new screen route onto the navigator stack.
  static Future<T?> push<T extends Object?>(BuildContext context, Widget page) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Replaces the current route on the navigator stack with a new page.
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    BuildContext context,
    Widget page, {
    TO? result,
  }) {
    return Navigator.pushReplacement<T, TO>(
      context,
      MaterialPageRoute(builder: (_) => page),
      result: result,
    );
  }

  /// Clears all routes from the navigation stack and sets the new page as root.
  static Future<T?> pushAndClearAll<T extends Object?>(
    BuildContext context,
    Widget page,
  ) {
    return Navigator.pushAndRemoveUntil<T>(
      context,
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  /// Pops the top route off the navigator stack.
  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    if (Navigator.canPop(context)) {
      Navigator.pop<T>(context, result);
    }
  }

  /// Pops routes until the given route predicate evaluates to true.
  static void popUntil(BuildContext context, RoutePredicate predicate) {
    Navigator.popUntil(context, predicate);
  }

  // TODO: Add custom transition page routes (e.g. SlideRightRoute, FadeRoute)
}
