import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import '../Provider/app_provider.dart';
import '../Tabs/tab_hadeth.dart';
import '../Tabs/tab_quran.dart';
import '../Tabs/tab_radio.dart';
import '../Tabs/tab_sebha.dart';
import '../Tabs/tab_settings.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  var tabs = [
    Tab_Quran(),
    Tab_Hadeth(),
    Tab_Sebha(),
    Tab_Radio(),
    Tab_Settings(),
  ];

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getAppropriateBackground()),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
              AppLocalizations.of(context)!.islami,
              style: Theme.of(context).textTheme.subtitle2),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() => currentIndex = index);
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('asset/icons/quran.png')),
              //size: Theme.of(context).iconTheme.size
              label: AppLocalizations.of(context)!.quran,
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('asset/icons/sonna.png')),
                label: AppLocalizations.of(context)!.hadeth),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('asset/icons/sebha.png')),
                label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('asset/icons/radio.png')),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings_rounded),
                label: AppLocalizations.of(context)!.settings),
          ],
        ),
        body: tabs[currentIndex],
      ),
    );
  }
}
