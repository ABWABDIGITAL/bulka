import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper extends Equatable {
  // private constructor as I don't want to allow creating an instance of this class itself.
  const SharedPrefHelper._();
  static late SharedPreferences _sharedPreferences;
  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<bool> setData(String key, value) async {
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case const (String):
        return await _sharedPreferences.setString(key, value);
      case const (int):
        return await _sharedPreferences.setInt(key, value);
      case const (bool):
        return await _sharedPreferences.setBool(key, value);
      case const (double):
        return await _sharedPreferences.setDouble(key, value);
      default:
        return false;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    return _sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    return _sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    return _sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static getData(String key) async {
    debugPrint('SharedPrefHelper : getObject with key : $key');

    return _sharedPreferences.get(key);
  }

  static Future<void> setString(String key, String value) async {
    debugPrint(
        "FlutterSharedPref : setString with key : $key and value : $value");
    await _sharedPreferences.setString(key, value);
  }

  static String? getString(String key) {
    debugPrint('FlutterSharedPref : getString with key :$key');
    return _sharedPreferences.getString(key);
  }

  static Future<bool> removeString(String key) async {
    debugPrint('FlutterSharedPref : removeString with key :$key');
    return await _sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    await _sharedPreferences.clear();
  }

  /// Gets an String value from SharedPreferences with given [key].
  // static Future<String?> getString(String key) async {
  //   debugPrint('SharedPrefHelper : getString with key : $key');
  //   return _sharedPreferences.getString(key);
  // }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  // static Future<void> setSecuredString(String key, String value) async {
  //   debugPrint(
  //       "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
  //   await _flutterSecureStorage.write(key: key, value: value);
  // }

  /// Gets an String value from FlutterSecureStorage with given [key].
  // static Future<String?> getSecuredString(String key) async {
  //   debugPrint('FlutterSecureStorage : getSecuredString with key :');
  //   return await _flutterSecureStorage.read(key: key);
  // }

  // static Future<void> removeSecuredString(String key) async {
  //   debugPrint('FlutterSecureStorage : removeSecuredString with key :');
  //   return await _flutterSecureStorage.delete(key: key);
  // }

  /// Removes all keys and values in the FlutterSecureStorage
  // static Future<void> clearAllSecuredData() async {
  //   debugPrint('FlutterSecureStorage : all data has been cleared');
  //   await _flutterSecureStorage.deleteAll();
  // }

  @override
  List<Object?> get props => [_sharedPreferences];
}
