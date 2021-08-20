import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_diary/app/diary/home_page.dart';
import 'package:personal_diary/app/intial_screens/authentication_screen.dart';
import 'package:personal_diary/components/home_icon.dart';
import 'package:personal_diary/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String id = 'splashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      if (auth.currentUser == null) {
        Navigator.pushReplacementNamed(context, AuthenticationScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, HomePage.id);
      }
    });
    return Container(
      decoration: kDecorationBox,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [HomeIcon()],
      ),
    );
  }
}
