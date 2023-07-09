import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'model/percentage.dart';

class First extends StatefulWidget {
  First({Key? key}) : super(key: key);
  @override
  State<First> createState() => _FirstState();
}

String ext = "";

class _FirstState extends State<First> {
  var SET;
  int x1 = 0;
  int x2 = 0;
  int x3 = 0;
  int x4 = 0;
  getPerfs() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    setState(() {
      SET = perfs.getString("set");

      ext = '${SET}';
    });

    //print('$ext');
  }

  DateTime now = DateTime.now();
  String formattedTime = "";
  String getCurrentTime() {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE, yyyy-MM-dd – kk:mm');
    String formattedTime = formatter.format(now);
    return formattedTime;
  }

  String form = new DateTime.now().toString();
  List<String> _dataList = [];
  List<String> _dataList1 = [];
  List<String> _dataList2 = [];
  List<String> _dataList3 = [];
  List<String> _dataList4 = [];
  List<String> _dataList5 = [];
  savePerfs() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();

    await perfs.setStringList("moh", _dataList);
    await perfs.setStringList("moh1", _dataList1);
    await perfs.setStringList("moh2", _dataList2);
    await perfs.setStringList("moh3", _dataList3);
    await perfs.setStringList("moh4", _dataList4);
    await perfs.setStringList("moh5", _dataList5);
    print("$_dataList");
    print("$_dataList1");
    print("$_dataList2");
    print("$_dataList3");
    print("$_dataList4");
    print("$_dataList5");
  }

  TextEditingController INPUTCONTROLLER = new TextEditingController();
  TextEditingController INPUTCONTROLLER1 = new TextEditingController();
  TextEditingController INPUTCONTROLLER2 = new TextEditingController();
  TextEditingController INPUTCONTROLLER3 = new TextEditingController();
  String _text = "";
  String _text1 = "";
  String _text2 = "";
  String _text3 = "";
  String a = "";
  //final referenceDatase = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    //  final ref = referenceDatase.reference();
    // String set = getPerfs();

    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                "Amplitude",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Text(
                '$_text' + " " + "mA",
                style: const TextStyle(
                    color: Color.fromARGB(255, 233, 7, 158),
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 0,
              ),
              IconButton(
                  onPressed: () {
                    Provider.of<Percntage>(context, listen: false).getPerfs();
                    Provider.of<Percntage>(context, listen: false)
                        .updateText2(_text1);

                    Provider.of<Percntage>(context, listen: false)
                        .updateText3(_text2);

                    Provider.of<Percntage>(context, listen: false)
                        .updateText4(_text3);
                    Provider.of<Percntage>(context, listen: false)
                        .updateText1(_text);

                    if (ext == '1') {
                      Provider.of<Percntage>(context, listen: false)
                          .updateText5("CHANNEL ONE");
                    } else if (ext == '2') {
                      Provider.of<Percntage>(context, listen: false)
                          .updateText5("CHANNEL TWO");
                    }
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.infoReverse,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      body: Column(
                        children: [
                          Text(
                            'Your Will Change Amplitude',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 15,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Put Value Here With Max 25 mA"),
                            controller: INPUTCONTROLLER,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: Color.fromARGB(255, 102, 3, 196)),
                            maxLength: 2,
                            maxLines: 1,
                            cursorWidth: 1,
                          ),
                        ],
                      ),
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () async {
                        x1 = 1;
                        if (x1 == 1 && x2 == 2 && x3 == 3 && x4 == 4) {
                          _dataList4.add(ext);
                          getCurrentTime;

                          _dataList5.add(getCurrentTime());
                          print("${getCurrentTime()}");

                          x1 = 0;
                          x2 = 0;
                          x3 = 0;
                          x4 = 0;
                        }
                        getPerfs();
                        if (ext == '1') {
                          setState(() async {
                            _text = INPUTCONTROLLER.text;
                            _dataList.add(INPUTCONTROLLER.text);
// Get a list of available Bluetooth devices
                            List<BluetoothDevice> devices =
                                await FlutterBluetoothSerial.instance
                                    .getBondedDevices();

                            // Choose the device you want to connect to (replace with your ESP32 device)
                            BluetoothDevice device = devices
                                .firstWhere((d) => d.name == 'NeuroTechRelief');

                            // Connect to the device
                            BluetoothConnection connection =
                                await BluetoothConnection.toAddress(
                                    device.address);

                            // Send text to the serial monitor
                            connection.output.add(
                                ascii.encode("AMPL 1 ${INPUTCONTROLLER.text}"));
                            await connection.output.allSent;

                            // Listen for incoming data from the serial monitor
                            connection.input!.listen((Uint8List data) {
                              String text = utf8.decode(data);
                              print(text);
                            });

                            // Disconnect the Bluetooth connection (when the program ends)
                            connection.dispose();
                            savePerfs();
                            INPUTCONTROLLER.clear();
                          });
                          // await ref.child('CH2/Freq').set('$_text1').asStream();

                          //   await ref.child('CH1/Freq').set('$_text1').asStream();
                        } else if (ext == '2') {
                          setState(() async {
                            _text = INPUTCONTROLLER.text;
                            _dataList.add(INPUTCONTROLLER.text);
// Get a list of available Bluetooth devices
                            List<BluetoothDevice> devices =
                                await FlutterBluetoothSerial.instance
                                    .getBondedDevices();

                            // Choose the device you want to connect to (replace with your ESP32 device)
                            BluetoothDevice device = devices
                                .firstWhere((d) => d.name == 'NeuroTechRelief');

                            // Connect to the device
                            BluetoothConnection connection =
                                await BluetoothConnection.toAddress(
                                    device.address);

                            // Send text to the serial monitor
                            connection.output.add(
                                ascii.encode("AMPL 2 ${INPUTCONTROLLER.text}"));
                            await connection.output.allSent;

                            // Listen for incoming data from the serial monitor
                            connection.input!.listen((Uint8List data) {
                              String text = utf8.decode(data);
                              print(text);
                            });

                            // Disconnect the Bluetooth connection (when the program ends)
                            connection.dispose();
                            savePerfs();
                            INPUTCONTROLLER.clear();
                          });
                          // await ref.child('CH2/Freq').set('$_text1').asStream();
                        }
                      },
                    ).show();
                  },
                  icon: Icon(Icons.arrow_drop_up))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                "Frequency",
                style: TextStyle(fontSize: 11, color: Colors.white),
              ),
              SizedBox(
                height: 0,
              ),
              Text(
                '$_text1' + " " + "Hz",
                style: const TextStyle(
                    color: Color.fromARGB(255, 233, 7, 158),
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 0,
              ),
              IconButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.infoReverse,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      body: Column(
                        children: [
                          Text(
                            'Your Will Change Frequency',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Put Value Here With Max 100 Hz"),
                            controller: INPUTCONTROLLER1,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: Color.fromARGB(255, 102, 3, 196)),
                            maxLength: 3,
                            maxLines: 1,
                            cursorWidth: 1,
                          ),
                        ],
                      ),
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () async {
                        x2 = 2;
                        if (x1 == 1 && x2 == 2 && x3 == 3 && x4 == 4) {
                          _dataList4.add(ext);
                          getCurrentTime;

                          _dataList5.add(getCurrentTime());
                          print("${getCurrentTime()}");

                          x1 = 0;
                          x2 = 0;
                          x3 = 0;
                          x4 = 0;
                        }
                        getPerfs();
                        if (ext == '1') {
                          setState(() async {
                            _text1 = INPUTCONTROLLER1.text;
                            _dataList1.add(INPUTCONTROLLER1.text);
// Get a list of available Bluetooth devices
                            List<BluetoothDevice> devices =
                                await FlutterBluetoothSerial.instance
                                    .getBondedDevices();

                            // Choose the device you want to connect to (replace with your ESP32 device)
                            BluetoothDevice device = devices
                                .firstWhere((d) => d.name == 'NeuroTechRelief');

                            // Connect to the device
                            BluetoothConnection connection =
                                await BluetoothConnection.toAddress(
                                    device.address);

                            // Send text to the serial monitor
                            connection.output.add(ascii
                                .encode("FREQ 1 ${INPUTCONTROLLER1.text}"));
                            await connection.output.allSent;

                            // Listen for incoming data from the serial monitor
                            connection.input!.listen((Uint8List data) {
                              String text = utf8.decode(data);
                              print(text);
                            });

                            // Disconnect the Bluetooth connection (when the program ends)
                            connection.dispose();
                            savePerfs();
                            INPUTCONTROLLER1.clear();
                          });
                          // await ref.child('CH2/Freq').set('$_text1').asStream();
                        } else if (ext == '2') {
                          setState(() async {
                            _text1 = INPUTCONTROLLER1.text;
                            _dataList1.add(INPUTCONTROLLER1.text);
// Get a list of available Bluetooth devices
                            List<BluetoothDevice> devices =
                                await FlutterBluetoothSerial.instance
                                    .getBondedDevices();

                            // Choose the device you want to connect to (replace with your ESP32 device)
                            BluetoothDevice device = devices
                                .firstWhere((d) => d.name == 'NeuroTechRelief');

                            // Connect to the device
                            BluetoothConnection connection =
                                await BluetoothConnection.toAddress(
                                    device.address);

                            // Send text to the serial monitor
                            connection.output.add(ascii
                                .encode("FREQ 2 ${INPUTCONTROLLER1.text}"));
                            await connection.output.allSent;

                            // Listen for incoming data from the serial monitor
                            connection.input!.listen((Uint8List data) {
                              String text = utf8.decode(data);
                              print(text);
                            });

                            // Disconnect the Bluetooth connection (when the program ends)
                            connection.dispose();
                            savePerfs();
                            INPUTCONTROLLER1.clear();
                          });
                          // await ref.child('CH2/Freq').set('$_text1').asStream();
                        }
                      },
                    ).show();
                  },
                  icon: Icon(Icons.arrow_drop_up))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                "Duration",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Text(
                '$_text2' + " " + "uSec",
                style: const TextStyle(
                    color: Color.fromARGB(255, 233, 7, 158),
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 0,
              ),
              IconButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.infoReverse,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      body: Column(
                        children: [
                          Text(
                            'You Will Change Duration',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText:
                                    "Put Your Value Here With Max 2000 uSec"),
                            controller: INPUTCONTROLLER2,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: Color.fromARGB(255, 102, 3, 196)),
                            maxLength: 4,
                            maxLines: 1,
                            cursorWidth: 1,
                          ),
                        ],
                      ),
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () async {
                        x3 = 3;
                        if (x1 == 1 && x2 == 2 && x3 == 3 && x4 == 4) {
                          _dataList4.add(ext);
                          getCurrentTime;

                          _dataList5.add(getCurrentTime());
                          print("${getCurrentTime()}");

                          x1 = 0;
                          x2 = 0;
                          x3 = 0;
                          x4 = 0;
                        }
                        getPerfs();
                        if (ext == '1') {
                          setState(() async {
                            _text2 = INPUTCONTROLLER2.text;
                            _dataList2.add(INPUTCONTROLLER2.text);
// Get a list of available Bluetooth devices
                            List<BluetoothDevice> devices =
                                await FlutterBluetoothSerial.instance
                                    .getBondedDevices();

                            // Choose the device you want to connect to (replace with your ESP32 device)
                            BluetoothDevice device = devices
                                .firstWhere((d) => d.name == 'NeuroTechRelief');

                            // Connect to the device
                            BluetoothConnection connection =
                                await BluetoothConnection.toAddress(
                                    device.address);

                            // Send text to the serial monitor
                            connection.output.add(ascii
                                .encode("DURN 1 ${INPUTCONTROLLER2.text}"));
                            await connection.output.allSent;

                            // Listen for incoming data from the serial monitor
                            connection.input!.listen((Uint8List data) {
                              String text = utf8.decode(data);
                              print(text);
                            });

                            // Disconnect the Bluetooth connection (when the program ends)
                            connection.dispose();
                            savePerfs();
                            INPUTCONTROLLER2.clear();
                          });
                          //   await ref.child('CH1/Freq').set('$_text1').asStream();
                        } else if (ext == '2') {
                          setState(() async {
                            _text2 = INPUTCONTROLLER2.text;
                            _dataList2.add(INPUTCONTROLLER2.text);
// Get a list of available Bluetooth devices
                            List<BluetoothDevice> devices =
                                await FlutterBluetoothSerial.instance
                                    .getBondedDevices();

                            // Choose the device you want to connect to (replace with your ESP32 device)
                            BluetoothDevice device = devices
                                .firstWhere((d) => d.name == 'NeuroTechRelief');

                            // Connect to the device
                            BluetoothConnection connection =
                                await BluetoothConnection.toAddress(
                                    device.address);

                            // Send text to the serial monitor
                            connection.output.add(ascii
                                .encode("DURN 2 ${INPUTCONTROLLER2.text}"));
                            await connection.output.allSent;

                            // Listen for incoming data from the serial monitor
                            connection.input!.listen((Uint8List data) {
                              String text = utf8.decode(data);
                              print(text);
                            });

                            // Disconnect the Bluetooth connection (when the program ends)
                            connection.dispose();
                            savePerfs();
                            INPUTCONTROLLER2.clear();
                          });
                          // await ref.child('CH2/Freq').set('$_text1').asStream();
                        }
                      },
                    ).show();
                  },
                  icon: Icon(Icons.arrow_drop_up))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                "Time",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Text(
                '$_text3' + " " + "Sec",
                style: const TextStyle(
                    color: Color.fromARGB(255, 233, 7, 158),
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 0,
              ),
              IconButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.infoReverse,
                      headerAnimationLoop: false,
                      animType: AnimType.bottomSlide,
                      body: Column(
                        children: [
                          Text(
                            'Your Will Change Time',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: "Put Time Here"),
                            controller: INPUTCONTROLLER3,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: Color.fromARGB(255, 102, 3, 196)),
                            maxLength: 4,
                            maxLines: 1,
                            cursorWidth: 1,
                          ),
                        ],
                      ),
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () async {
                        getPerfs();
                        x4 = 4;
                        if (x1 == 1 && x2 == 2 && x3 == 3 && x4 == 4) {
                          _dataList4.add(ext);
                          getCurrentTime;

                          _dataList5.add(getCurrentTime());
                          print("${getCurrentTime()}");

                          // await ref.child('SET/state').set('${SET}').asStream();
                          print("succses");
                          x1 = 0;
                          x2 = 0;
                          x3 = 0;
                          x4 = 0;
                        }
                        if (ext == '1') {
                          setState(() {
                            _text3 = INPUTCONTROLLER3.text;
                          });
                          setState(() {
                            _dataList3.add(INPUTCONTROLLER3.text);
                            savePerfs();
                            INPUTCONTROLLER3.clear();
                          });
                          //  await ref.
                        } else if (ext == '2') {
                          setState(() {
                            _text3 = INPUTCONTROLLER3.text;
                          });
                          setState(() {
                            _dataList3.add(INPUTCONTROLLER3.text);
                            savePerfs();
                            INPUTCONTROLLER3.clear();
                          });
                          //  await ref.child('CH2/Time').set('$_text3').asStream();
                        }
                      },
                    ).show();
                  },
                  icon: Icon(Icons.arrow_drop_up))
            ],
          ),
        ),
      ],
    );
  }
}
