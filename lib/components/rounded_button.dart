import 'package:flutter/material.dart';
import 'package:personal_diary/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.color,
      required this.title,
      required this.onPressed,
      this.icon});
  final Color color;
  final String title;
  IconData? icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        constraints: const BoxConstraints(minWidth: 300.0, maxWidth: 500.0),
        child: Material(
          elevation: 5.0,
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200.0,
            height: 42.0,
            child: icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Icon(
                          icon,
                          size: 20.0,
                          color: Colors.white,
                        ),
                        kHorizontalGap10,
                        Text(
                          '$title',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ])
                : Text(
                    '$title',
                    style: const TextStyle(color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
