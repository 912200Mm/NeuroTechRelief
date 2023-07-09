import 'dart:math';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'model/percentage.dart';

class ExpenseGraphDesign extends StatefulWidget {
  const ExpenseGraphDesign({Key? key}) : super(key: key);

  @override
  State<ExpenseGraphDesign> createState() => _ExpenseGraphDesignState();
}

double randomDouble() {
  final random = Random();
  return 1 + random.nextDouble() * 9;
}

class _ExpenseGraphDesignState extends State<ExpenseGraphDesign> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Percntage>(builder: (context, Percntage, child) {
      double randomDouble() {
        final random = Random();
        return 1 + random.nextDouble() * 9;
      }

      double _count = 0;
      void _incrementCount() {
        _count++;
      }

      return Container(
        height: 150,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 10,
            minY: 0,
            maxY: 10,
            backgroundColor: Colors.black,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(_count++, randomDouble()),
                ],
                isCurved: true,
                gradient: const LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.pink,
                  ],
                ),
                barWidth: 3,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.withOpacity(0.2),
                      Colors.pink.withOpacity(0.2),
                    ],
                  ),
                ),
                dotData: FlDotData(show: false),
              ),
            ],
            gridData: FlGridData(
                show: true,
                drawHorizontalLine: false,
                drawVerticalLine: true,
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: Colors.grey.shade800,
                    strokeWidth: 0.8,
                  );
                }),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 12,
                    getTitlesWidget: (value, meta) {
                      String text = '';
                      switch (value.toInt()) {
                        case 1:
                          text = "1";
                          break;
                        case 2:
                          text = "2";
                          break;
                        case 3:
                          text = "3";
                          break;
                        case 4:
                          text = "4";
                          break;
                        case 5:
                          text = "5";
                          break;
                        case 6:
                          text = "6";
                          break;
                        case 7:
                          text = "7";
                          break;
                        case 8:
                          text = "8";
                          break;
                        case 9:
                          text = "9";
                          break;
                        case 10:
                          text = "10";
                          break;
                        default:
                          return Container();
                      }
                      return Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      );
                    }),
              ),
            ),
          ),
        ),
      );
    });
  }
}
