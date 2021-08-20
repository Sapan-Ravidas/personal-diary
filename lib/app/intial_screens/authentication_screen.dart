import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_diary/app/diary/home_page.dart';
import 'package:personal_diary/app/intial_screens/login_screen.dart';
import 'package:personal_diary/app/intial_screens/register_screen.dart';
import 'package:personal_diary/components/home_icon.dart';
import 'package:personal_diary/components/navigation_link.dart';
import 'package:personal_diary/components/rounded_button.dart';
import 'package:personal_diary/providers/google_signin_providers.dart';

import 'package:personal_diary/utils/constants.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);
  static String id = 'auth_screen';

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  Widget buildLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final googleProvider = Provider.of<GoogleSignInProvider>(context);
            if (googleProvider.isSigningIn) {
              return buildLoading();
            } else if (snapshot.hasData) {
              // TODO: This will lead us to Home Page of the diary App
              return HomePage();
            } else {
              return AuthWidget();
            }
          },
        ),
      ),
    );
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    Key? key,
  }) : super(key: key);

  void googleSignIn(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.login();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kDecorationBox,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 30.0),
          child: Center(
            child: Column(
              children: [
                //

                const HomeIcon(
                  iconsize: 160.0,
                ),

                RoundedButton(
                  icon: FontAwesomeIcons.google,
                  color: Colors.red,
                  title: 'Continue  with Google',
                  onPressed: () => googleSignIn(context),
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
