import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../Provider/app_provider.dart';

class ItemBS_Theme extends StatefulWidget {
  @override
  State<ItemBS_Theme> createState() => _ItemBS_ThemeState();
}

class _ItemBS_ThemeState extends State<ItemBS_Theme> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      color: Color(0xffb1d998),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            child: getThemeRow(AppLocalizations.of(context)!.light,
                provider.themeMode == ThemeMode.light),
            onTap: () {
              Navigator.pop(context);
              provider.changeThemeMode(mode: ThemeMode.light);
            },
          ),
          InkWell(
            child: getThemeRow(AppLocalizations.of(context)!.dark,
                provider.themeMode == ThemeMode.dark),
            onTap: () {
              Navigator.pop(context);
              provider.changeThemeMode(mode: ThemeMode.dark);
            },
          ),
        ],
      ),
    );
  }

  Widget getThemeRow(String text, bool selected)
  {
    if(selected)
      {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                style: MyTheme.lightTheme.textTheme.headline3?.copyWith(color: MyTheme.c_gold),
              ),
              Icon(Icons.check_circle_outline_rounded, color: MyTheme.c_gold),
            ],
          ),
        );
      }
    else{
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
              style: MyTheme.lightTheme.textTheme.headline3,
            ),
            Icon(Icons.check_circle_outline_rounded),
          ],
        ),
      );
    }
  }

}
