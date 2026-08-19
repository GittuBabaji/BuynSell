import 'package:flutter/material.dart';
import 'package:buynsell/util/theme/app_colors.dart';

/// Custom Dart-based splash screen with animations.
///
/// Provides full control over logo sizing, proportions, and transitions —
/// unlike the native splash which is constrained by Android 12's circle crop.
class SplashScreen extends StatefulWidget {
  /// The screen to navigate to after the splash completes.
  final Widget nextScreen;

  /// Duration to hold the splash before transitioning.
  final Duration duration;

  const SplashScreen({
    super.key,
    required this.nextScreen,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final AnimationController _textController;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoOpacity;
  late final Animation<double> _textOpacity;
  late final Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();

    // Logo: fade in + scale up
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _logoScale = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeIn),
    );

    // Text: fade in + slide up (starts after logo)
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeIn),
    );
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOut),
    );

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    // Play logo animation
    await _logoController.forward();

    // Then play text animation
    await _textController.forward();

    // Hold for the remaining duration then navigate
    await Future.delayed(widget.duration);

    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              widget.nextScreen,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.darkBackground : Colors.white;
    final logoAsset =
        isDark ? 'assets/icons/light_logo.png' : 'assets/icons/dark_logo.png';

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated logo
            AnimatedBuilder(
              animation: _logoController,
              builder: (context, child) {
                return Opacity(
                  opacity: _logoOpacity.value,
                  child: Transform.scale(
                    scale: _logoScale.value,
                    child: child,
                  ),
                );
              },
              child: Image.asset(
                logoAsset,
                width: 160,
                height: 160,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 24),

            // Animated text
            SlideTransition(
              position: _textSlide,
              child: FadeTransition(
                opacity: _textOpacity,
                child: Column(
                  children: [
                    Text(
                      'Buy N Sell',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: isDark ? Colors.white : AppColors.primary,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'IIT BHU Marketplace',
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? Colors.white60
                            : AppColors.textSecondary,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
