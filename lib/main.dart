import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Provider/app_provider.dart';
import 'package:provider/provider.dart';

import 'Screens/hadeth_details.dart';
import 'Screens/home.dart';
import 'Screens/sura_details.dart';
import 'my_theme.dart';

// Error مسافة الجدول
// Error عدد الآيات الل في الجدول
// scaffoldBackgroundColor: Colors.transparent, doesn't work in theme

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

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