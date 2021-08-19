import 'package:flutter/material.dart';
import 'package:personal_diary/screens/dairy_screens/calendar/calendar_screen.dart';
import 'package:personal_diary/screens/dairy_screens/homescreen/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:personal_diary/utils/providers/bottom_provider.dart';

class DiaryHome extends StatelessWidget {
  const DiaryHome({Key? key}) : super(key: key);
  static String id = 'diaryHome';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WidgeIndex(),
        ),
      ],
      child: Diary(),
    );
  }
}

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);
  static String id = 'diary';

  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  List<Widget> _widgetOptions = [HomeScreen(), CalendarScreen()];

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
