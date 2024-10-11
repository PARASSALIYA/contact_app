import 'package:shared_preferences/shared_preferences.dart';

class ShrHelper {
  void shareIntro() async {
    SharedPreferences shr = await SharedPreferences.getInstance();

    await shr.setBool('introShare', true);
  }

  Future<bool?> introStatus() async {
    SharedPreferences shr = await SharedPreferences.getInstance();

    bool? status = shr.getBool('introShare');
    return status;
  }

}
