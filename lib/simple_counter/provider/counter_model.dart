import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _counter = 0;
  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }

  int get currentValue => _counter;
}
