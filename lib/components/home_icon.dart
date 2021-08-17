import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_diary/utils/constants.dart';

class HomeIcon extends StatefulWidget {
  const HomeIcon({Key? key, this.iconsize}) : super(key: key);
  final double? iconsize;

  @override
  _HomeIconState createState() => _HomeIconState();
}

class _HomeIconState extends State<HomeIcon> {
  double iconsize = 60.0;

  @override
  void initState() {
    super.initState();

    if (widget.iconsize != null) {
      setState(() {
        iconsize = widget.iconsize!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: kHeroLogoTag,
          child: Icon(
            FontAwesomeIcons.bookReader,
            size: iconsize,
            color: const Color.fromRGBO(245, 48, 111, 1),
          ),
        ),
        kVerticalGap10,
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
          style: kMessageStyles.copyWith(decoration: TextDecoration.none),
        ),
        kVerticalGap50,
      ],
    );
  }
}
