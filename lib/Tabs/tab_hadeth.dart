import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/item_hadeth.dart';
import '../Screens/hadeth_details.dart';
import '../my_theme.dart';

class Tab_Hadeth extends StatefulWidget {
  @override
  State<Tab_Hadeth> createState() => _Tab_HadethState();
}

class _Tab_HadethState extends State<Tab_Hadeth> {
  List<String> lines = [];
  List<String> oneHadeth = [];
  List<ItemHadeth> items = [];

  /*List<String> Ahadeth = [
    'حديث رقم 1',
    'حديث رقم 2',
    'حديث رقم 3',
    'حديث رقم 4',
    'حديث رقم 5',
    'حديث رقم 6',
    'حديث رقم 7',
    'حديث رقم 8',
    'حديث رقم 9',
    'حديث رقم 10',
    'حديث رقم 11',
    'حديث رقم 12',
    'حديث رقم 13',
    'حديث رقم 14',
    'حديث رقم 15',
    'حديث رقم 16',
    'حديث رقم 17',
    'حديث رقم 18',
    'حديث رقم 19',
    'حديث رقم 20',
    'حديث رقم 21',
    'حديث رقم 22',
    'حديث رقم 23',
    'حديث رقم 24',
    'حديث رقم 25',
    'حديث رقم 26',
    'حديث رقم 27',
    'حديث رقم 28',
    'حديث رقم 29',
    'حديث رقم 30',
    'حديث رقم 31',
    'حديث رقم 32',
    'حديث رقم 33',
    'حديث رقم 34',
    'حديث رقم 35',
    'حديث رقم 36',
    'حديث رقم 37',
    'حديث رقم 38',
    'حديث رقم 39',
    'حديث رقم 40',
  ];*/

  @override
  Widget build(BuildContext context) {
    if (lines.isEmpty) loadFile('asset/files/ahadeth.txt');

    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            "asset/images/basmala_icon.png",
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 2,
                color: MyTheme.c_gold,
              ),
              Text(
                'AppLocalizations.of(context)!.elAhadeth',
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                width: double.infinity,
                height: 2,
                color: MyTheme.c_gold,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: ((context, index) => InkWell(
                        onTap: (() {
                          Navigator.pushNamed(context, HadethDetails.routeName,
                              arguments: items[index]);
                        }),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Text(items[index].title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                      )),
                  itemCount: lines.length,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> loadFile(String filePath) async {
    // Soon will be called/used
    String fileContent = await rootBundle.loadString('$filePath');
    lines = fileContent.trim().split('#');
    for (int i = 0; i < lines.length; i++) {
      String hadeth = lines[i].trim();
      List<String> singleHadethLines = hadeth.split('\n');
      String title = singleHadethLines[0];
      singleHadethLines.removeAt(0);
      items.add(ItemHadeth(title: title, content: singleHadethLines));
      print(items[i].title);
      print('------');
    }
    setState(() {});
  }
}
