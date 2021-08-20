import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/error_codes.dart';
import 'package:personal_diary/app/intial_screens/authentication_screen.dart';
import 'package:personal_diary/services/google_signin_services.dart';
import 'package:personal_diary/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  final googleService = GoogleSignInService();

  // -------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'WELCOME',
              style: kMessageStyles.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            //
            kVerticalGap10,
            CircleAvatar(
              maxRadius: 25.0,
              backgroundImage: NetworkImage('${user!.photoURL}'),
            ),

            //
            kVerticalGap10,
            Text(
              'Name : ${user!.displayName}',
            ),

            Text(
              'Eamil : ${user!.email}',
            ),
            kVerticalGap20,
            ElevatedButton(
                onPressed: () async {
                  try {
                    final g = GoogleSignIn();
                    await g.disconnect();
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, AuthenticationScreen.id, (route) => false);
                  } catch (error) {
                    print("Error ocuured in logout Process");
                  }
                },
                child: const Text('Logour'))
          ],
        ),
      ),
    );
  }
}
