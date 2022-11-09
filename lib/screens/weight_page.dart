import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:weight_provider_learn/models/weight.dart';

import 'package:weight_provider_learn/state/weight_state.dart';

class WeightPage extends StatefulWidget {
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  int _currentValue = 3;
  double currentValueSecond = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight Tracker Demo"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.restart_alt_outlined))
        ],
      ),
      body: Consumer<WeightState>(
        builder: ((context, state, widget) {
          var weight = state.weights;
          return Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecimalNumberPicker(
                      value: currentValueSecond,
                      minValue: 1,
                      maxValue: 200,
                      onChanged: (changedValue) {
                        setState(() {
                          currentValueSecond = changedValue;
                        });

                        print("değişti ${currentValueSecond}");
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          state.add(Weight(
                              weight: currentValueSecond,
                              time: DateTime.now()));
                        },
                        child: Text("Save"))
                  ],
                ),
                Container(
                  height: 90,
                  child: Card(
                    child: Row(children: [
                      Text("Current Weight", textScaleFactor: 1.5),
                      Spacer(),
                      Text(
                        state.currentWeight.weight.toString(),
                        textScaleFactor: 2,
                      )
                    ]),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: weight.length,
                    itemBuilder: (context, index) {
                      var weight = state.weights[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.1),
                              borderRadius: BorderRadius.circular(2)),
                          child: ListTile(
                            title: Text(
                                "${weight.time.day}.${weight.time.month}.${weight.time.year}",
                                textScaleFactor: 2),
                            trailing: Text(
                              weight.weight.toString(),
                              textScaleFactor: 3,
                              style: TextStyle(
                                color: Colors.lightGreen,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
