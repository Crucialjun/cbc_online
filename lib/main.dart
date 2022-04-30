import 'package:cbc_online/firebase/firebase_provider.dart';
import 'package:cbc_online/global_constants.dart';
import 'package:cbc_online/providers/learner_provider.dart';
import 'package:cbc_online/screens/homescreen.dart';
import 'package:cbc_online/screens/onboarding_screen.dart';
import 'package:cbc_online/screens/sign_up.dart';
import 'package:cbc_online/viewmodels/onboarding_viewmodel.dart';
import 'package:cbc_online/viewmodels/sign_up_viewmodel.dart';
import 'package:cbc_online/viewmodels/splash_viewmodel.dart';
import 'package:cbc_online/widgets/auth_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

bool isBoarded = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isBoarded = prefs.getBool("onboarding") ?? false;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      Provider<User?>(create: (_) => FirebaseAuth.instance.currentUser),
      ChangeNotifierProvider(
        create: (_) => OnboardingViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => SplashViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => LearnerProvider(),
      ),
      ChangeNotifierProvider(create: (_) => FirebaseProvider()),
      ChangeNotifierProvider(create: (_) => SignupViewmodel()),
      StreamProvider(
          create: (context) => context.watch<FirebaseProvider>().authState,
          initialData: null)
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
      initialRoute: isBoarded ? authcheckPath : onboardingPath,
      routes: {
        onboardingPath: (context) => const OnboardingScreen(),
        signUpPath: (context) => const SignUpScreen(),
        homepagePath: (context) => const HomepageScreen(),
        authcheckPath: (context) => const AuthChecker()
      },
    );
  }
}
