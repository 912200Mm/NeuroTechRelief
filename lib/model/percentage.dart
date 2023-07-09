import 'dart:math';

import 'package:expense_tracker_ui/progress_chart.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

int c = 0;
int x = 0;
int x1 = 0;
int x2 = 0;

class Percntage extends ChangeNotifier {
  List<Percentage> PercentageList = [
    Percentage(categories: "Device Usage Rate", percent: 0, time: 0),
    Percentage(categories: "times per day", percent: 0, time: 0),
    Percentage(categories: "times per moouth", percent: 0, time: 0),
    Percentage(categories: "times per years", percent: 0, time: 0),
  ];
  String _text1 = '';
  String _text2 = '';
  String _text3 = '';
  String _text4 = '';
  String _text5 = '';

  List<String>? his4 = [];
  List<String>? his1 = [];
  List<String>? his2 = [];
  List<String>? his3 = [];
  List<String>? his5 = [];
  List<String>? his6 = [];
  String get text1 => _text1;
  String get text2 => _text2;
  String get text3 => _text3;
  String get text4 => _text4;
  String get text5 => _text5;
  void updateText1(String newText) {
    _text1 = newText;
    notifyListeners();
  }

  void updateText2(String newText) {
    _text2 = newText;
    notifyListeners();
  }

  void updateText3(String newText) {
    _text3 = newText;
    notifyListeners();
  }

  void updateText4(String newText) {
    _text4 = newText;
    notifyListeners();
  }

  void updateText5(String newText) {
    _text5 = newText;
    notifyListeners();
  }

  sort2() {
    his1!.sort((a, b) => a.compareTo(b));
    his2!.sort((a, b) => a.compareTo(b));
    his3!.sort((a, b) => a.compareTo(b));
    his4!.sort((a, b) => a.compareTo(b));
    his5!.sort((a, b) => a.compareTo(b));
    his6!.sort((a, b) => a.compareTo(b));
    notifyListeners();
  }

  clearPrefs() {
    his1!.clear();
    his2!.clear();
    his3!.clear();
    his4!.clear();
    his5!.clear();
    his6!.clear();
    notifyListeners();
  }

  sort1() {
    his1!.sort((a, b) => b.compareTo(a));
    his2!.sort((a, b) => b.compareTo(a));
    his3!.sort((a, b) => b.compareTo(a));
    his4!.sort((a, b) => b.compareTo(a));
    his5!.sort((a, b) => b.compareTo(a));
    his6!.sort((a, b) => b.compareTo(a));
    notifyListeners();
  }
 double randomDouble() {
      final random = Random();
      return 1 + random.nextDouble() * 9;
    }

    int _count = 0;
   void _incrementCount() {
      
      _count++;
      
    }
  getPerfs() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();

    final List<String>? items = perfs.getStringList('moh');
    final List<String>? items1 = perfs.getStringList('moh1');
    final List<String>? items2 = perfs.getStringList('moh2');
    final List<String>? items3 = perfs.getStringList('moh3');
    final List<String>? items4 = perfs.getStringList('moh4');
    final List<String>? items5 = perfs.getStringList('moh5');
   

    his4 = items3;
    his1 = items;
    his2 = items1;
    his3 = items2;
    his5 = items4;
    his6 = items5;
    _text1 = items!.last;
    _text2 = items1!.last;
    _text3 = items2!.last;
    _text4 = items3!.last;

    print('$items1');
    print('$items2');
    print('$items4');
    notifyListeners();
  }

  changeInt() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    c = perfs.getInt("con")!;
    x = perfs.getInt("con1")!;
    x1 = perfs.getInt("con2")!;
    x2 = perfs.getInt("con3")!;
    Future.delayed(Duration(seconds: 86400), () {
      perfs.remove('con1');
    });
    Future.delayed(Duration(days: 30), () {
      perfs.remove('con2');
    });
    Future.delayed(Duration(days: 335, hours: 6), () {
      perfs.remove('con3');
    });
    for (int i = 0; i < 1; i++) {
      PercentageList[i].time = c;
      PercentageList[i].percent = 100;
      PercentageList[1].time = x;
      PercentageList[1].percent = (x * 24 / 10).floor();
      PercentageList[2].time = x1;
      PercentageList[2].percent = (x * 100 / 100).floor();
      PercentageList[3].time = x2;
      PercentageList[3].percent = (x * 7 / 10).floor();
    }

    notifyListeners();
  }
}
