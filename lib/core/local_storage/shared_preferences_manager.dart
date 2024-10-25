import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static late SharedPreferences _sharedPreferences;

  static Future<void> sharedPreferencesInitialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is String) {
      await _sharedPreferences.setString(key, value);
      return true;
    } else if (value is int) {
      await _sharedPreferences.setInt(key, value);
      return true;
    } else if (value is bool) {
      await _sharedPreferences.setBool(key, value);
      return true;
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
      return true;
    } else if (value is List<String>) {
      await _sharedPreferences.setStringList(key, value);
      return true;
    } else if (value is Map<String, dynamic>) {
      String jsonString = json.encode(value);
      await _sharedPreferences.setString(key, jsonString);
      return true;
    } else if (value is List<List<dynamic>>) {
      String jsonString = json.encode(value);
      await _sharedPreferences.setString(key, jsonString);
      return true;
    }
    return false;
  }

  static dynamic getData({required String key}) {
    String? jsonString = _sharedPreferences.getString(key);
    if (jsonString != null) {
      try {
        Map<String, dynamic> jsonData = json.decode(jsonString);
        return jsonData;
      } catch (e) {
        try {
          List<dynamic> jsonData = json.decode(jsonString);
          return jsonData
              .map<List<dynamic>>((e) => List<dynamic>.from(e))
              .toList();
        } catch (e) {
          return jsonString;
        }
      }
    }
    return _sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    await _sharedPreferences.remove(key);
    return true;
  }

  static Future<bool> clearAllData() async {
    await _sharedPreferences.clear();
    return true;
  }
}
