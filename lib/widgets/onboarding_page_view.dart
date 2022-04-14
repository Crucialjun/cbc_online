import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/onboarding_viewmodel.dart';

class OnboardingpageView extends StatelessWidget {
  const OnboardingpageView({Key? key, required this.pageController})
      : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    List onboardingItems = context.watch<OnboardingViewModel>().onboardingItems;
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PageView.builder(
              controller: pageController,
              itemCount: onboardingItems.length,
              itemBuilder: (context, index) {
                return viewpage(onboardingItems[index].assetName,
                    onboardingItems[index].title, onboardingItems[index].text);
              })),
    );
  }

  Container viewpage(String asset, String title, String text) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Expanded(
          child: Image.asset(
            "gifs/$asset.gif",
          ),
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(text),
      ]),
    );
  }
}
