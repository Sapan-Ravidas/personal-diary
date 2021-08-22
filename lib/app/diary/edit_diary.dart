import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_diary/utils/constants.dart';

class EditDiary extends StatefulWidget {
  const EditDiary({Key? key}) : super(key: key);
  static final String id = 'editDiary';

  @override
  _EditDiaryState createState() => _EditDiaryState();
}

class _EditDiaryState extends State<EditDiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87, size: 10.0),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
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
            child: ListView(
              children: [
                TextFormField(
                  decoration: kEditDiaryTitleDecoration,
                  style: kEditDiaryTitleStyle,
                  maxLength: 30,
                ),
                TextField(
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
    );
  }
}
