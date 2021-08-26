import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_diary/models/notes.dart';
import 'package:personal_diary/services/note_provider.dart';
import 'package:personal_diary/utils/constants.dart';

class EditDiary extends StatefulWidget {
  EditDiary({Key? key, this.note}) : super(key: key);
  static final String id = 'editDiary';

  Note? note;

  @override
  _EditDiaryState createState() => _EditDiaryState();
}

class _EditDiaryState extends State<EditDiary> {
  final _formKey = GlobalKey<FormState>();
  String? title, description;
  final noteProvider = NoteProvider();
  Note? note;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      note = widget.note;
    }
  }

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87, size: 10.0),
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (note == null) {
                  note = Note(
                    title: title,
                    description: description,
                    dateCreated: DateTime.now(),
                  );
                } else {
                  note!.title = title;
                  note!.description = description;
                }
                try {
                  noteProvider.createNote(note!);
                  // Navigate back
                  Navigator.pop(context);
                } catch (error) {
                  print("Error in saving data");
                }
              }
            },
            icon: const Icon(Icons.cancel_sharp),
          ),
        ],
      ),
      body: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() => title = value),
                    decoration: kEditDiaryTitleDecoration,
                    style: kEditDiaryTitleStyle,
                    maxLength: 30,
                  ),
                  TextField(
                    onChanged: (value) => setState(() => description = value),
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: null,
                    decoration: kEditDiaryTitleDecoration.copyWith(
                        hintText: 'Your Memories...'),
                    autofocus: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
