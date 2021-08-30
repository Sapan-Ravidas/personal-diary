import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_diary/app/intial_screens/authentication_screen.dart';
import 'package:personal_diary/app/intial_screens/numpad.dart';
import 'package:personal_diary/app/intial_screens/passcode_screen.dart';
import 'package:personal_diary/models/user.dart';
import 'package:personal_diary/utils/constants.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key, required this.user}) : super(key: key);
  final UserProfile user;

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 50.0,
              backgroundImage: NetworkImage('${widget.user.profilePic}'),
            ),
            widget.user.name != null
                ? Text(
                    '${widget.user.name}',
                    style:
                        const TextStyle(fontSize: 16.0, color: Colors.black87),
                  )
                : Container(),
            Text(
              '${widget.user.email}',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16.0,
              ),
            ),
            kVerticalGap10,
            ElevatedButton(
              onPressed: () async {
                final auth = FirebaseAuth.instance;
                try {
                  await auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, AuthenticationScreen.id, (route) => false);
                } catch (error) {
                  print(error);
                }
              },
              child: const Text('Logout'),
            ),
            // testing for passcode screen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LockScreen(phoneNumber: '12345')));
              },
              child: Text('Testing for passcode screen'),
            )
          ],
        ),
      ),
    );
  }
}
