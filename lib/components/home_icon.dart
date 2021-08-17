import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_diary/utils/constants.dart';

class HomeIcon extends StatefulWidget {
  const HomeIcon({Key? key}) : super(key: key);

  @override
  _HomeIconState createState() => _HomeIconState();
}

class _HomeIconState extends State<HomeIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: kHeroLogoTag,
          child: Icon(
            FontAwesomeIcons.bookReader,
            size: 60.0,
            color: Color.fromRGBO(245, 48, 111, 1),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MY',
              style: kHomeIconTextStyle.copyWith(color: Colors.red),
            ),
            Text(
              'DIARY',
              style: kHomeIconTextStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
        kVerticalGap10,
        Text(
          'Hit the road of your heart with Diary.',
          style: kMessageStyles,
        ),
        kVerticalGap50,
      ],
    );
  }
}
