import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const THEME_STATUS = "THEMESTATUS";
  setDarkTheme(bool value) async {
    SharedPreferences preFerences = await SharedPreferences.getInstance();
    preFerences.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences preFerences = await SharedPreferences.getInstance();
    return preFerences.getBool(THEME_STATUS) ?? false;
  }
}
