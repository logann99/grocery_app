import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const themeStatus = "themeStatus";
  setDarkTheme(bool value) async {
    SharedPreferences preFerences = await SharedPreferences.getInstance();
    preFerences.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences preFerences = await SharedPreferences.getInstance();
    return preFerences.getBool(themeStatus) ?? false;
  }
}
