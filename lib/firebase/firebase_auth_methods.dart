import 'package:cbc_online/firebase/firebase_cloud_methods.dart';
import 'package:cbc_online/models/learner_model.dart';
import 'package:cbc_online/providers/learner_provider.dart';
import 'package:cbc_online/utils/show_dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FirebaseAuthMethods {
  Future<bool> signinAnonymously(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      Learner learner = Learner(
          firstName: "Anonymous",
          lastName: "Learner",
          email: "",
          uid: userCredential.user?.uid ?? "",
          phoneNumber: "");
      await Provider.of<LearnerProvider>(context, listen: false)
          .updateLearner(learner);
      print(learner);
      return true;
    } on FirebaseAuthException catch (e) {
      showErrorDialog(context, e.message.toString());
      return false;
    }
  }

  Future<bool> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      showErrorDialog(context, e.message.toString());
      return false;
    }
  }

  Future<bool> signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Learner learner = Learner(
          firstName: firstName,
          lastName: lastName,
          email: email,
          uid: userCredential.user!.uid,
          phoneNumber: "");
      bool storeSuccess =
          await FirebaseCloudMethods().addLearner(learner, context);
      if (storeSuccess) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      showErrorDialog(context, e.toString());
      return false;
    }
  }
}
