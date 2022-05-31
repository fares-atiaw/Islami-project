import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../Components/item_language_bottom_sheet.dart';
import '../Components/item_theme_bottom_sheet.dart';
import '../Provider/app_provider.dart';

class Tab_Settings extends StatefulWidget {

  @override
  State<Tab_Settings> createState() => _Tab_SettingsState();
}

class _Tab_SettingsState extends State<Tab_Settings> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.languages,
              style: Theme.of(context).textTheme.headline6),
          InkWell(
            onTap: (() {
              showLanguagesBottomSheet();
            }),
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Colors.white,
                  border: Border.all(color: Theme.of(context).primaryColor),
              ),
                child: Text(
                  provider.county_code=="en" ? "English" : "العربية",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: MyTheme.c_title),
                )),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headline6),
          InkWell(
            onTap: (() {
              showThemeBottomSheet();
            }),
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Colors.white,
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                child: Text(
                  provider.themeMode == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: MyTheme.c_title),
                )
            ),
          ),
        ],
      ),
    );
  }

  void showLanguagesBottomSheet()
  {
    showModalBottomSheet(
      context: context,
      builder: (context){
        return ItemBS_Language();
      },
    );
  }

  void showThemeBottomSheet()
  {
    showModalBottomSheet(
      context: context,
      builder: (context){
        return ItemBS_Theme();
      },
    );
  }
}
