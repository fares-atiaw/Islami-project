import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Tab_Sebha extends StatefulWidget {
  @override
  State<Tab_Sebha> createState() => _Tab_SebhaState();
}

class _Tab_SebhaState extends State<Tab_Sebha> {
  int counter = 0;
  int triple = 0;
  List<String> types = [
    'سبحان الله',
    'الحمد الله',
    'الله أكبر',
    //'لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير'
  ];
  double degrees = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.12),
                child: Image.asset(
                  "asset/images/head_of_seb7a.png",
                ),
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.095),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      "asset/images/body_of_seb7a.png",
                    ),
                  ),
                ),
                onTap: onSebhaPressed ,
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.num_sebha,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xff707070), width: 0.3)
            ),
            child: Text(
              '$counter/33',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xff707070), width: 0.3)
            ),
            child: Text(
              types[triple],
              style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void onSebhaPressed()
  {
    degrees += (360 / 33);
    angle = (pi/180) * degrees;
    if (counter == 33) {
      if (triple == 2) {
        counter = 0;
        triple = 0;
        return;
      }
      counter = 0;
      degrees = 0;
      triple++;
    }
    counter++;
    setState(() {});
  }

}
