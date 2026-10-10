/// Centralized size constants used across the app.
///
/// Usage:
/// ```dart
/// import 'package:buynsell/util/constants/sizes.dart';
///
/// SizedBox(height: TSizes.spaceBtwItems);
/// Padding(padding: EdgeInsets.all(TSizes.defaultSpace));
/// Icon(Icons.home, size: TSizes.iconMd);
/// ```
class TSizes {
  TSizes._();

  // ---------------------------------------------------------------------------
  // Padding & Margin
  // ---------------------------------------------------------------------------
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // ---------------------------------------------------------------------------
  // Icon sizes
  // ---------------------------------------------------------------------------
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;

  // ---------------------------------------------------------------------------
  // Font sizes
  // ---------------------------------------------------------------------------
  static const double fontSizeXs = 10.0;
  static const double fontSizeSm = 12.0;
  static const double fontSizeMd = 14.0;
  static const double fontSizeLg = 16.0;
  static const double fontSizeXl = 18.0;
  static const double fontSizeXxl = 24.0;
  static const double fontSizeHeading = 28.0;

  // ---------------------------------------------------------------------------
  // Button sizes
  // ---------------------------------------------------------------------------
  static const double buttonHeight = 48.0;
  static const double buttonRadius = 12.0;
  static const double buttonWidth = 120.0;
  static const double buttonElevation = 4.0;

  // ---------------------------------------------------------------------------
  // AppBar
  // ---------------------------------------------------------------------------
  static const double appBarHeight = 56.0;

  // ---------------------------------------------------------------------------
  // Image sizes
  // ---------------------------------------------------------------------------
  static const double imageThumbSize = 80.0;
  static const double imageCardSize = 150.0;
  static const double imageBannerHeight = 200.0;

  // ---------------------------------------------------------------------------
  // Default spacing
  // ---------------------------------------------------------------------------
  static const double defaultSpace = 24.0;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSections = 32.0;
  static const double spaceBtwInputFields = 16.0;

  // ---------------------------------------------------------------------------
  // Border radius
  // ---------------------------------------------------------------------------
  static const double borderRadiusXs = 4.0;
  static const double borderRadiusSm = 8.0;
  static const double borderRadiusMd = 12.0;
  static const double borderRadiusLg = 16.0;
  static const double borderRadiusXl = 24.0;
  static const double borderRadiusCircular = 100.0;

  // ---------------------------------------------------------------------------
  // Divider
  // ---------------------------------------------------------------------------
  static const double dividerHeight = 1.0;

  // ---------------------------------------------------------------------------
  // Product item dimensions
  // ---------------------------------------------------------------------------
  static const double productImageSize = 120.0;
  static const double productImageRadius = 16.0;

  // ---------------------------------------------------------------------------
  // Input field
  // ---------------------------------------------------------------------------
  static const double inputFieldRadius = 12.0;
  static const double inputFieldHeight = 50.0;

  // ---------------------------------------------------------------------------
  // Card
  // ---------------------------------------------------------------------------
  static const double cardRadiusLg = 16.0;
  static const double cardRadiusMd = 12.0;
  static const double cardRadiusSm = 8.0;
  static const double cardRadiusXs = 6.0;
  static const double cardElevation = 2.0;

  // ---------------------------------------------------------------------------
  // Loading indicator
  // ---------------------------------------------------------------------------
  static const double loadingIndicatorSize = 36.0;

  // ---------------------------------------------------------------------------
  // Grid view
  // ---------------------------------------------------------------------------
  static const double gridViewSpacing = 16.0;
}
