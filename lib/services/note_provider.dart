import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_diary/models/notes.dart';

class NoteProvider {
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<String> createNote(Note note) async {
    final docNote = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection('notes')
        .doc();
    note.id = docNote.id;
    await docNote.set(note.toJason());
    return note.id!;
  }

  //
}
