import 'package:flutter/cupertino.dart';
import 'package:weight_provider_learn/models/weight.dart';

class WeightState with ChangeNotifier {
  List<Weight> _weights = [
    Weight(weight: 78, time: DateTime.utc(2022, 11, 4)),
    Weight(weight: 73, time: DateTime.utc(2022, 11, 3)),
    Weight(weight: 76, time: DateTime.utc(2022, 11, 2)),
    Weight(weight: 79, time: DateTime.utc(2022, 11, 1)),
  ];

  List<Weight> get weights => _weights;

  Weight get currentWeight => _weights.first;

  void add(Weight weight) {
    _weights.insert(0, weight);

    notifyListeners();
  }

  void clear(Weight weight) {
    _weights.clear();

    notifyListeners();
  }
}
