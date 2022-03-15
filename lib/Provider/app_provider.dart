import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';

class AppProvider extends ChangeNotifier
{
  String county_code = 'ar';
  ThemeMode themeMode = ThemeMode.dark;
  //var themeType = MyTheme.darkTheme;

  void changeLanguage({required String language})
  {
    county_code = language;
    notifyListeners();
  }

  void changeThemeMode({required ThemeMode mode})
  {
    themeMode = mode;
    // themeType = mode == ThemeMode.light
    //     ?MyTheme.lightTheme
    //     :MyTheme.darkTheme;
    notifyListeners();
  }

  String getAppropriateBackground()
  {
    return themeMode == ThemeMode.light
        ?'asset/backgrounds/main_background.png'
        :'asset/backgrounds/dark_background.png';
  }

}