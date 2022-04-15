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

  int _currentPosition = 0;

  List get onboardingItems => _onboardingItems;

  int get currentPosition => _currentPosition;

  Future getItems() async {
    var listOfJsons = await rootBundle.loadString(Assets.jsons.onboardingData);
    List decodedJson = jsonDecode(listOfJsons);

    for (var i = 0; i < decodedJson.length; i++) {
      var onboardItem = OnboardingData.fromJson(decodedJson[i]);
      _onboardingItems.add(onboardItem);
      notifyListeners();
    }
  }

  void updatePosition(int position) {
    _currentPosition = position;
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

  void movetoLast(PageController pageController, int pageNumber) {
    pageController.jumpToPage(pageNumber);
    notifyListeners();
  }
}
