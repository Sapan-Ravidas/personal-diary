import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:personal_diary/components/home_icon.dart';
import 'package:personal_diary/components/navigation_link.dart';
import 'package:personal_diary/components/rounded_button.dart';
import 'package:personal_diary/screens/login_screen.dart';
import 'package:personal_diary/utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String id = 'registerScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showSpinner = false;

  // ---------------------------------------------------------------------------
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
                    'REGISTER',
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
                kVerticalGap10,

                //

                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {},
                  textAlign: TextAlign.center,
                  decoration: kFormInputDecoration.copyWith(
                      hintText: 'Confirm Password'),
                ),

                kVerticalGap20,
                RoundedButton(
                  color: Colors.red,
                  title: 'Sign Up',
                  onPressed: () {},
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
