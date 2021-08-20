import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String email;

  User({
    required this.id,
    required this.email,
  });
}
