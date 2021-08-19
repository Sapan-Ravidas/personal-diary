import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  HeaderWidget() {
    return Text("HI\nhi");
  }

  //----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverPersistentHeader(
        //   delegate: _SliverheaderDelegate(minExtent: 85, maxExtent: 250),
        //   pinned: true,
        // ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.white60,
                  title: Text((index + 1).toString() +
                      " July " +
                      DateTime.now().toString()),
                  subtitle: Text("Title"),
                ),
              );
            },
            childCount: 9,
          ),
        ),
      ],
    );
  }
}

// class _SliverheaderDelegate implements SliverPersistentHeaderDelegate {
//   bool lookForvisibility(double shrinkOffset, double offsetAt) {
//     if (max(0.0, shrinkOffset) / maxExtent > offsetAt) {
//       return false;
//     } else
//       return true;
//   }

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }

//   @override
//   FloatingHeaderSnapConfiguration get snapConfiguration() {};

//   @override
//   PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
//       null;

//   @override
//   OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

//   @override
//   TickerProvider get vsync => null;

//   // ---------------------------------------------------------------------------
//   //----------------------------------------------------------------------------

//   @override
//   _SliverheaderDelegate({required this.minExtent, required this.maxExtent});

//   final double minExtent;
//   final double maxExtent;
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Stack(
//       fit: StackFit.loose,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             // shape: BoxShape.circle,
//             borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(15),
//                 bottomRight: Radius.circular(15)),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.grey.shade200, spreadRadius: 1, blurRadius: 2),
//             ],
//           ),
//           child: Column(
//             children: <Widget>[
//               Visibility(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10, left: 15, bottom: 0),
//                   child: Row(
//                     children: <Widget>[
//                       AnimatedOpacity(
//                         opacity: max(0.0, shrinkOffset) / maxExtent > 0.5
//                             ? 0.0
//                             : 1.0,
//                         duration: Duration(milliseconds: 500),
//                         child: Text("Hi",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 visible: lookForvisibility(shrinkOffset, 0.5),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 10, left: 15, right: 15, bottom: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text("Shreya",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                     IconButton(
//                         tooltip: "More",
//                         splashRadius: 10,
//                         splashColor: Colors.blue,
//                         icon: Icon(Icons.more_horiz_outlined),
//                         onPressed: () {
//                           print("more_menu");
//                           print(MediaQuery.of(context).size);
//                         }),
//                   ],
//                 ),
//               ),
//               Visibility(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 15),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Good ",
//                           textAlign: TextAlign.left,
//                         ),
//                         Text(
//                           "Evening",
//                           textAlign: TextAlign.left,
//                           style: TextStyle(color: Colors.green.shade400),
//                         )
//                       ],
//                     ),
//                   ),
//                   visible: lookForvisibility(shrinkOffset, 0.7)),
//               Visibility(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 15, right: 20, top: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text("Total Entries : 23"),
//                       Text("Total Words: 4567")
//                     ],
//                   ),
//                 ),
//                 visible: lookForvisibility(shrinkOffset, 0.3),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
