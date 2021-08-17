import 'package:flutter/material.dart';
import 'package:personal_diary/utils/constants.dart';

class NavigationLink extends StatelessWidget {
  const NavigationLink({
    Key? key,
    required this.helpText,
    required this.linktext,
    required this.onPressed,
  }) : super(key: key);

  final String helpText;
  final String linktext;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            helpText,
            style: kMessageStyles,
          ),
          const SizedBox(width: 5.0),
          Text(
            linktext,
            style: kMessageStyles.copyWith(
              color: Colors.yellowAccent,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
