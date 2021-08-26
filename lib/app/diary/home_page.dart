import 'package:flutter/material.dart';
import 'package:personal_diary/app/diary/calendar_screen.dart';

import 'package:personal_diary/app/diary/componeents/history_page.dart';
import 'package:personal_diary/app/diary/edit_diary.dart';

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
    CalendarScreen(),
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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditDiary()));
        },
        child: const Icon(Icons.add),
        tooltip: 'Add Memories',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //
      body: tabs[selectedIndex],
    );
  }
}
