// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:personal_diary/utils/providers/bottom_provider.dart';

// class MyBottomNavState extends StatefulWidget {
//   MyBottomNavState({Key key}) : super(key: key);
//   @override
//   _MyBottomNav createState() => _MyBottomNav();
// }

// class _MyBottomNav extends State<MyBottomNavState> {
//   int _selectedIndex = 0;
//   @override
//   void initState() {
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         elevation: 3,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               getIconBook("/", context),
//               semanticLabel: "Dairy",
//               color: getColor(0, context),
//             ),
//             label: "Dairy",
//             tooltip: "Dairy",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               getIconCal("/calendar", context),
//               semanticLabel: "Calendar",
//               color: getColor(1, context),
//             ),
//             label: "Calendar",
//             tooltip: "Calendar",
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: (int index) {
//           context.read<WidgetIndex>().changevalue(index);
//           _selectedIndex = index;
//         });
//   }

//   Color getColor(int value, BuildContext context) {
//     if (context.watch<WidgetIndex>().indexWidget == value) {
//       return Colors.pink.shade400;
//     } else {
//       return Colors.grey.shade400;
//     }
//   }

//   IconData getIconBook(String value, BuildContext context) {
//     if (context.watch<WidgetIndex>().indexWidget == 0) {
//       return Icons.book;
//     } else {
//       return Icons.book_outlined;
//     }
//   }

//   IconData getIconCal(String value, BuildContext context) {
//     if (context.watch<WidgetIndex>().indexWidget == 1) {
//       return Icons.calendar_today;
//     } else {
//       return Icons.calendar_today_outlined;
//     }
//   }

//   void navigateTOCalendar(BuildContext context) {
//     // Navigator.removeRouteBelow(context, anchorRoute)
//     context.read<WidgetIndex>().changevalue(1);
//     // getColor(1, context);
//   }
// }

//  // IconButton(
//           //   icon: Icon(getIconBook("/", context),
//           //       semanticLabel: "Dairy", color: getColor(0, context)),
//           //   tooltip: "Dairy",
//           //   onPressed: () {
//           //     context.read<WidgetIndex>().changevalue(0);
//           //     // getColor(0, context);
//           //   },
//           // ),
//           // IconButton(
//           //     icon: Icon(getIconCal("/calender", context),
//           //         color: getColor(1, context)),
//           //     onPressed: () {
//           //       navigateTOCalendar(context);
//           //     })