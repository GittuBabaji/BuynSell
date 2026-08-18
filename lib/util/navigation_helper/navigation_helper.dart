import 'package:flutter/material.dart';

/// Lightweight navigation via a [BuildContext] extension.
///
/// ```dart
/// // Push
/// context.push(const ProfileScreen());
///
/// // Replace
/// context.pushReplacement(const HomeScreen());
///
/// // Clear stack & set new root
/// context.pushAndClearAll(const LoginScreen());
///
/// // Pop
/// context.pop();
///
/// // Custom transition
/// context.pushWithFade(const DetailsScreen());
/// ```
extension NavigationHelper on BuildContext {
  // ---------------------------------------------------------------------------
  // Core navigation
  // ---------------------------------------------------------------------------

  /// Pushes [page] onto the navigator stack.
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.push<T>(this, MaterialPageRoute(builder: (_) => page));
  }

  /// Replaces the current route with [page].
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    TO? result,
  }) {
    return Navigator.pushReplacement<T, TO>(
      this,
      MaterialPageRoute(builder: (_) => page),
      result: result,
    );
  }

  /// Clears every route and sets [page] as the new root.
  Future<T?> pushAndClearAll<T extends Object?>(Widget page) {
    return Navigator.pushAndRemoveUntil<T>(
      this,
      MaterialPageRoute(builder: (_) => page),
      (_) => false,
    );
  }

  /// Pops the top route. No-op if the stack can't be popped.
  void pop<T extends Object?>([T? result]) {
    if (Navigator.canPop(this)) Navigator.pop<T>(this, result);
  }

  /// Pops routes until [predicate] returns `true`.
  void popUntil(RoutePredicate predicate) {
    Navigator.popUntil(this, predicate);
  }

  /// Whether the navigator can pop the current route.
  bool get canPop => Navigator.canPop(this);

  // ---------------------------------------------------------------------------
  // Named routes
  // ---------------------------------------------------------------------------

  /// Pushes a named route.
  Future<T?> pushNamed<T extends Object?>(String name, {Object? arguments}) {
    return Navigator.pushNamed<T>(this, name, arguments: arguments);
  }

  /// Replaces the current route with a named route.
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String name, {
    Object? arguments,
    TO? result,
  }) {
    return Navigator.pushReplacementNamed<T, TO>(
      this,
      name,
      arguments: arguments,
      result: result,
    );
  }

  /// Clears the stack and pushes a named route as root.
  Future<T?> pushNamedAndClearAll<T extends Object?>(
    String name, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      this,
      name,
      (_) => false,
      arguments: arguments,
    );
  }

  // ---------------------------------------------------------------------------
  // Custom transitions
  // ---------------------------------------------------------------------------

  /// Push with a **fade** transition.
  Future<T?> pushWithFade<T extends Object?>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return Navigator.push<T>(this, _FadeRoute<T>(page: page, duration: duration));
  }

  /// Push with a **slide-from-right** transition.
  Future<T?> pushWithSlideRight<T extends Object?>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return Navigator.push<T>(
      this,
      _SlideRoute<T>(page: page, duration: duration, begin: const Offset(1, 0)),
    );
  }

  /// Push with a **slide-from-bottom** transition.
  Future<T?> pushWithSlideUp<T extends Object?>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return Navigator.push<T>(
      this,
      _SlideRoute<T>(page: page, duration: duration, begin: const Offset(0, 1)),
    );
  }

  /// Push with a **scale** (zoom-in) transition.
  Future<T?> pushWithScale<T extends Object?>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return Navigator.push<T>(this, _ScaleRoute<T>(page: page, duration: duration));
  }
}

// =============================================================================
// Custom PageRouteBuilders (private)
// =============================================================================

class _FadeRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  _FadeRoute({required this.page, required Duration duration})
      : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        );
}

class _SlideRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  _SlideRoute({
    required this.page,
    required Duration duration,
    required Offset begin,
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
            position: Tween<Offset>(begin: begin, end: Offset.zero)
                .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
            child: child,
          ),
        );
}

class _ScaleRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  _ScaleRoute({required this.page, required Duration duration})
      : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) => ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0)
                .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
            child: child,
          ),
        );
}
