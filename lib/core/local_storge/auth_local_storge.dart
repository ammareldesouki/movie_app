import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthCacheHelper {
  static late SharedPreferences _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBpol(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  static Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  static String? getString(String key) {
    return _preferences.getString(key);
  }
}
