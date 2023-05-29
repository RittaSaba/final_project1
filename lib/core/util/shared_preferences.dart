import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/domain/data/response/login_response.dart';
import '../api/api_service.dart';

class AppSharedPreference {
  static const _token = '1';
  static const _user = '2';
  static const _fireToken = '3';

  static late SharedPreferences _prefs;

  static init(SharedPreferences preferences) async {
    _prefs = preferences;
  }

  static cashToken(String? token) {
    if (token == null) return;

    _prefs.setString(_token, token);

    APIService.reInitial();
  }

  static String getToken() {
    return _prefs.getString(_token) ?? '';
  }

  static cashUser(User? model) {
    if (model == null) return;

    _prefs.setString(_user, jsonEncode(model.toJson()));
  }

  static User getUserModel() {
    var json = _prefs.getString(_user) ?? '{}';
    return User.fromJson(jsonDecode(json));
  }

  static void clear() {
    _prefs.clear();
  }

  static void logout() {
    _prefs.clear();
    APIService.reInitial();
  }

  static bool isLogin() {
    return getToken().isNotEmpty;
    // return true;
  }

  static void cashFireToken(String token) {
    _prefs.setString(_fireToken, token);
  }

  static String getFireToken() {
    return _prefs.getString(_fireToken) ?? '';
  }
}
