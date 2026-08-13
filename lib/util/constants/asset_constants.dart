/// Centralized asset path constants for images, icons, and illustrations.
class AssetConstants {
  // Private constructor to prevent instantiation
  AssetConstants._();

  // Base Prefixes
  static const String imagesPath = 'assets/images/';
  static const String iconsPath = 'assets/icons/';

  // Images
  static const String logo = '${imagesPath}logo.png';
  static const String placeholder = '${imagesPath}placeholder.png';
  static const String noData = '${imagesPath}no_data.png';
  static const String emptyCart = '${imagesPath}empty_cart.png';

  // Onboarding Images
  static const String onboarding1 = '${imagesPath}onboarding1.png';
  static const String onboarding2 = '${imagesPath}onboarding2.png';
  static const String onboarding3 = '${imagesPath}onboarding3.png';

  // Icons
  static const String googleIcon = '${iconsPath}google.svg';
  static const String iitbhuLogo = '${iconsPath}iitbhu_logo.png';

  // TODO: Add additional asset paths as UI components are developed
}
