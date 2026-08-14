import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

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
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }
  static Future<void> setstatusbarcolor(Color color, {Brightness brightness = Brightness.light}) async {
    // Set the status bar color and brightness
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: brightness,
    ));
  }
  static bool ispotrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
  static void setfullscreen(bool enable) {
     SystemChrome.setEnabledSystemUIMode(enable? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }
  static double getScreenheight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  static double getScreenwidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  static double getpixelratio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }
  static double getstatusbarheight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
  static double getnavigationbarheight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }
  static Future<bool> iskeyboardvisible(BuildContext context) async {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
  static double getkeyboardheight(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom;
  }
  static Future<bool> isPhysicalDevive(BuildContext context) async{
    return defaultTargetPlatform == TargetPlatform.android && defaultTargetPlatform == TargetPlatform.iOS;
  }
  static void vibrate(Duration duration) {
    if(duration.inMilliseconds <0){
      duration = const Duration(milliseconds: 100);
    }
    HapticFeedback.vibrate();
    Future.delayed(duration, () {
      HapticFeedback.vibrate();
    });
  }
  static Future<void> setorientation(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }
  static Future<void> resetorientation() async {
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }
  static void setstatusbarvisible(bool visible) {
    SystemChrome.setEnabledSystemUIMode(visible ? SystemUiMode.edgeToEdge : SystemUiMode.immersiveSticky);
  }
  static Future<bool> hasInternetconnection() async {
    try {
      final result = await InternetAddress.lookup('thispersondoesnotexist.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
  
  // TODO: Add support for checking device orientation, status bar height, and navigation bar padding
}
