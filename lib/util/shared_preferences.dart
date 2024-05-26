import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  factory SharedPreferencesUtil() {
    return _instance;
  }

  SharedPreferencesUtil._internal();

  static final SharedPreferencesUtil _instance =
      SharedPreferencesUtil._internal();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return Future.value(await _prefs?.setString(key, value) ?? false);
  }

  Future<bool> setInt(String key, int value) async {
    return Future.value(await _prefs?.setInt(key, value) ?? false);
  }

  Future<bool> setBool(String key, bool value) async {
    return Future.value(await _prefs?.setBool(key, value) ?? false);
  }

  Future<bool> setDouble(String key, double value) async {
    return Future.value(await _prefs?.setDouble(key, value) ?? false);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return Future.value(await _prefs?.setStringList(key, value) ?? false);
  }

  String? getString(String key) {
    return _prefs?.getString(key);
  }

  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  Future<bool> remove(String key) async {
    return Future.value(await _prefs?.remove(key) ?? false);
  }

  Future<bool> clear() async {
    return Future.value(await _prefs?.clear() ?? false);
  }
}
