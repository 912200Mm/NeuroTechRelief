import 'package:expense_tracker_ui/home_page.dart';
import 'package:expense_tracker_ui/model/percentage.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:expense_tracker_ui/model/hestory.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(Duration(seconds: 5));
  FlutterNativeSplash.remove();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ChangeNotifierProvider(
        create: (context) => Percntage(),
        child: MaterialApp(
            routes: {"hestory": (context) => Hostory()},
            debugShowCheckedModeBanner: false,
            home: FutureBuilder(
              future: FlutterBluetoothSerial.instance.requestEnable(),
              builder: (context, future) {
                if (future.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    body: Container(
                      height: double.infinity,
                      child: Center(
                        child: Icon(
                          Icons.bluetooth_disabled,
                          size: 200.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  );
                } else {
                  return HomePage();
                }
              },
            )),
      );
    });
  }
}
