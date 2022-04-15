import 'package:cbc_online/global_constants.dart';
import 'package:cbc_online/screens/onboarding_screen.dart';
import 'package:cbc_online/screens/sign_up.dart';
import 'package:cbc_online/viewmodels/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => OnboardingViewModel(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: GoogleFonts.cabin().fontFamily),
      initialRoute: onboardingPath,
      routes: {
        onboardingPath: (context) => const OnboardingScreen(),
        signUpPath: (context) => const SignUpScreen()
      },
    );
  }
}
