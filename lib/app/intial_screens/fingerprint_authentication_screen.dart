import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_diary/app/diary/home_page.dart';
import 'package:personal_diary/app/intial_screens/make_pref.dart';
import 'package:personal_diary/app/intial_screens/splash_screen.dart';
import 'package:personal_diary/utils/constants.dart';

class FingerPrintAuthenticationScreen extends StatefulWidget {
  FingerPrintAuthenticationScreen({Key? key, required this.pref})
      : super(key: key);
  static String id = 'fingerPrintAuthentication';
  String pref;

  @override
  _FingerPrintAuthenticationScreenState createState() =>
      _FingerPrintAuthenticationScreenState();
}

class _FingerPrintAuthenticationScreenState
    extends State<FingerPrintAuthenticationScreen> {
  LocalAuthentication auth = LocalAuthentication();
  String authorized = "Not Authorized";

  // ---------------------------------------------------------------------------
  // authentication function

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Authenticate Yourself',
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
        if (widget.pref == '')
          Navigator.pushReplacementNamed(context, MakePreferencePage.id);
        else
          Navigator.pushReplacementNamed(context, SplashScreen.id);
      }

      print(authorized);
    });
  }

  @override
  void initState() {
    super.initState();

    _authenticate();
  }

  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kDecorationBox,
        padding: const EdgeInsets.symmetric(vertical: 150.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MY',
                  style: kHomeIconTextStyle.copyWith(color: Colors.red),
                ),
                Text(
                  'DIARY',
                  style: kHomeIconTextStyle.copyWith(color: Colors.white),
                )
              ],
            ),
            const Icon(
              Icons.fingerprint_sharp,
              color: Colors.white,
              size: 100.0,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              'Biometric Verification',
              style: kMessageStyles.copyWith(
                  decoration: TextDecoration.none, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
