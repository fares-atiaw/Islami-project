import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../Provider/app_provider.dart';

class ItemBS_Language extends StatefulWidget {

  @override
  State<ItemBS_Language> createState() => _ItemBS_LanguageState();
}

class _ItemBS_LanguageState extends State<ItemBS_Language> {

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppProvider>(context);

    return Container(
      //color: Color(0xffb1d998),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            child: getLanguageRow('English', languageProvider.county_code=='en'),
            onTap: (){
              Navigator.pop(context);
              languageProvider.changeLanguage(language: 'en');
            },
          ),
          InkWell(
            child: getLanguageRow('العربية', languageProvider.county_code=='ar'),
            onTap: (){
              Navigator.pop(context);
              languageProvider.changeLanguage(language: 'ar');
            },
          ),
        ],
      ),
    );
  }

  Widget getLanguageRow(String text, bool selected)
  {
    if(selected)
      {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                style: Theme.of(context).textTheme.headline3?.copyWith(color: MyTheme.c_gold),
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
              style: Theme.of(context).textTheme.headline3,
            ),
            Icon(Icons.check_circle_outline_rounded),
          ],
        ),
      );
    }
  }

}
