import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_diary/components/home_icon.dart';
import 'package:personal_diary/components/rounded_button.dart';
import 'package:personal_diary/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
          child: Center(
            child: Column(
              children: [
                //

                HomeIcon(),
                RoundedButton(
                  icon: FontAwesomeIcons.google,
                  color: Colors.red,
                  title: 'Continue  with Google',
                  onPressed: () {},
                ),

                //

                RoundedButton(
                    icon: FontAwesomeIcons.facebookF,
                    color: Colors.red,
                    title: 'Continue with Facebook',
                    onPressed: () {}),

                RoundedButton(
                  color: Colors.red,
                  title: 'Sign Up',
                  onPressed: () {},
                ),

                //

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Alredy have an account?',
                      style: kMessageStyles,
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      'LOGIN',
                      style: kMessageStyles.copyWith(
                        color: Colors.yellowAccent,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
