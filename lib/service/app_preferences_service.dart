import 'package:shared_preferences/shared_preferences.dart';

enum AppPreferencesKey { locale }

class AppPreferencesService {
  const AppPreferencesService(this._prefs);

  final SharedPreferencesAsync _prefs;

  static Future<AppPreferencesService> create() async {
    return AppPreferencesService(SharedPreferencesAsync());
  }

  Future<void> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<void> setInt(String key, int value) {
    return _prefs.setInt(key, value);
  }

  Future<int?> getInt(String key) {
    return _prefs.getInt(key);
  }

  Future<void> setDouble(String key, double value) {
    return _prefs.setDouble(key, value);
  }

  Future<double?> getDouble(String key) {
    return _prefs.getDouble(key);
  }

  Future<void> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  Future<String?> getString(String key) {
    return _prefs.getString(key);
  }

  Future<void> setStringList(String key, List<String> value) {
    return _prefs.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) {
    return _prefs.getStringList(key);
  }

  Future<void> remove(String key) {
    return _prefs.remove(key);
  }

  Future<void> clear() {
    return _prefs.clear();
  }
}
