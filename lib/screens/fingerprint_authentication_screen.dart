import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_diary/screens/homr_Screen.dart';
import 'package:personal_diary/screens/splash_screen.dart';

class FingerPrintAuthenticationScreen extends StatefulWidget {
  const FingerPrintAuthenticationScreen({Key? key}) : super(key: key);
  static String id = 'fingerPrintAuthentication';

  @override
  _FingerPrintAuthenticationScreenState createState() =>
      _FingerPrintAuthenticationScreenState();
}

class _FingerPrintAuthenticationScreenState
    extends State<FingerPrintAuthenticationScreen> {
  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric = false;
  List<BiometricType>? _availableBiometric;
  String authorized = "Not Authorized";

  // ---------------------------------------------------------------------------
  // this function allow us to check out biometric sensor
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

  // get the available biometric sensors from our device
  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }

    if (!mounted) return;
    setState(() {
      _availableBiometric = availableBiometrics;
    });
  }

  // authentication function
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your finger to authenticate',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;
    setState(() {
      // if authentication is success head over to next page
      authorized = authenticated ? 'Authorized' : 'Not Authorized';
      if (authenticated) {
        Navigator.pushReplacementNamed(context, SplashScreen.id);
      }

      print(authorized);
    });
  }

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
    _getAvailableBiometrics();
    _authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('biometric verification'),
    );
  }
}
