import 'package:cbc_online/firebase/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseProvider extends ChangeNotifier {
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  Future<bool> signInAnonymously(BuildContext context) {
    return FirebaseAuthMethods().signinAnonymously(context);
  }

  Future<bool> signOut(BuildContext context) {
    return FirebaseAuthMethods().signOut(context);
  }
}
