import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../viewmodels/onboarding_viewmodel.dart';

class OnboardingpageView extends StatelessWidget {
  const OnboardingpageView({Key? key, required this.pageController})
      : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    List onboardingItems = context.watch<OnboardingViewModel>().onboardingItems;
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: PageView.builder(
            controller: pageController,
            itemCount: onboardingItems.length,
            onPageChanged: (value) {
              context.read<OnboardingViewModel>().updatePosition(value);
            },
            itemBuilder: (context, index) {
              return viewpage(onboardingItems[index].assetName,
                  onboardingItems[index].title, onboardingItems[index].text);
            }));
  }

  Container viewpage(String asset, String title, String text) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Expanded(
          child: Image.asset(
            "assets/gifs/$asset.gif",
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.cabin().fontFamily),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(text),
      ]),
    );
  }
}
