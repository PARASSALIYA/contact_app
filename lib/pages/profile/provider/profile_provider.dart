import 'package:flutter/cupertino.dart';

class ProfileProvider with ChangeNotifier {
  bool darkMode = false;

  void isDark(bool val) {
    darkMode = val;
    notifyListeners();
  }

  bool isAndroid = true;
  void platformChange({required bool val}) {
    isAndroid = val;
    notifyListeners();
  }
}
