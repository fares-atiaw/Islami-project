import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami_app/Provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/hadeth_details.dart';
import 'Screens/home.dart';
import 'Screens/sura_details.dart';
import 'my_theme.dart';

// scaffoldBackgroundColor: Colors.transparent, doesn't work in theme

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppProvider provider;
  late SharedPreferences prefs;
  late var modeType;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    init_SharedPreferences();

    return MaterialApp(
      title: 'إسلامي',
      //AppLocalizations.of(context)!.islami  OR  'إسلامي'

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.county_code),

      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      initialRoute: HomeScreen.routeName,

      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.themeMode,

      debugShowCheckedModeBanner: false,
    );
  }

  void init_SharedPreferences() async {
    prefs = await SharedPreferences.getInstance();

    modeType = prefs.getString('themeString') ?? 'light';
    (modeType == 'light')
        ? modeType = ThemeMode.light
        : modeType = ThemeMode.dark;
    provider.changeThemeMode(mode: modeType);

    modeType = prefs.getString('county_code') ?? 'en';
    provider.changeLanguage(language: modeType);
  }
}


// localizationsDelegates: [
// //AppLocalizations.delegate, // Add this line
// GlobalMaterialLocalizations.delegate,
// GlobalWidgetsLocalizations.delegate,
// GlobalCupertinoLocalizations.delegate,
// ],
// supportedLocales: [
// Locale('ar', ''),
// Locale('en', ''),
// ],