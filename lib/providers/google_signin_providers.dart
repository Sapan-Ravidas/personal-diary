import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  late bool _isSigningIn;

  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  // getter
  bool get isSigningIn => _isSigningIn;

  // setter
  set isSigningIn(bool value) {
    _isSigningIn = value;
    notifyListeners();
  }

  // login
  Future login() async {
    isSigningIn = true;
    final user = await googleSignIn.signIn();

    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      final googelAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googelAuth.accessToken,
        idToken: googelAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      isSigningIn = false;
    }

    //

    void logout() async {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    }
  }
}
