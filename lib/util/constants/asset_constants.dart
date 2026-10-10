/// Centralized asset path constants for all images.
class TImages {
  // Private constructor to prevent instantiation
  TImages._();

  // Base Prefix
  static const String _basePath = 'assets/images/';

  // -- Onboarding
  static const String onboarding1 = '${_basePath}onboarding/page1.gif';
  static const String onboarding2 = '${_basePath}onboarding/page2.gif';
  static const String onboarding3 = '${_basePath}onboarding/page3.gif';
  static const String emailVerification = '${_basePath}email_verification/page1.gif';

  // -- Placeholders & Empty States
  // TODO: Add placeholder, no_data, empty_cart images when available
}

/// Centralized asset path constants for all icons.
class TIcons {
  // Private constructor to prevent instantiation
  TIcons._();

  // Base Prefix
  static const String _basePath = 'assets/icons/';

  // -- App Logos
  static const String mainLogo = '${_basePath}main_logo.png';
  static const String darkLogo = '${_basePath}dark_logo.png';
  static const String lightLogo = '${_basePath}light_logo.png';

  // -- Social / Third-party
  static const String googleIcon = '${_basePath}google_icon.png';

  // TODO: Add additional icon paths as assets are added (e.g. iitbhu_logo.png)
}
