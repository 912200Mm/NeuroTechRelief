import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_ui/model/percentage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Percentage {
  final String categories;
  int time;
  int percent;

  Percentage({
    required this.categories,
    required this.percent,
    required this.time,
  });
}

class CircleProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Consumer<Percntage>(
        builder: (context, Percntage, child) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Percntage.PercentageList.length,
              itemBuilder: (context, index) {
                final percentList = Percntage.PercentageList[index];
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 85,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      CircularPercentIndicator(
                        animation: true,
                        animationDuration: 100,
                        radius: 25,
                        lineWidth: 5,
                        percent: percentList.percent / 100,
                        backgroundColor: Colors.pink.shade200,
                        progressColor: Colors.purple,
                        backgroundWidth: 1,
                        center: Text(
                          "${percentList.percent}%",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        percentList.categories,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        "${percentList.time}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
