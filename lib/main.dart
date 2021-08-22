import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_diary/app/diary/edit_diary.dart';
import 'package:personal_diary/app/diary/home_page.dart';
import 'package:personal_diary/app/intial_screens/authentication_screen.dart';
import 'package:personal_diary/app/intial_screens/fingerprint_authentication_screen.dart';
import 'package:personal_diary/app/intial_screens/login_screen.dart';
import 'package:personal_diary/app/intial_screens/register_screen.dart';
import 'package:personal_diary/app/intial_screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: InitFire.id,
        routes: {
          InitFire.id: (context) =>
              const InitFire(), // This is initiazation of our firebase instance and entry point of App
          SplashScreen.id: (context) => const SplashScreen(),
          AuthenticationScreen.id: (context) => const AuthenticationScreen(),
          FingerPrintAuthenticationScreen.id: (context) =>
              const FingerPrintAuthenticationScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          LoginScreen.id: (context) => const LoginScreen(),

          //
          HomePage.id: (context) => const HomePage(),
          EditDiary.id: (context) => const EditDiary(),
        },
      );
}

// This Seperate state is build to handle the situation when app will not able to initialze firebase instance
// TODO : Those scenerios is still to handle

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
            child: const Text('some error occured'),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return FingerPrintAuthenticationScreen();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
