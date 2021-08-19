import 'package:flutter/material.dart';
import 'package:personal_diary/utils/constants.dart';

class EditDiaryScreen extends StatefulWidget {
  const EditDiaryScreen({Key? key}) : super(key: key);
  static String id = 'editDiaryScreen';

  @override
  _EditDiaryScreenState createState() => _EditDiaryScreenState();
}

class _EditDiaryScreenState extends State<EditDiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black87, size: 10.0),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.cancel_sharp),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: Column(
          // fit: StackFit.expand,
          // alignment: AlignmentDirectional.topCenter,
          // fit: StackFit.passthrough,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                decoration: kDiaryTextFieldDecoration.copyWith(
                  hintText: 'Title',
                  counterText: '',
                ),
                style: kDiaryNoteTitle,
                maxLength: 30,
              ),
            ),

            //

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: TextField(
                  decoration: kDiaryTextFieldDecoration.copyWith(
                    hintText: 'Your memories....',
                  ),
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  focusNode: FocusNode(
                      canRequestFocus: true, descendantsAreFocusable: true),
                  autocorrect: true,
                ),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}
