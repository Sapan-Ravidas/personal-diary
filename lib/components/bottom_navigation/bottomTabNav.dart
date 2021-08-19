// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MyBottomNavTabState extends StatefulWidget {
//   MyBottomNavTabState({Key key}) : super(key: key);
//   @override
//   _MyBottomNavTab createState() => _MyBottomNavTab();
// }

// class _MyBottomNavTab extends State<MyBottomNavTabState> {
//   int _selectedIndex = 0;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 20, bottom: 20, top: 20, left: 20),
//       child: Container(
//         height: 200,
//         width: 100,
//         decoration: BoxDecoration(
//             color: Colors.transparent,
//             boxShadow: [
//               BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 2)
//             ],
//             borderRadius: BorderRadius.all(Radius.circular(50))),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             IconButton(
//               icon: Icon(Icons.add),
//               iconSize: 50,
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.book_outlined),
//               iconSize: 50,
//               onPressed: () {},
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
