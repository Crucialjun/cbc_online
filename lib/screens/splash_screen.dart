import 'package:cbc_online/gen/assets.gen.dart';
import 'package:cbc_online/global_constants.dart';
import 'package:cbc_online/viewmodels/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("CBC",
                style: TextStyle(
                    fontFamily: GoogleFonts.ultra().fontFamily,
                    //fontWeight: FontWeight.bold,
                    fontSize: 58,
                    color: const Color(0xFFFF725E))),
            Image.asset(Assets.gifs.splash.path),
            Text("ONLINE",
                style: TextStyle(
                    fontFamily: GoogleFonts.ultra().fontFamily,
                    //fontWeight: FontWeight.bold,
                    fontSize: 58,
                    color: const Color(0xFFFF725E)))
          ]),
    );
  }

  void _navigateToHome() async {
    bool isFirstTime = context.read<SplashViewModel>().isFirstTime;
    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, onboardingPath);
    } else {
      Navigator.pushReplacementNamed(context, signUpPath);
    }
  }
}
