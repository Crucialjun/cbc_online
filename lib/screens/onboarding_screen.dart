import 'package:cbc_online/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../viewmodels/onboarding_viewmodel.dart';
import '../widgets/onboarding_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    List onboardingItems = context.watch<OnboardingViewModel>().onboardingItems;
    int currentPostion = context.watch<OnboardingViewModel>().currentPosition;
    return Scaffold(
        body: Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Skip",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            Expanded(
                child: OnboardingpageView(
              pageController: _pageController,
            )),
            const SizedBox(
              height: 24,
            ),
            currentPostion == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                          effect: const SlideEffect(
                              activeDotColor: appPrimaryColor),
                          controller: _pageController,
                          count: onboardingItems.isEmpty
                              ? 1
                              : onboardingItems.length),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: appPrimaryColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : currentPostion < onboardingItems.length - 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                _pageController.previousPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeIn);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: appPrimaryColor,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, left: 16, right: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "Prev",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SmoothPageIndicator(
                              effect: const SlideEffect(
                                  activeDotColor: appPrimaryColor),
                              controller: _pageController,
                              count: onboardingItems.isEmpty
                                  ? 1
                                  : onboardingItems.length),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeIn);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: appPrimaryColor,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0, left: 16, right: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Next",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: appPrimaryColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                top: 16.0, bottom: 16.0, left: 24, right: 24),
                            child: Text(
                              "Get Started",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      )
          ],
        ),
      ),
    ));
  }
}
