import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  DateTime dateTime = DateTime.now();

  void dateTimeChange(DateTime dT) {
    dateTime = dT;
    notifyListeners();
  }
}
