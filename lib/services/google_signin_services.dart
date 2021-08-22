import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInService {
  final googleSignIn = GoogleSignIn();

  Future<dynamic> login() async {
    final user = await googleSignIn.signIn();
    if (user != null) {
      final googelAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googelAuth.accessToken,
        idToken: googelAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return user;
    } else {
      print("user is null");
    }
  }

  //

  Future<void> logout() async {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
  //
}
