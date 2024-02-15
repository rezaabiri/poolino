import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';

class PrefsOperator {
  late SharedPreferences sharedPreferences;

  PrefsOperator(){
    sharedPreferences = locator<SharedPreferences>();
  }

  setSharedData(key, value) async {
    sharedPreferences.setString(key, value);
  }
  Future<String> getSharedData(key) async {
     return sharedPreferences.getString(key) ?? "empty";
  }
  String getSharedDataNoSync(key) {
     return sharedPreferences.getString(key) ?? "empty";
  }

  changeIntroState() async {
    sharedPreferences.setBool("showIntro", false);
  }

  Future<bool> getIntroState() async {
    return sharedPreferences.getBool("showIntro") ?? true;
  }

  Future<bool> getLoggedIn() async {
    return sharedPreferences.getBool("loggedIn") ?? false;
  }

  setLoggedIn() async {
    return sharedPreferences.setBool("loggedIn", true);
  }

  Future<void> logout() async {
    sharedPreferences.clear();
    sharedPreferences.setBool("showIntro", false);
  }

  changeTheme(bool stateTheme) async {
    sharedPreferences.setBool("is_dark", stateTheme);
  }

  Future<bool> getTheme() async {
    return sharedPreferences.getBool("is_dark") ?? false;
  }
}