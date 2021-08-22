import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:personal_diary/app/diary/home_page.dart';
import 'package:personal_diary/app/intial_screens/login_screen.dart';
import 'package:personal_diary/components/home_icon.dart';
import 'package:personal_diary/components/navigation_link.dart';
import 'package:personal_diary/components/rounded_button.dart';
import 'package:personal_diary/services/email_auth_service.dart';
import 'package:personal_diary/utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String id = 'registerScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showSpinner = false;
  final emailAuthService = EmailAuthService();
  final _formKey = GlobalKey<FormState>();
  String? email, password, confirmPassword;
  bool _saveAttempted = false;

  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: _formKey,
          child: Material(
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
                        'REGISTER',
                        style: kLoginSignUpTextStyle,
                      ),
                    ),
                    kVerticalGap20,

                    // email
                    TextFormField(
                      validator: (emailValue) =>
                          emailAuthService.emailValidator(emailValue!),
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (emailValue) =>
                          setState(() => email = emailValue),
                      textAlign: TextAlign.center,
                      decoration: kFormInputDecoration.copyWith(
                          hintText: 'Enter Email'),
                    ),
                    kVerticalGap10,

                    // password
                    TextFormField(
                      validator: (passwordValue) =>
                          emailAuthService.passwordValidator(password ?? ''),
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      onChanged: (passwordValue) =>
                          setState(() => password = passwordValue),
                      textAlign: TextAlign.center,
                      decoration: kFormInputDecoration.copyWith(
                          hintText: 'Enter Password'),
                    ),
                    kVerticalGap10,

                    // confirm password
                    TextFormField(
                      validator: (pwConfirmValue) {
                        return emailAuthService.confimPasswordValidator(
                            password ?? '', pwConfirmValue!);
                      },
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      onChanged: (confirmpwValue) =>
                          setState(() => confirmPassword = confirmpwValue),
                      textAlign: TextAlign.center,
                      decoration: kFormInputDecoration.copyWith(
                          hintText: 'Confirm Password'),
                    ),

                    // submit button
                    kVerticalGap20,
                    RoundedButton(
                      color: Colors.red,
                      title: 'Sign Up',
                      onPressed: () async {
                        setState(() {
                          _saveAttempted = true;
                          showSpinner = true;
                        });

                        if (_formKey.currentState!.validate()) {
                          final result =
                              await emailAuthService.register(email, password);
                          if (result) {
                            setState(() => showSpinner = false);
                            Navigator.pushNamedAndRemoveUntil(
                                context, HomePage.id, (route) => false);
                          }
                          setState(() => showSpinner = false);
                        }

                        setState(() {
                          showSpinner = false;
                        });
                      },
                    ),

                    // link to login
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
      ),
    );
  }
}
