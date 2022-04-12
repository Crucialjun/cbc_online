import 'package:cbc_online/global_constants.dart';
import 'package:flutter/material.dart';

class OnboardingpageView extends StatelessWidget {
  const OnboardingpageView({Key? key, required this.pageController})
      : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PageView(
          controller: pageController,
          children: [
            viewpage("assets/gifs/viewpage.gif", "Learning Made Easy", lorem),
            viewpage("assets/gifs/viewpagetwo.gif", "Learning Made Fun", lorem),
            viewpage("assets/gifs/viewpage.gif", "Learning Made Easy", lorem),
            viewpage("assets/gifs/viewpage.gif", "Learning Made Easy", lorem),
          ],
        ),
      ),
    );
  }

  Container viewpage(String asset, String title, String text) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Expanded(
          child: Image.asset(
            asset,
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
