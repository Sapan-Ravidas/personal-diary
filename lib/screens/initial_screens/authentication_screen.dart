import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_diary/components/home_icon.dart';
import 'package:personal_diary/components/navigation_link.dart';
import 'package:personal_diary/components/rounded_button.dart';
import 'package:personal_diary/screens/initial_screens/login_screen.dart';
import 'package:personal_diary/screens/initial_screens/register_screen.dart';
import 'package:personal_diary/utils/constants.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);
  static String id = 'auth_screen';

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kDecorationBox,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 45.0, horizontal: 30.0),
          child: Center(
            child: Column(
              children: [
                //

                HomeIcon(
                  iconsize: 160.0,
                ),

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
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                ),

                //

                kVerticalGap20,

                NavigationLink(
                  helpText: 'Already have an Account?',
                  linktext: 'LOGIN',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
