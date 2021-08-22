import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:personal_diary/app/diary/home_page.dart';
import 'package:personal_diary/app/intial_screens/register_screen.dart';
import 'package:personal_diary/components/home_icon.dart';
import 'package:personal_diary/components/navigation_link.dart';
import 'package:personal_diary/components/rounded_button.dart';
import 'package:personal_diary/services/email_auth_service.dart';
import 'package:personal_diary/utils/constants.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;
  bool _saveAttempted = false;
  bool _showSpinner = false;
  final _formKey = GlobalKey<FormState>();
  final emailAuthService = EmailAuthService();

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Material(
          child: Form(
            key: _formKey,
            child: Container(
              decoration: kDecorationBox,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 30.0),
                child: ListView(
                  children: [
                    const HomeIcon(iconsize: 60.0),
                    kVerticalGap30,

                    //
                    const Center(
                      child: Text(
                        'LOGIN',
                        style: kLoginSignUpTextStyle,
                      ),
                    ),
                    kVerticalGap20,

                    // email
                    TextFormField(
                      validator: (emailValue) =>
                          emailAuthService.emailValidator(emailValue!),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => setState(() => email = value),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      decoration: kFormInputDecoration.copyWith(
                          hintText: 'Enter Email'),
                    ),
                    kVerticalGap10,

                    // password
                    TextFormField(
                      validator: (value) =>
                          emailAuthService.passwordValidator(value!),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      onChanged: (value) => setState(() => password = value),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                      decoration: kFormInputDecoration.copyWith(
                          hintText: 'Enter Password'),
                    ),

                    // submit button
                    kVerticalGap20,
                    RoundedButton(
                      color: Colors.red,
                      title: 'Sign In',
                      onPressed: () async {
                        setState(() {
                          _saveAttempted = true;
                        });

                        if (_formKey.currentState!.validate()) {
                          final result =
                              await emailAuthService.login(email, password);

                          setState(() {
                            _showSpinner = false;
                            _saveAttempted = true;
                          });

                          if (result) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, HomePage.id, (route) => false);
                          }
                        }
                      },
                    ),

                    // link to signup
                    kVerticalGap20,
                    NavigationLink(
                      helpText: 'Need an Account?',
                      linktext: 'SIGN-UP',
                      onPressed: () =>
                          Navigator.pushNamed(context, RegisterScreen.id),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
