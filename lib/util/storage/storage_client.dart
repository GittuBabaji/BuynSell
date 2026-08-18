import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Lightweight key-value storage wrapper around [SharedPreferences].
///
/// Call [TLocalStorage.init] once in `main()` before use.
///
/// ```dart
/// await TLocalStorage.init();
/// final storage = TLocalStorage.instance;
/// storage.write('token', 'abc123');
/// final token = storage.read<String>('token');
/// ```
class TLocalStorage {
  TLocalStorage._internal();
  static final TLocalStorage instance = TLocalStorage._internal();
  factory TLocalStorage() => instance;

  late final SharedPreferences _prefs;
  static bool _initialized = false;

  /// Initializes SharedPreferences. Must be called once before accessing storage.
  static Future<void> init() async {
    instance._prefs = await SharedPreferences.getInstance();
    _initialized = true;
  }

  // ---------------------------------------------------------------------------
  // Read
  // ---------------------------------------------------------------------------

  /// Reads a value for the given [key], cast to type [T].
  ///
  /// Supported types: `String`, `int`, `double`, `bool`, `List<String>`.
  /// For complex objects, use [readJson].
  T? read<T>(String key) {
    _assertInitialized();
    final value = _prefs.get(key);
    if (value == null) return null;
    return value as T?;
  }

  /// Reads a JSON-encoded value and decodes it as `Map<String, dynamic>`.
  Map<String, dynamic>? readJson(String key) {
    _assertInitialized();
    final raw = _prefs.getString(key);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  /// Reads a JSON-encoded list of objects.
  List<Map<String, dynamic>>? readJsonList(String key) {
    _assertInitialized();
    final raw = _prefs.getString(key);
    if (raw == null) return null;
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded.cast<Map<String, dynamic>>();
  }

  /// Returns `true` if [key] exists in storage.
  bool hasKey(String key) {
    _assertInitialized();
    return _prefs.containsKey(key);
  }

  /// Returns all keys currently stored.
  Set<String> get keys {
    _assertInitialized();
    return _prefs.getKeys();
  }

  // ---------------------------------------------------------------------------
  // Write
  // ---------------------------------------------------------------------------

  /// Writes a [value] for the given [key].
  ///
  /// Supported types: `String`, `int`, `double`, `bool`, `List<String>`.
  /// For complex objects, use [writeJson].
  Future<bool> write<T>(String key, T value) async {
    _assertInitialized();
    if (value is String) return _prefs.setString(key, value);
    if (value is int) return _prefs.setInt(key, value);
    if (value is double) return _prefs.setDouble(key, value);
    if (value is bool) return _prefs.setBool(key, value);
    if (value is List<String>) return _prefs.setStringList(key, value);
    throw ArgumentError('Unsupported type ${value.runtimeType}. '
        'Use writeJson() for complex objects.');
  }

  /// Encodes [value] as JSON and stores it as a string.
  Future<bool> writeJson(String key, Object value) async {
    _assertInitialized();
    return _prefs.setString(key, jsonEncode(value));
  }

  /// Writes [value] only if [key] doesn't already exist.
  Future<bool> writeIfNull<T>(String key, T value) async {
    _assertInitialized();
    if (_prefs.containsKey(key)) return false;
    return write<T>(key, value);
  }

  // ---------------------------------------------------------------------------
  // Delete
  // ---------------------------------------------------------------------------

  /// Removes the entry for [key].
  Future<bool> remove(String key) async {
    _assertInitialized();
    return _prefs.remove(key);
  }

  /// Clears all stored data.
  Future<bool> clear() async {
    _assertInitialized();
    return _prefs.clear();
  }

  // ---------------------------------------------------------------------------
  // Internal
  // ---------------------------------------------------------------------------

  void _assertInitialized() {
    assert(_initialized,
        'TLocalStorage not initialized. Call TLocalStorage.init() in main().');
  }
}
