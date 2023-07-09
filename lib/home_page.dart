import 'package:expense_tracker_ui/expense_graph.dart';
import 'package:expense_tracker_ui/expense_income.dart';
import 'package:expense_tracker_ui/progress_chart.dart';

import 'package:expense_tracker_ui/visa_card.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_ui/first.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
              child: Row(
                children: [
                  const Spacer(),
                ],
              ),
            ),
            Row(
              children: [VisaCardDesign(), ExpenseIncomeData()],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: SizedBox(
                  height: 360,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Analytics",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const ExpenseGraphDesign(),
                      CircleProgressChart(),
                      SizedBox(
                        height: 5,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 82,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: Colors.pink.withOpacity(0.6)),
                          ),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(child: First()),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////////////////////
