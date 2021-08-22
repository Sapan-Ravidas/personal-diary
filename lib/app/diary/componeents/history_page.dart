import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_diary/app/diary/profile_page.dart';
import 'package:personal_diary/models/user.dart';
import 'package:personal_diary/services/email_auth_service.dart';
import 'package:personal_diary/services/google_signin_services.dart';
import 'package:personal_diary/utils/constants.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String? profilePic;
  UserProfile? user;

  final emailAuthSerice = EmailAuthService();
  final googleService = GoogleSignInService();

  // ---------------------------------------------------------------------------

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

  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          floating: true,
          expandedHeight: 110.0,
          flexibleSpace: FlexibleSpaceBar(
            title: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserProfilePage(user: user!))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    maxRadius: 25.0,
                    backgroundImage: NetworkImage('${user!.profilePic}'),
                  ),
                  kHorizontalGap10,
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      user!.name != null
                          ? Text(
                              '${user!.name}',
                              style: const TextStyle(
                                  fontSize: 10.0, color: Colors.black87),
                            )
                          : Container(),
                      Text(
                        '${user!.email}',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 10.0,
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),

        //
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(title: Text('Item #$index')),
          childCount: 20,
        ))
      ],
    );
  }
}
