import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier {
  bool isLike = false;

  void like() {
    isLike = !isLike;
    notifyListeners();
  }
}
