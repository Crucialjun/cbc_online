import 'package:cbc_online/global_constants.dart';
import 'package:cbc_online/screens/onboarding_screen.dart';
import 'package:cbc_online/screens/sign_up.dart';
import 'package:cbc_online/viewmodels/onboarding_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => OnboardingViewModel(),
          )
        ],
        child: MyApp(
          prefs: prefs,
        )),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.prefs}) : super(key: key);

  final SharedPreferences prefs;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(fontFamily: GoogleFonts.aBeeZee().fontFamily),
      initialRoute: onboardingPath,
      routes: {
        onboardingPath: (context) => const OnboardingScreen(),
        signUpPath: (context) => const SignUpScreen()
      },
    );
  }
}
