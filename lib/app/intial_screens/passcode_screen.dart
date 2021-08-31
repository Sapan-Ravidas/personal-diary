import 'package:flutter/material.dart';
import 'package:personal_diary/app/intial_screens/fingerprint_authentication_screen.dart';
import 'package:personal_diary/app/intial_screens/numpad.dart';
import 'package:personal_diary/app/intial_screens/splash_screen.dart';
import 'package:personal_diary/services/shared_pref_service.dart';
import 'package:personal_diary/utils/constants.dart';
import 'package:flutter/services.dart';

class LockScreen extends StatefulWidget {
  String validPin;
  String pref;
  bool biometric;

  LockScreen(
      {required this.validPin, required this.pref, required this.biometric});

  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  String code = "";
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      '$message',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF818181),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildCodeNumberBox(
                            code.length > 0 ? code.substring(0, 1) : ""),
                        buildCodeNumberBox(
                            code.length > 1 ? code.substring(1, 2) : ""),
                        buildCodeNumberBox(
                            code.length > 2 ? code.substring(2, 3) : ""),
                        buildCodeNumberBox(
                            code.length > 3 ? code.substring(3, 4) : ""),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        print('widget biometric check ${widget.biometric}');
                        if (widget.validPin == '') {
                          await storageService.write('pin', code);

                          widget.biometric
                              ? Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FingerPrintAuthenticationScreen(
                                              pref: widget.pref)))
                              : Navigator.pushReplacementNamed(
                                  context, SplashScreen.id);
                        } else {
                          if (widget.validPin == code) {
                            if (widget.pref == 'false') {
                              Navigator.pushReplacementNamed(
                                  context, SplashScreen.id);
                            } else {
                              widget.biometric
                                  ? Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FingerPrintAuthenticationScreen(
                                                  pref: widget.pref)))
                                  : Navigator.pushReplacementNamed(
                                      context, SplashScreen.id);
                            }
                          } else {
                            setState(() {
                              message = 'Invalid Pincode';
                            });
                          }
                        }
                      },
                      child: Container(
                        decoration: kDecorationBox.copyWith(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0))),
                        child: Center(
                          child: Text(
                            widget.validPin != ''
                                ? 'Verify Pin'
                                : 'Generate Pin',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          NumPad(
            onNumberSelected: (value) {
              print(value);
              setState(() {
                if (value != -1) {
                  if (code.length < 4) {
                    code = code + value.toString();
                  }
                } else {
                  code = code.substring(0, code.length - 1);
                }
                print(code);
              });
            },
          ),
        ],
      )),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
