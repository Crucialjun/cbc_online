import 'dart:convert';

import 'package:cbc_online/models/onboarding_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../gen/assets.gen.dart';

class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel() {
    getItems();
  }

  final List<OnboardingData> _onboardingItems = [];

  int _currentPostion = 0;

  List get onboardingItems => _onboardingItems;

  int get currentPosition => _currentPostion;

  Future getItems() async {
    var listOfJsons = await rootBundle.loadString(Assets.jsons.onboardingData);
    List decodedJson = jsonDecode(listOfJsons);

    for (var i = 0; i < decodedJson.length; i++) {
      var onboardItem = OnboardingData.fromJson(decodedJson[i]);
      _onboardingItems.add(onboardItem);
      notifyListeners();
    }
  }

  void updatePostion(int postion) {
    _currentPostion = postion;
    notifyListeners();
  }

  void moveForward(PageController pageController) {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }

  void moveBack(PageController pageController) {
    pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }
}
