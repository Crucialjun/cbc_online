import 'package:cbc_online/utils/show_dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthMethods {
  Future<bool> signinAnonymously(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      return true;
    } on FirebaseAuthException catch (e) {
      showErrorDialog(context, e.message.toString());
      return false;
    }
  }
}
