import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/item_address.dart';
import '../Provider/app_provider.dart';
import '../Screens/sura_details.dart';
import '../my_theme.dart';

class Item_2_titles extends StatelessWidget {
  ItemAddress address;
  bool up_down_divider;

  Item_2_titles({required this.address, required this.up_down_divider});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Column(
      children: [
        if (up_down_divider)
          Container(
            margin: EdgeInsets.only(top: 5),
            width: double.infinity,
            height: 2,
            color: MyTheme.c_gold,
            //margin: EdgeInsets.only(bottom: ),
          ),
        IntrinsicHeight(
          child: InkWell(
            onTap: () {
              if (!up_down_divider) {
                Navigator.pushNamed(context, SuraDetails.routeName,
                    arguments: address);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Text(
                    address.name,
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                ),
                const VerticalDivider(
                  width: 1,
                  thickness: 2,
                  color: MyTheme.c_gold,
                  endIndent: 0,
                  indent: 0,
                ),
                Expanded(
                  child: Text(
                    address.number,
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (up_down_divider)
          Container(
            width: double.infinity,
            height: 2,
            color: MyTheme.c_gold,
            //margin: EdgeInsets.only(bottom: ),
          )
      ],
    );
  }
}
