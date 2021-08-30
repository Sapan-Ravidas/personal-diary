import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_diary/app/diary/profile_page.dart';
import 'package:personal_diary/app/intial_screens/authentication_screen.dart';
import 'package:personal_diary/models/user.dart';
import 'package:personal_diary/services/email_auth_service.dart';
import 'package:personal_diary/services/google_signin_services.dart';
import 'package:personal_diary/services/note_provider.dart';
import 'package:personal_diary/utils/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0.0,
        toolbarHeight: 70.0,
        leading: Expanded(
          child: GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserProfilePage(user: user!))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 25.0,
                  backgroundImage: NetworkImage('${user!.profilePic}'),
                ),
              ],
            ),
          ),
        ),
        title: Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            user!.name != null
                ? Text(
                    '${user!.name}',
                    style:
                        const TextStyle(fontSize: 14.0, color: Colors.black87),
                  )
                : Container(),
            Text(
              '${user!.email}',
              style: const TextStyle(color: Colors.black87),
            ),
          ],
        )),
        actions: [
          IconButton(
              onPressed: () async {
                bool result = await emailAuthSerice.logout();
                if (result)
                  Navigator.pushNamedAndRemoveUntil(
                      context, AuthenticationScreen.id, (route) => false);
                else
                  print("Error in logout");
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(fireUser!.uid)
            .collection('notes')
            .orderBy('dateCreated', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Container(
                margin: const EdgeInsets.all(8.0),
                decoration: kNoteDecorationStyle,
                child: Slidable(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.yMMMd()
                                .format(data['dateCreated'].toDate()),
                            style: kNoteDateCreatedStyle,
                          ),
                          kVerticalGap5,
                          Text(
                            data['title'],
                            style: kNoteHeadingStyle,
                          ),
                          kVerticalGap10,
                          Text(
                            data['description'] ?? '',
                            style: kNoteDescriptionStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  actionPane: const SlidableDrawerActionPane(),
                  secondaryActions: [
                    IconButton(
                      onPressed: () async {
                        try {
                          final noteProvider = NoteProvider();
                          await noteProvider.deleteNote(
                              noteId: data['id'], uid: fireUser!.uid);
                          setState(() {});
                        } catch (error) {
                          print("Error in deletion");
                        }
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
