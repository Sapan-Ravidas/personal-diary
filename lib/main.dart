import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:personal_diary/app/diary/home_page.dart';
import 'package:personal_diary/app/intial_screens/authentication_screen.dart';
import 'package:personal_diary/app/intial_screens/fingerprint_authentication_screen.dart';
import 'package:personal_diary/app/intial_screens/login_screen.dart';
import 'package:personal_diary/app/intial_screens/make_pref.dart';
import 'package:personal_diary/app/intial_screens/passcode_screen.dart';
import 'package:personal_diary/app/intial_screens/register_screen.dart';
import 'package:personal_diary/app/intial_screens/splash_screen.dart';
import 'package:personal_diary/services/shared_pref_service.dart';
import 'package:flutter/services.dart';

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
          MakePreferencePage.id: (context) => MakePreferencePage(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          LoginScreen.id: (context) => const LoginScreen(),

          //
          HomePage.id: (context) => const HomePage(),
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
  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric = false;
  String validPin = '';
  String lockPreference = '';

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
    _checkBiometrics();
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometrics;
    });
  }

  void getSharedPreferences() async {
    final pin = await storageService.read('pin');
    final pref = await storageService.read('preference');
    setState(() {
      validPin = pin;
      lockPreference = pref;
      print('lock-preference' + lockPreference);
    });
  }

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

        // Once complete, show your application... start with fingerprint and passcode auth
        if (snapshot.connectionState == ConnectionState.done) {
          if (_canCheckBiometric == false) {
            return LockScreen(
                validPin: validPin,
                pref: lockPreference,
                biometric: _canCheckBiometric);
          } else {
            if (lockPreference == '' || lockPreference == 'false')
              return LockScreen(
                validPin: validPin,
                pref: lockPreference,
                biometric: _canCheckBiometric,
              );
            else
              return FingerPrintAuthenticationScreen(
                pref: lockPreference,
              );
          }
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
