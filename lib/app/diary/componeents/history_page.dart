import 'package:cloud_firestore/cloud_firestore.dart';
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
  User? fireUser;

  final emailAuthSerice = EmailAuthService();
  final googleService = GoogleSignInService();

  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    fireUser = FirebaseAuth.instance.currentUser;
    print(fireUser);
    final name = fireUser!.displayName;
    final email = fireUser!.email;
    profilePic = fireUser!.photoURL ??
        'https://thumbs.dreamstime.com/z/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg';
    user =
        UserProfile(email: email!, name: name ?? '', profilePic: profilePic!);
  }

  // ---------------------------------------------------------------------------

  Widget buildSliverAppbar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white.withOpacity(0.6),
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
    );
  }

  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(fireUser!.uid)
            .collection('notes')
            .snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
                  slivers: [
                    buildSliverAppbar(context),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          //
                          dynamic data = snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            //
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                          });
                          print(data);
                        },
                      ),
                    ),
                  ],
                )
              : CustomScrollView(
                  slivers: [
                    buildSliverAppbar(context),
                  ],
                );
        });
  }
}






//               //
//              SliverList( 
//                   delegate: SliverChildBuilderDelegate((context, index) {}))
//             ],
//           );



















































// Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(16.0),
//               child: Container(
//                   color: Colors.white,
//                   child: Padding(
//                     padding:
//                         EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Date',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14.0,
//                           ),
//                         ),
//                         kVerticalGap10,
//                         Text(
//                           'Title',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16.0,
//                           ),
//                         ),
//                         Text(
//                           'Description',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//             ),
//           ),