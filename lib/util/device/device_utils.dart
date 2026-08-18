import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

/// Helper utility for device-specific properties, dimensions, and actions.
///
/// Uses the singleton pattern — access via [DeviceUtils.instance]:
/// ```dart
/// final device = DeviceUtils.instance;
/// device.hideKeyboard(context);
/// final width = device.screenWidth(context);
/// ```
class DeviceUtils {
  // Singleton setup
  DeviceUtils._internal();
  static final DeviceUtils instance = DeviceUtils._internal();
  factory DeviceUtils() => instance;

  // Shared MethodChannel
  final MethodChannel _channel = const MethodChannel('device_utils');

  // ---------------------------------------------------------------------------
  // Platform checks
  // ---------------------------------------------------------------------------

  /// `true` if the current operating system is Android.
  bool get isAndroid => Platform.isAndroid;

  /// `true` if the current operating system is iOS.
  bool get isIOS => Platform.isIOS;

  /// `true` if running on a physical device (not an emulator/simulator).
  bool get isPhysicalDevice =>
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;

  // ---------------------------------------------------------------------------
  // Screen / display queries (require BuildContext)
  // ---------------------------------------------------------------------------

  /// Screen width in logical pixels.
  double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  /// Screen height in logical pixels.
  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// Device pixel ratio.
  double pixelRatio(BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio;

  /// `true` if the device qualifies as a tablet (shortest side ≥ 600).
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= 600;

  /// `true` if the device is in landscape orientation.
  bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  /// `true` if the device is in portrait orientation.
  bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  /// Height of the status bar.
  double statusBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  /// Height of the navigation bar (bottom padding).
  double navigationBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  /// Bottom safe-area padding (for notch / home indicator).
  double bottomSafeArea(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  /// `true` if the device likely has a notch or display cutout.
  bool hasNotch(BuildContext context) =>
      MediaQuery.of(context).padding.top > 20.0;

  /// Text scale factor set by the user in system settings.
  double textScaleFactor(BuildContext context) =>
      MediaQuery.of(context).textScaleFactor;

  /// `true` if the system is currently in dark mode.
  bool isDarkMode(BuildContext context) =>
      MediaQuery.of(context).platformBrightness == Brightness.dark;

  /// Current device locale string (e.g. "en_US").
  String deviceLocale(BuildContext context) =>
      Localizations.localeOf(context).toString();

  // ---------------------------------------------------------------------------
  // Keyboard
  // ---------------------------------------------------------------------------

  /// Hides the soft keyboard if currently displayed.
  void hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  /// `true` if the soft keyboard is currently visible.
  bool isKeyboardVisible(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom > 0;

  /// Height of the soft keyboard in logical pixels.
  double keyboardHeight(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom;

  // ---------------------------------------------------------------------------
  // System UI
  // ---------------------------------------------------------------------------

  /// Sets the status bar color and icon brightness.
  Future<void> setStatusBarColor(Color color,
      {Brightness brightness = Brightness.light}) async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: brightness,
    ));
  }

  /// Toggles immersive full-screen mode.
  void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  /// Shows or hides the system status bar.
  void setStatusBarVisible(bool visible) {
    SystemChrome.setEnabledSystemUIMode(
        visible ? SystemUiMode.edgeToEdge : SystemUiMode.immersiveSticky);
  }

  /// Locks the device to the given [orientations].
  Future<void> setOrientation(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Resets orientation to allow all orientations.
  Future<void> resetOrientation() async {
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  // ---------------------------------------------------------------------------
  // Haptics
  // ---------------------------------------------------------------------------

  /// Triggers a haptic vibration for the given [duration].
  void vibrate(Duration duration) {
    if (duration.inMilliseconds < 0) {
      duration = const Duration(milliseconds: 100);
    }
    HapticFeedback.vibrate();
    Future.delayed(duration, () {
      HapticFeedback.vibrate();
    });
  }

  // ---------------------------------------------------------------------------
  // Connectivity
  // ---------------------------------------------------------------------------

  /// `true` if the device has an active internet connection.
  Future<bool> hasInternetConnection() async {
    try {
      final result =
          await InternetAddress.lookup('thispersondoesnotexist.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  /// Returns the current network connection type (e.g. "wifi", "mobile", "none").
  Future<String> getNetworkType() async {
    return await _channel.invokeMethod<String>('getNetworkType') ?? 'unknown';
  }

  /// Returns the device's current IP address.
  Future<String> getIPAddress() async {
    return await _channel.invokeMethod<String>('getIPAddress') ?? 'Unknown';
  }

  // ---------------------------------------------------------------------------
  // Device info
  // ---------------------------------------------------------------------------

  /// Returns the current battery level as a percentage (0–100).
  Future<int> getBatteryLevel() async {
    return await _channel.invokeMethod<int>('getBatteryLevel') ?? -1;
  }

  /// Returns the app version string (e.g. "1.0.0").
  Future<String> getAppVersion() async {
    return await _channel.invokeMethod<String>('getAppVersion') ?? 'Unknown';
  }

  /// Returns the app build number.
  Future<String> getBuildNumber() async {
    return await _channel.invokeMethod<String>('getBuildNumber') ?? 'Unknown';
  }

  /// Returns the device model name (e.g. "Pixel 7", "iPhone 14").
  Future<String> getDeviceModel() async {
    return await _channel.invokeMethod<String>('getDeviceModel') ?? 'Unknown';
  }

  /// Returns the device name assigned by the user.
  Future<String> getDeviceName() async {
    return await _channel.invokeMethod<String>('getDeviceName') ?? 'Unknown';
  }

  /// Returns the OS version string (e.g. "Android 13", "iOS 17.0").
  Future<String> getOSVersion() async {
    return await _channel.invokeMethod<String>('getOSVersion') ?? 'Unknown';
  }

  /// Returns the unique device identifier.
  Future<String> getDeviceId() async {
    return await _channel.invokeMethod<String>('getDeviceId') ?? 'Unknown';
  }

  /// Returns the available free disk space in bytes.
  Future<int> getFreeDiskSpace() async {
    return await _channel.invokeMethod<int>('getFreeDiskSpace') ?? -1;
  }

  /// Returns the total RAM in bytes.
  Future<int> getTotalRAM() async {
    return await _channel.invokeMethod<int>('getTotalRAM') ?? -1;
  }

  // ---------------------------------------------------------------------------
  // Time zone
  // ---------------------------------------------------------------------------

  /// Returns the device's current time zone name.
  String get timeZone => DateTime.now().timeZoneName;

  // ---------------------------------------------------------------------------
  // Brightness
  // ---------------------------------------------------------------------------

  /// Returns the current screen brightness (0.0–1.0).
  Future<double> getScreenBrightness() async {
    return await _channel.invokeMethod<double>('getScreenBrightness') ?? -1.0;
  }

  /// Sets the screen brightness (0.0–1.0).
  Future<void> setScreenBrightness(double brightness) async {
    await _channel.invokeMethod<void>(
        'setScreenBrightness', {'brightness': brightness});
  }

  // ---------------------------------------------------------------------------
  // Clipboard
  // ---------------------------------------------------------------------------

  /// Copies [text] to the system clipboard.
  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  /// Reads text from the system clipboard.
  Future<String> pasteFromClipboard() async {
    ClipboardData? data = await Clipboard.getData('text/plain');
    return data?.text ?? '';
  }

  // ---------------------------------------------------------------------------
  // Screen state
  // ---------------------------------------------------------------------------

  /// `true` if the device screen is currently on.
  Future<bool> isScreenOn() async {
    return await _channel.invokeMethod<bool>('isScreenOn') ?? false;
  }

  /// Enables or disables the wake lock to keep the screen on.
  Future<void> keepScreenOn(bool enable) async {
    // TODO: implement
    throw UnimplementedError();
  }

  // ---------------------------------------------------------------------------
  // URL / sharing
  // ---------------------------------------------------------------------------

  /// Launches the given [url] in the default browser or app.
  Future<void> launchUrl(String url) async {
    await _channel.invokeMethod<void>('launchUrl', {'url': url});
  }

  /// Opens the OS share sheet with the given [text] and optional [subject].
  Future<void> shareContent(String text, {String? subject}) async {
    // TODO: implement
    throw UnimplementedError();
  }

  // ---------------------------------------------------------------------------
  // Permissions
  // ---------------------------------------------------------------------------

  /// Checks whether the given [permission] is currently granted.
  Future<bool> checkPermission(String permission) async {
    return await _channel.invokeMethod<bool>(
            'checkPermission', {'permission': permission}) ??
        false;
  }

  /// Requests the given [permission] from the user. Returns `true` if granted.
  Future<bool> requestPermission(String permission) async {
    return await _channel.invokeMethod<bool>(
            'requestPermission', {'permission': permission}) ??
        false;
  }

  // ---------------------------------------------------------------------------
  // Location
  // ---------------------------------------------------------------------------

  /// Returns the device's current location as `{latitude, longitude}`.
  Future<Map<String, double>> getCurrentLocation() async {
    return await _channel.invokeMethod<Map<String, double>>(
            'getCurrentLocation') ??
        {'latitude': 0.0, 'longitude': 0.0};
  }

  // ---------------------------------------------------------------------------
  // Biometrics
  // ---------------------------------------------------------------------------

  /// `true` if biometric authentication (fingerprint/face) is available.
  Future<bool> getBiometricAvailability() async {
    return await _channel.invokeMethod<bool>('getBiometricAvailability') ??
        false;
  }

  // ---------------------------------------------------------------------------
  // App lifecycle
  // ---------------------------------------------------------------------------

  /// `true` if the app is currently in the foreground.
  Future<bool> isAppInForeground() async {
    return await _channel.invokeMethod<bool>('isAppInForeground') ?? false;
  }
}
