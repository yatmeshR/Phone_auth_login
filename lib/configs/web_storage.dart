import 'dart:convert';
import 'package:dits_nexcom/model/login_model.dart';
import 'package:dits_nexcom/utils/pref_keys.dart';
import 'package:universal_html/html.dart';

class WebStorage {
  // Singleton
  WebStorage._internal();
  static final WebStorage _instance = WebStorage._internal();

  factory WebStorage() => _instance;

  void setWebValues(String key, dynamic value) {
    window.localStorage[key] = value.toString();
  }

  dynamic getValue(String key) {
    return window.localStorage.containsKey(key) ? window.localStorage[key] : null;
  }

  bool removeValue(String key) {
    if (window.localStorage.containsKey(key)) {
      window.localStorage.remove(key);
      return true;
    }
    return false;
  }

  Future<void> init() async {
    try {
      final loginRes = await WebStorage().getValue(Prefkeys.loginResponse);
      if (loginRes != null) {
        final loginModel = LoginModel.fromMap(jsonDecode(loginRes));
        print('User logged in');
        print("${loginModel.name}'s roles: ${loginModel.uid}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> setLoggedInUser(LoginModel user) async {
    WebStorage().setWebValues(Prefkeys.loginResponse, user.toJsonString());
  }

  LoginModel? get loggedInUser {
    final loginRes = getValue(Prefkeys.loginResponse);
    if (loginRes != null) {
      return LoginModel.fromMap(jsonDecode(loginRes));
    }
    return null;
  }

  bool get isLoggedIn => loggedInUser != null;

  Future<void> clearLoggedInUser() async {
    removeValue(Prefkeys.loginResponse);
  }

  void clear() {
    window.localStorage.clear();
  }
}
