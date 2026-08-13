/// Application-wide constant values for the Buy N Sell IIT BHU app.
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // App Metadata
  static const String appName = 'Buy N Sell IIT BHU';
  static const String appVersion = '1.0.0';

  // Pagination & Limits
  static const int defaultPageSize = 20;
  static const int maxImageSize = 5 * 1024 * 1024; // 5 MB in bytes
  static const int maxImages = 5;

  // Support & Contact
  static const String supportEmail = 'support@buynsell.iitbhu.ac.in';

  // TODO: Add any additional application constants (e.g. cache limits, timeout durations)
}
