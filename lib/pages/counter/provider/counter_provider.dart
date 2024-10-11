import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int counter = 0;
  int counterRemove = 0;
  int counterX2 = 1;
  int counterX3 = 1;
  int counterX4 = 1;
  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counterRemove--;
    notifyListeners();
  }

  void x2() {
    counterX2 = counterX2 * 2;
    notifyListeners();
  }

  void x3() {
    counterX3 = counterX3 * 3;
    notifyListeners();
  }

  void x4() {
    counterX4 = counterX4 * 4;
    notifyListeners();
  }

  void reset() {
    counter = 0;
    counterRemove = 0;
    counterX2 = 1;
    counterX3 = 1;
    counterX4 = 1;
    notifyListeners();
  }
}
