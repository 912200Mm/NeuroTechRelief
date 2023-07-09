import 'package:expense_tracker_ui/model/percentage.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class VisaCardDesign extends StatefulWidget {
  const VisaCardDesign({Key? key}) : super(key: key);

  @override
  State<VisaCardDesign> createState() => _VisaCardDesignState();
}

class _VisaCardDesignState extends State<VisaCardDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 230,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Colors.purple,
            Colors.pink,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          const Text(
            "History",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Consumer<Percntage>(builder: (context, Percntage, child) {
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "${Percntage.text5}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Ampl: ",
                        style: TextStyle(
                          color: Colors.greenAccent,
                        ),
                      ),
                      Text(
                        " ${Percntage.text1}" + " mA",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Freq: ",
                        style: TextStyle(
                          color: Colors.greenAccent,
                        ),
                      ),
                      Text(
                        "${Percntage.text2} Hz",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Durn:",
                        style: TextStyle(
                          color: Colors.greenAccent,
                        ),
                      ),
                      Text(
                        "${Percntage.text3} uSec",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Time:",
                        style: TextStyle(
                          color: Colors.greenAccent,
                        ),
                      ),
                      Text(
                        "${Percntage.text4} Sec",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 22),
                ],
              );
            }),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "hestory");
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 21,
              width: 300,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text(
                      "Show All",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
