import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:personal_diary/app/diary/home_page.dart';
import 'package:personal_diary/app/intial_screens/login_screen.dart';
import 'package:personal_diary/app/intial_screens/register_screen.dart';
import 'package:personal_diary/components/home_icon.dart';
import 'package:personal_diary/components/navigation_link.dart';
import 'package:personal_diary/components/rounded_button.dart';
import 'package:personal_diary/services/google_signin_services.dart';
import 'package:personal_diary/utils/constants.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);
  static String id = 'auth_screen';

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool showSpinner = false;
  final googleService = GoogleSignInService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          decoration: kDecorationBox,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
          child: SafeArea(
            child: Center(
              child: ListView(
                children: [
                  //

                  const HomeIcon(
                    iconsize: 160.0,
                  ),

                  RoundedButton(
                    icon: FontAwesomeIcons.google,
                    color: Colors.red,
                    title: 'Continue  with Google',
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await googleService.login();

                        if (user != null) {
                          Navigator.pushReplacementNamed(context, HomePage.id);
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (error) {
                        setState(() {
                          showSpinner = false;
                        });
                      }
                    },
                  ),

                  //

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
      ),
    );
  }
}
