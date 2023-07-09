import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

//import 'package:firebase_database/firebase_database.dart';

import 'package:provider/provider.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:expense_tracker_ui/model/percentage.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ExpenseIncomeData extends StatefulWidget {
  const ExpenseIncomeData({Key? key}) : super(key: key);

  @override
  State<ExpenseIncomeData> createState() => _ExpenseIncomeDataState();
}

int c = 0;
int _cont = 0;
int _cont1 = 0;
int _cont2 = 0;
int _cont3 = 0;
int C = 0;

class _ExpenseIncomeDataState extends State<ExpenseIncomeData> {
  savePerfs() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();

    await perfs.setString("set", '${SET}');
    await perfs.setInt("con", _cont);
    await perfs.setInt("con1", _cont1);
    await perfs.setInt("con2", _cont2);
    await perfs.setInt("con3", _cont3);
    print(_cont);
  }

  _increasecount() {
    _cont++;
    _cont1++;
    _cont2++;
    _cont3++;
  }

  // final referenceDatase = FirebaseDatabase.instance;
  String SET = "";

  int x1 = 0;
  int x2 = 0;

  int x4 = 0;
  bool E = false;
  bool E1 = false;
  bool M = true;
  bool E3 = false;
  bool p1 = false;
  bool p2 = false;

  String staus7 = "";
  sett1() {
    if (x1 == 1) {
      setState(() async {
        SET = "1";

        await savePerfs();
        x1 = 2;
      });
      x1 = 2;
      print("set");
    } else if (x1 == 2) {
      setState(() {
        staus7 = "1";
        p1 = true;
      });
      print("stim");
      x2 = 1;
    } else {
      setState(() {
        E = true;
        x1 = 1;
        M = false;
      });
    }
  }

  sett2() {
    if (x2 == 1) {
      setState(() async {
        E1 = true;
        SET = "2";
        await savePerfs();
        x2 = 2;
        print("set2");
      });
    } else if (x2 == 2) {
      setState(() {
        E1 = true;

        staus7 = "2";
        p2 = true;
      });
      print("stim2");
    } else {
      null;
      M = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final ref = referenceDatase.reference();
    Stim() {
      if (staus7 == "1") {
        setState(() {
          M = true;
          E = false;
          x1 = 0;
          x2 = 0;
          p1 = false;
          print("${M}" +
              "///////////////////////////////////////////" +
              "${staus7}");
        });
        setState(() async {
          _increasecount();
          await savePerfs();

          Provider.of<Percntage>(context, listen: false).changeInt();
          // await ref.child('STIM/state').set('1').asStream();
        });
        setState(() async {
          // Get a list of available Bluetooth devices
          List<BluetoothDevice> devices =
              await FlutterBluetoothSerial.instance.getBondedDevices();

          // Choose the device you want to connect to (replace with your ESP32 device)
          BluetoothDevice device =
              devices.firstWhere((d) => d.name == 'NeuroTechRelief');

          // Connect to the device
          BluetoothConnection connection =
              await BluetoothConnection.toAddress(device.address);
          SharedPreferences perfs = await SharedPreferences.getInstance();

          final List<String>? items = perfs.getStringList('moh3');
          String x = items!.last;
          // Send text to the serial monitor
          connection.output.add(ascii.encode("STIM 1 ${x}"));
          await connection.output.allSent;

          // Listen for incoming data from the serial monitor
          connection.input!.listen((Uint8List data) {
            String text = utf8.decode(data);
            print(text);
            // Disconnect the Bluetooth connection (when the program ends)
            connection.dispose();
          });
        });
      } else if (staus7 == "2") {
        setState(() {
          p1 = false;
          E1 = false;
          E3 = false;
          E = false;
          x1 = 0;
          x2 = 0;
          M = true;
          E3 = false;
          x4 = 0;
          p1 = false;
          p2 = false;
        });
        Provider.of<Percntage>(context, listen: false).changeInt();
        setState(() async {
          _increasecount();
          await savePerfs();
          // await ref.child('STIM/state').set('2').asStream();
        });
        setState(() async {
          // Get a list of available Bluetooth devices
          List<BluetoothDevice> devices =
              await FlutterBluetoothSerial.instance.getBondedDevices();

          // Choose the device you want to connect to (replace with your ESP32 device)
          BluetoothDevice device =
              devices.firstWhere((d) => d.name == 'NeuroTechRelief');

          // Connect to the device
          BluetoothConnection connection =
              await BluetoothConnection.toAddress(device.address);
          SharedPreferences perfs = await SharedPreferences.getInstance();

          final List<String>? items = perfs.getStringList('moh3');
          String x = items!.last;
          // Send text to the serial monitor
          connection.output.add(ascii.encode("STIM 2 ${x}"));
          await connection.output.allSent;

          // Listen for incoming data from the serial monitor
          connection.input!.listen((Uint8List data) {
            String text = utf8.decode(data);
            print(text);
            // Disconnect the Bluetooth connection (when the program ends)
            connection.dispose();
          });
        });
      } else if (staus7 == "3") {
        setState(() {
          E = false;
          p1 = false;
          E1 = false;
          E3 = false;
          E = false;
          x1 = 0;
          x2 = 0;
          M = true;
          x4 = 0;
          p1 = false;
          E3 = false;
          p2 = false;
        });
        Provider.of<Percntage>(context, listen: false).changeInt();
        setState(() async {
          _increasecount();
          await savePerfs();
          print(staus7 + "789");

          // await ref.child('STIM/state').set('3').asStream();
        });
        setState(() async {
          // Get a list of available Bluetooth devices
          List<BluetoothDevice> devices =
              await FlutterBluetoothSerial.instance.getBondedDevices();

          // Choose the device you want to connect to (replace with your ESP32 device)
          BluetoothDevice device =
              devices.firstWhere((d) => d.name == 'NeuroTechRelief');

          // Connect to the device
          BluetoothConnection connection =
              await BluetoothConnection.toAddress(device.address);
          SharedPreferences perfs = await SharedPreferences.getInstance();

          final List<String>? items = perfs.getStringList('moh3');
          String x = items!.last;
          String secondToLast = items.elementAt(items.length - 2);
          // Send text to the serial monitor
          connection.output.add(ascii.encode("STIM 1 ${secondToLast}"));
          connection.output.add(ascii.encode("STIM 2 ${x}"));
          await connection.output.allSent;

          // Listen for incoming data from the serial monitor
          connection.input!.listen((Uint8List data) {
            String text = utf8.decode(data);
            print(text);
            // Disconnect the Bluetooth connection (when the program ends)
            connection.dispose();
          });
        });
      }
    }
    // Stim() {
    // if (staus7 == "1") {
    //   setState(() async {
    //   E = false;
    //     x1 = 0;
    //   x2 = 0;

    //        print("${staus7}");
    //      M = true;

    //    x4 = 0;
    //       _increasecount();
    //     await savePerfs();
    //       if (x1 == "2") {
    //       setState(() async {
    //       _increasecount();
    //     await savePerfs();
    //           await ref.child('STIM/state').set('1').asStream();
    //         M = true;
    //     });
    // } else if (staus7 == "2") {
    //  print(staus7);

    //      M = true;
    //    await ref.child('STIM/state').set('2').asStream();
    //     } else {
    //     _increasecount();
    //    await savePerfs();
    // print(staus7 + "789");
    //  M = true;
    //    await ref.child('STIM/state').set('3').asStream();
    // }
    //    print("good work");
    // });

    ///print(_cont);
    //}
    //}

    return Expanded(
      child: SizedBox(
        height: 243,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      width: 175,
                      height: 41,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 2, color: Colors.pink.withOpacity(0.6)),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                  color: Colors.pink,
                                  Icons.keyboard_double_arrow_right_outlined),
                              onPressed: () async {
                                //            staus7 = "1";
                                //          setState(() {
                                //          E = true;
                                //      });

                                //    SET = "1";
                                //  await savePerfs();
                                sett1();
                              },
                              color: E ? Colors.pink : Colors.grey[800]),
                          Column(
                            children: [
                              Text(
                                "CHANNEL ONE",
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                (() {
                                  if (x1 == 2) {
                                    return "Stim Your channel";
                                  } else if (x1 == 1) {
                                    return "Set Channel";
                                  }
                                  return "Start Your Manual";
                                })(),
                                style: TextStyle(
                                  color: E ? Colors.pink : Colors.grey[800],
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: 175,
                      height: 41,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 2, color: Colors.pink.withOpacity(0.6)),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                  color: p1 ? Colors.pink : Colors.grey[800],
                                  Icons.keyboard_double_arrow_right_outlined),
                              // ignore: avoid_returning_null_for_void
                              onPressed: () async {
                                sett2();
                              }),
                          Column(
                            children: [
                              Text(
                                "CHANNEL Two",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                              Text(
                                (() {
                                  if (x2 == 2) {
                                    return "Stim Your channel";
                                  } else if (x1 == 2) {
                                    return "Set Channel";
                                  }
                                  return "SET CH1 FIRST";
                                })(),
                                style: TextStyle(
                                  color: p1 ? Colors.pink : Colors.grey[800],
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(),
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: 175,
                      height: 41,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 2, color: Colors.pink.withOpacity(0.6)),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(
                                color: p2 ? Colors.pink : Colors.grey[800],
                                Icons.keyboard_double_arrow_right_outlined,
                              ),
                              onPressed: () {
                                if (x2 == 2) {
                                  setState(() {
                                    x4 = 3;
                                    E3 = true;
                                    staus7 = "3";
                                    print("object");
                                  });
                                } else {
                                  null;
                                }
                              }),
                          Column(
                            children: [
                              Text(
                                "Both CH One & Two",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.pink,
                                ),
                              ),
                              Text(
                                (() {
                                  if (x4 == 3) {
                                    return "Stim Now Both";
                                  }
                                  return "Click to Stim Both";
                                })(),
                                style: TextStyle(
                                  color: E3 ? Colors.pink : Colors.grey[800],
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                              child: Container(
                            child: M
                                ? MaterialButton(
                                    onPressed: () async {
                                      // print(_cont);
                                      if (x1 == 1 ||
                                          x2 == 2 ||
                                          x1 == 2 ||
                                          x2 == 1) {
                                        null;
                                        print("corrct");
                                      } else {
                                        _increasecount();
                                        savePerfs();
                                        Provider.of<Percntage>(context,
                                                listen: false)
                                            .changeInt();

                                        //    await ref
                                        //      .child('STIM/state')
                                        //   .set('4')
                                        //     .asStream();

                                        //print("fite");
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 2,
                                            color:
                                                Colors.pink.withOpacity(0.9)),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: const AssetImage(
                                                "images/th.png"),
                                            scale: 10),
                                      ),
                                      height: 70,
                                      width: 60,
                                    ),
                                  )
                                : null,
                          )),
                          Container(
                              height: 70,
                              width: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: Colors.pink.withOpacity(0.6)),
                                shape: BoxShape.circle,
                                color: p1 || E1 || E3
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () async {
                                  Stim();
                                },
                                icon: Icon(Icons.play_arrow_outlined,
                                    color: p1 || E1 || E3
                                        ? Colors.white
                                        : Colors.black),
                              ))
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
