import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static const c_title = Color.fromRGBO(36, 36, 36, 1.0);
  static const c_gold = Color.fromRGBO(183, 147, 95, 1.0);
  static const c_less_gold = Color.fromRGBO(217, 190, 151, 1.0);
  static const c_darkGold = Color.fromRGBO(250, 204, 29, 1.0);
  static const c_darkBlue = Color.fromRGBO(20, 26, 46, 1.0);

  static var lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    canvasColor: c_gold,
    primaryColor: c_gold,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: c_title),
      color: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 25,
        color: c_gold,
      ),
    ),
    textTheme: const TextTheme(
      subtitle1: TextStyle(
        color: c_title,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        color: c_title,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: c_title,
        fontSize: 20,
      ),
        headline6: TextStyle(
          //for long String
          color: c_title,
          fontSize: 20,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.white),
      colorScheme: const ColorScheme(
          primary: c_gold,
          onPrimary: Colors.white,
          secondary: c_gold,
          onSecondary: c_gold,
          brightness: Brightness.light,
          background: Colors.white,
          error: Colors.red,
          onBackground: Colors.white,
          onError: Colors.white,
          surface: Colors.white,
          onSurface:Colors.white
    )
  );

  static var darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    canvasColor: c_darkBlue,
    primaryColor: c_darkBlue,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      color: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 25,
        color: c_darkGold,
      ),
    ),
    // iconTheme: IconThemeData(
    //   size: 40,
    // ),
    textTheme: const TextTheme(
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
        headline6: TextStyle(
          //for long String
          color: c_darkGold,
          fontSize: 20,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: c_darkGold,
        unselectedItemColor: Colors.white,
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.white),
      colorScheme: const ColorScheme(
          primary: c_darkGold,
          onPrimary: Colors.white,
          secondary: c_gold,
          onSecondary: c_gold,
          brightness: Brightness.light,
          background: Colors.white,
          error: Colors.red,
          onBackground: Colors.white,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white));
}
