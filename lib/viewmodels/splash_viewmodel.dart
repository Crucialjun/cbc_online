import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel() {
    getData();
  }
  bool _isFirstTime = true;

  bool get isFirstTime => _isFirstTime;

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isFirstTime = prefs.getBool("isFirstTime") ?? true;
  }

  void updateFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);
    notifyListeners();
  }
}
