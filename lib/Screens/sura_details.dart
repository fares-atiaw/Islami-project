import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../Models/item_address.dart';
import '../Provider/app_provider.dart';
import '../my_theme.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'SuraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late ItemAddress args;
  late List<String> lines = [];

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as ItemAddress;
    var provider = Provider.of<AppProvider>(context);

    if (lines.isEmpty) loadFile('${args.number}');

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  provider.getAppropriateBackground()
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              '{ ${args.name} }',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          body: (lines.length == 0)
              ? CircularProgressIndicator(color: Colors.white10)
              : ListView.builder(
                  itemBuilder: ((context, index) {
                    return Text(
                      '${lines[index]} (${index + 1})',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.rtl,
                    );
                  }),
                  //separatorBuilder: (c, i) => Divider(thickness: 2, color: MyTheme.c_gold),
                  itemCount: lines.length)),
    );
  }

  Future<void> loadFile(String filePath) async {
    String all_lines =
        await rootBundle.loadString('asset/files/ayat/$filePath.txt');
    lines = all_lines.trim().split('\n');
    setState(() {});
    print('****\n ${lines.toString()} \n **********');
  }
}
