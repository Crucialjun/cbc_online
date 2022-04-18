import 'package:cbc_online/global_constants.dart';
import 'package:cbc_online/screens/onboarding_screen.dart';
import 'package:cbc_online/screens/sign_up.dart';
import 'package:cbc_online/screens/splash_screen.dart';
import 'package:cbc_online/viewmodels/onboarding_viewmodel.dart';
import 'package:cbc_online/viewmodels/splash_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => OnboardingViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => SplashViewModel(),
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
      theme: ThemeData(fontFamily: GoogleFonts.aBeeZee().fontFamily),
      initialRoute: splashPath,
      routes: {
        splashPath: (context) => const SplashScreen(),
        onboardingPath: (context) => const OnboardingScreen(),
        signUpPath: (context) => const SignUpScreen()
      },
    );
  }
}
