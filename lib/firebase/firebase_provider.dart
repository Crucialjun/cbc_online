import 'package:cbc_online/firebase/firebase_auth_methods.dart';
import 'package:cbc_online/utils/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseProvider extends ChangeNotifier {
  ViewState _viewState = ViewState.ready;

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  ViewState get viewState => _viewState;

  void setViewState(ViewState state) {
    _viewState = viewState;
    notifyListeners();
  }

  Future<bool> signInAnonymously(BuildContext context) {
    return FirebaseAuthMethods().signinAnonymously(context);
  }

  Future<bool> signOut(BuildContext context) {
    return FirebaseAuthMethods().signOut(context);
  }
}
