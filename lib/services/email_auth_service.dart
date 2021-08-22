import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthService {
  dynamic emailValidator(String email) {
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";

    RegExp regExp = RegExp(p);

    if (email.isEmpty) {
      return 'This Field is required';
    } else if (!regExp.hasMatch(email)) {
      return 'Emai is not valid';
    }

    return null;
  }

  //

  dynamic passwordValidator(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (password.isEmpty) {
      return 'This field is required';
    } else if (password.length < 8) {
      return 'Password must be atleast 8 characters';
    } else if (!regex.hasMatch(password)) {
      return 'Atleast 1 uppercase, lowercase, special character required';
    } else {
      return null;
    }
  }

  //

  dynamic confimPasswordValidator(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return 'Password didn\'t match';
    } else {
      return null;
    }
  }

  // register
  Future<bool> register(email, password) async {
    var userCredential;

    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    //
    if (userCredential == null) {
      return false;
    }
    return true;
  }

  // login
  Future<dynamic> login(email, password) async {
    UserCredential userCredential;

    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }

  // logout
  Future<bool> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (error) {
      return false;
    }
  }
}
