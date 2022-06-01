import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier
{
  String county_code = 'ar';
  ThemeMode themeMode = ThemeMode.system;
  String themeString = 'light';
  late SharedPreferences prefs;

  //var themeType = MyTheme.darkTheme;

  Future<void> changeLanguage({required String language}) async {
    if (county_code != language) {
      county_code = language;
      prefs = await SharedPreferences.getInstance();
      prefs.setString('county_code', county_code);
      notifyListeners();
    }
  }

  Future<void> changeThemeMode({required ThemeMode mode}) async {
    if (themeMode != mode) {
      themeMode = mode;
      (themeMode == ThemeMode.light)
          ? themeString = 'light'
          : themeString = 'dark';
      // themeType = mode == ThemeMode.light
      //     ?MyTheme.lightTheme
      //     :MyTheme.darkTheme;
      prefs = await SharedPreferences.getInstance();
      prefs.setString('themeString', themeString);
      notifyListeners();
    }
  }

  String getAppropriateBackground() {
    return themeMode == ThemeMode.light
        ? 'asset/backgrounds/main_background.png'
        : 'asset/backgrounds/dark_background.png';
  }
}