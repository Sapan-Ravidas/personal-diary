import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_diary/app/diary/edit_diary.dart';
import 'package:personal_diary/models/notes.dart';
import 'package:personal_diary/utils/constants.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({Key? key}) : super(key: key);

  Future<DateTime?> _selectDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(const Duration(seconds: 1)),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Calendar',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You can choose custom dates to manage your diary.'),
              kVerticalGap10,
              ElevatedButton(
                onPressed: () async {
                  final selectedDate = await _selectDateTime(context);
                  if (selectedDate != null) {
                    Note note = Note(dateCreated: selectedDate);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditDiary(
                          note: note,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Choose Date'),
              ),
            ],
          ),
        ));
  }
}
