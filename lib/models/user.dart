import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  String email = '';
  String name = '';
  String profilePic;

  UserProfile({
    required this.email,
    required this.name,
    required this.profilePic,
  });
}
