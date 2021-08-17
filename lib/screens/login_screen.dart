import 'package:flutter/material.dart';
import 'package:personal_diary/components/home_icon.dart';
import 'package:personal_diary/components/navigation_link.dart';
import 'package:personal_diary/components/rounded_button.dart';
import 'package:personal_diary/screens/register_screen.dart';
import 'package:personal_diary/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Container(
          decoration: kDecorationBox,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
            child: ListView(
              children: [
                HomeIcon(iconsize: 60.0),
                kVerticalGap30,

                //

                Center(
                  child: Text(
                    'LOGIN',
                    style: kLoginSignUpTextStyle,
                  ),
                ),
                kVerticalGap20,

                //

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {},
                  textAlign: TextAlign.center,
                  decoration:
                      kFormInputDecoration.copyWith(hintText: 'Enter Email'),
                ),
                kVerticalGap10,

                //

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {},
                  textAlign: TextAlign.center,
                  decoration:
                      kFormInputDecoration.copyWith(hintText: 'Enter Password'),
                ),

                //

                kVerticalGap20,
                RoundedButton(
                  color: Colors.red,
                  title: 'Sign In',
                  onPressed: () {},
                ),

                //
                kVerticalGap20,
                NavigationLink(
                  helpText: 'Need an Account?',
                  linktext: 'SIGN-UP',
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
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
