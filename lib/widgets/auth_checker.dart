import 'package:cbc_online/firebase/firebase_provider.dart';
import 'package:cbc_online/screens/homescreen.dart';
import 'package:cbc_online/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.watch<FirebaseProvider>().authState,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const SignUpScreen();
          }
          if (snapshot.hasData) {
            return const HomepageScreen();
          } else {
            return const SignUpScreen();
          }
        });
  }
}
