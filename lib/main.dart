import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_diary/screens/dairy_screens/diary_home.dart';
import 'package:personal_diary/screens/dairy_screens/edit_diary/edit_diary_screen.dart';
import 'package:personal_diary/screens/initial_screens/fingerprint_authentication_screen.dart';
import 'package:personal_diary/screens/initial_screens/authentication_screen.dart';
import 'package:personal_diary/screens/initial_screens/login_screen.dart';
import 'package:personal_diary/screens/initial_screens/register_screen.dart';
import 'package:personal_diary/screens/initial_screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: InitFire.id,
      routes: {
        InitFire.id: (context) => InitFire(),
        SplashScreen.id: (context) => SplashScreen(),
        AuthenticationScreen.id: (context) => AuthenticationScreen(),
        FingerPrintAuthenticationScreen.id: (context) =>
            FingerPrintAuthenticationScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        EditDiaryScreen.id: (context) => EditDiaryScreen(),
        DiaryHome.id: (context) => DiaryHome(),
      },
    );
  }
}

class InitFire extends StatefulWidget {
  const InitFire({Key? key}) : super(key: key);
  static String id = 'initFirebase';

  @override
  _InitFireState createState() => _InitFireState();
}

class _InitFireState extends State<InitFire> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: Text('some error occured'),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return FingerPrintAuthenticationScreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
