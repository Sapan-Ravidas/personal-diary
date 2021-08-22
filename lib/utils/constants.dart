import 'package:flutter/material.dart';

const kVerticalGap5 = SizedBox(height: 5.0);
const kVerticalGap10 = SizedBox(height: 10.0);
const kVerticalGap20 = SizedBox(height: 20.0);
const kVerticalGap30 = SizedBox(height: 30.0);
const kVerticalGap40 = SizedBox(height: 40.0);
const kVerticalGap50 = SizedBox(height: 50.0);

const kHorizontalGap5 = SizedBox(width: 5.0);
const kHorizontalGap10 = SizedBox(width: 10);
const kHorizontalGap20 = SizedBox(width: 20);
const kHorizontalGap30 = SizedBox(width: 30);
const kHorizontalGap40 = SizedBox(width: 40);
const kHorizontalGap50 = SizedBox(width: 50);

const String kHeroLogoTag = 'logo';

const kHomeIconTextStyle = TextStyle(
  color: Color.fromRGBO(245, 48, 111, 1),
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.none,
);

const kMessageStyles = TextStyle(
  color: Colors.white,
  decoration: TextDecoration.underline,
  decorationStyle: TextDecorationStyle.dashed,
  decorationColor: Colors.white,
  fontSize: 12.0,
);

const kLoginSignUpTextStyle = TextStyle(
  color: Colors.white,
  decoration: TextDecoration.underline,
  decorationColor: Colors.white,
  decorationStyle: TextDecorationStyle.solid,
  fontSize: 34.0,
);

const kDecorationBox = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 123, 67, 1),
      Color.fromRGBO(245, 50, 111, 1),
    ],
  ),
);

// -----------------------------------------------------------------------------

const kFormInputDecoration = InputDecoration(
  errorStyle: TextStyle(color: Colors.yellow),
  errorMaxLines: 2,
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.yellow,
      width: 1.5,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
    borderSide: BorderSide(color: Colors.yellow, width: 1.5),
  ),
  //
  hintText: 'Enter Field',
  hintStyle: TextStyle(color: Colors.white60),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 1.5,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
);

// -----------------------------------------------------------------------------
// Diary
// -----------------------------------------------------------------------------

const kDiaryTextFieldDecoration = InputDecoration(
  hintText: 'hint text...',
  border: InputBorder.none,
);

const kDiaryNoteTitle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);
