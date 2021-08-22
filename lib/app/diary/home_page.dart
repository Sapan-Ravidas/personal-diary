import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/error_codes.dart';
import 'package:personal_diary/app/diary/componeents/history_page.dart';
import 'package:personal_diary/app/diary/edit_diary.dart';
import 'package:personal_diary/app/intial_screens/authentication_screen.dart';
import 'package:personal_diary/models/user.dart';
import 'package:personal_diary/services/email_auth_service.dart';
import 'package:personal_diary/services/google_signin_services.dart';
import 'package:personal_diary/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final id = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final tabs = [
    HistoryPage(),
    Container(
      child: Center(
        child: Text('Calendar Page'),
      ),
    ),
  ];

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.red.withOpacity(0.6),
        selectedItemColor: Colors.red,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
          print(selectedIndex);
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Calendar',
          ),
        ],
      ),
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        tooltip: 'Add Memories',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //
      body: tabs[selectedIndex],
    );
  }
}
