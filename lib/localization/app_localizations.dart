import 'package:flutter/material.dart';
import 'translations/en.dart';
import 'translations/hi.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': enTranslations,
    'hi': hiTranslations,
  };

  String translate(String key) {
    // TODO: Implement fallback logic for localization dictionary
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  // Getters for common app strings
  static String get appName => 'IIT BHU Buy&Sell';
  static String get login => 'Login';
  static String get register => 'Register';
  static String get email => 'Email';
  static String get password => 'Password';
  static String get search => 'Search';
  static String get categories => 'Categories';
  static String get profile => 'Profile';
  static String get settings => 'Settings';
  static String get sell => 'Sell';
  static String get buy => 'Buy';
  static String get chat => 'Chat';
  static String get condition => 'Condition';
  static String get price => 'Price';
  static String get description => 'Description';
  static String get logout => 'Logout';
}
