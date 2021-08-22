import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/error_codes.dart';
import 'package:personal_diary/app/intial_screens/authentication_screen.dart';
import 'package:personal_diary/models/user.dart';
import 'package:personal_diary/services/email_auth_service.dart';
import 'package:personal_diary/services/google_signin_services.dart';
import 'package:personal_diary/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? profilePic;
  UserProfile? user;

  final emailAuthSerice = EmailAuthService();
  final googleService = GoogleSignInService();

  @override
  void initState() {
    super.initState();
    final fireUser = FirebaseAuth.instance.currentUser;
    print(fireUser);
    final name = fireUser!.displayName;
    final email = fireUser.email;
    profilePic = fireUser.photoURL ??
        'https://thumbs.dreamstime.com/z/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg';
    user =
        UserProfile(email: email!, name: name ?? '', profilePic: profilePic!);
  }

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
              backgroundImage: NetworkImage('${user!.profilePic}'),
            ),

            kVerticalGap10,
            Text(
              'Name : ${user!.name}',
            ),

            Text(
              'Eamil : ${user!.email}',
            ),
            kVerticalGap20,
            ElevatedButton(
                onPressed: () async {
                  final result = await emailAuthSerice.logout();
                  if (result) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AuthenticationScreen.id, (route) => false);
                  } else {
                    print('Exception on logout');
                  }
                },
                child: const Text('Logour'))
          ],
        ),
      ),
    );
  }
}
