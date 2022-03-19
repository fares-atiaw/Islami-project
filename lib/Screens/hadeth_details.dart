import 'package:flutter/material.dart';

//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/Models/item_hadeth.dart';
import 'package:provider/provider.dart';

import '../Models/item_hadeth.dart';
import '../Provider/app_provider.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'hadeth-details';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  late ItemHadeth args;
  late List<String> lines = [];

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as ItemHadeth;
    var provider = Provider.of<AppProvider>(context);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.getAppropriateBackground()),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          appBar: AppBar(
          backgroundColor: Color(0x4D6D2A02),
          title: Text('AppLocalizations.of(context)!.elAhadeth',
              style: Theme.of(context).textTheme.subtitle2),
        ),
        body: Container(
            decoration: const BoxDecoration(
              //color: Color(0xccffffff),   //soon
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Column(
              children: [
                Text(
                  // args.name,
                  args.title,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                Divider(
                  height: 1,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  //lines[int.parse(args.number)].trim(),
                  args.content.join(),
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.rtl,
                ),
              ],
            )),
      ),
    );
  }

// Future<void> loadFile(String filePath) async {
//   String all_lines = await rootBundle.loadString('$filePath');
//   lines = all_lines.trim().split('#');
//   for(int i=0;i<lines.length;i++){
//     print(lines[i]);
//     print('------');
//   }
//   //print('****\n ${lines.toString()} \n **********');
//   setState(() {});
// }
}
