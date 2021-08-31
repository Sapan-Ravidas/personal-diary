// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:personal_diary/app/diary/home_page.dart';
import 'package:personal_diary/app/intial_screens/splash_screen.dart';
import 'package:personal_diary/utils/constants.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:personal_diary/utils/constants.dart';
import 'package:personal_diary/services/shared_pref_service.dart';

class MakePreferencePage extends StatefulWidget {
  const MakePreferencePage({Key? key}) : super(key: key);
  static final String id = 'makePrefernces';

  @override
  _MakePreferencePageState createState() => _MakePreferencePageState();
}

class _MakePreferencePageState extends State<MakePreferencePage> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        onPressed: () async {
          await storageService.write(
              'preference', _switchValue ? 'true' : 'false');
          Navigator.pushReplacementNamed(context, SplashScreen.id);
        },
        child: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
      ),
      body: Container(
        decoration: kDecorationBox,
        child: SafeArea(
          child: ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 60.0, horizontal: 30.0),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Make Fingerprint As Your Default Security Type'
                          .toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          wordSpacing: 3.0),
                    ),
                  ),
                  kHorizontalGap10,
                  FlutterSwitch(
                    value: _switchValue,
                    activeColor: Colors.pink,
                    toggleColor: Colors.red.shade700,
                    onToggle: (value) {
                      setState(() => _switchValue = value);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
