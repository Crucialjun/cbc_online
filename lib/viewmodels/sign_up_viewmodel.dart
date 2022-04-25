import 'package:cbc_online/firebase/firebase_auth_methods.dart';
import 'package:flutter/material.dart';

class SignupViewmodel extends ChangeNotifier {
  bool _isPasswordValid = false;

  bool get isPasswordValid => _isPasswordValid;

  void validatePassword() {
    _isPasswordValid = true;
    notifyListeners();
  }

  Future<bool> signup({
    required BuildContext context,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    return await FirebaseAuthMethods().signUp(
        context: context,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName);
  }
}
