import 'package:expense_tracker_ui/model/percentage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hostory extends StatefulWidget {
  Hostory({Key? key}) : super(key: key);
  @override
  State<Hostory> createState() => _HostoryState();
}

@override
class _HostoryState extends State<Hostory> {
  void initState() {
    // TODO: implement initState

    Provider.of<Percntage>(context, listen: false).getPerfs();
    super.initState();
    print("saaaaaaaaaaaaaaaaaaaad");
    Provider.of<Percntage>(context, listen: false).getPerfs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.withOpacity(0.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          elevation: 0,
          title: Center(
            child: Text(
              "History",
              style: TextStyle(fontSize: 22),
            ),
          ),
          actions: [
            Container(
                child: Row(
              children: [
                Consumer<Percntage>(builder: (context, Percntage, child) {
                  final his1 = Percntage.his1;
                  final his2 = Percntage.his2;
                  final his3 = Percntage.his3;
                  final his4 = Percntage.his4;
                  final his5 = Percntage.his5;
                  final his6 = Percntage.his6;
                  List<int> numbers = [
                    his1!.length,
                    his2!.length,
                    his3!.length,
                    his4!.length,
                    his5!.length,
                    his6!.length
                  ];
                  int smallestNumber = numbers.reduce((a, b) => a < b ? a : b);
                  return Text(
                    "${smallestNumber}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  );
                }),
                IconButton(
                    onPressed: () {
                      Provider.of<Percntage>(context, listen: false)
                          .clearPrefs();
                    },
                    icon: Icon(Icons.delete)),
                PopupMenuButton(
                  icon: Icon(Icons.sort),
                  tooltip: "SORT",
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      onTap: () {
                        Provider.of<Percntage>(context, listen: false).sort2();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.looks_one_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          Text('CHANNEL ONE'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        Provider.of<Percntage>(context, listen: false).sort1();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.looks_two_outlined, color: Colors.black),
                          SizedBox(width: 8),
                          Text('CHANNEL TWO'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
        body: Container(
            child: Consumer<Percntage>(builder: (context, Percntage, child) {
          final his1 = Percntage.his1;
          final his2 = Percntage.his2;
          final his3 = Percntage.his3;
          final his4 = Percntage.his4;
          final his5 = Percntage.his5;
          final his6 = Percntage.his6;
          List<int> numbers = [
            his1!.length,
            his2!.length,
            his3!.length,
            his4!.length,
            his5!.length,
            his6!.length
          ];
          int smallestNumber = numbers.reduce((a, b) => a < b ? a : b);
          print(smallestNumber);

          return ListView.builder(
              itemCount: smallestNumber,
              itemBuilder: (BuildContext context, i) {
                return Column(children: [
                  ListTile(
                    trailing: Text("       " + his6[i]),
                    title: Text(
                      (() {
                        if (his5[i] == "2") {
                          return "CHANNEL TWO";
                        } else if (his5[i] == "1") {
                          return "CHANNEL ONE";
                        }
                        return "sad";
                      })(),
                    ),
                    leading: Icon((() {
                      if (his5[i] == "2") {
                        return Icons.looks_two_outlined;
                      } else if (his5[i] == "1") {
                        return Icons.looks_one_outlined;
                      }
                      return Icons.signal_wifi_4_bar_lock;
                    })()),
                    subtitle: Text("Ampl:" +
                        " " +
                        "${his1[i]}" +
                        " " +
                        "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   " +
                        "FREQ:" +
                        " " +
                        "${his2[i]}" +
                        "                                                                                                                                                        "
                            "DURN:" +
                        " " +
                        "${his3[i]}" +
                        "                                                                                                                                                        "
                            "TIME:" +
                        " " +
                        "${his4[i]}"),
                    hoverColor: Colors.black,
                  ),
                ]);
              });
        })));
  }
}
////////////////////////////////////////////////////////////
///
