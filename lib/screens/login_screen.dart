// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';
import 'package:inline/screens/home_screen.dart';
import 'package:inline/screens/register_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';

// const List<String> assetNames = <String>[
//   'assets/inline-logo.svg',
// ];

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: myWhiteColor,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Image.asset(
                      'assets/images/inline-logo.png',
                      width: 150.0,
                      height: 150.0,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Login',
                          style: GoogleFonts.openSans(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: myBlackColor),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Text(
                          'Please sign in to continue',
                          style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: myDarkGreyColor),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: Column(
                          children: <Widget>[
                            inputField(
                                label: "Email", hintText: "your@email.com"),
                            inputField(
                                label: "Password",
                                hintText: "enter your password here",
                                obscureText: true),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 300,
                              height: 56,
                              child: FlatButton(
                                color: myPrimaryColor,
                                onPressed: () {
                                  navigateToHomePage(context);
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: myWhiteColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 300,
                              height: 56,
                              child: OutlineButton(
                                borderSide:
                                    BorderSide(color: myPrimaryColor, width: 2),
                                highlightedBorderColor: myPrimaryColor,
                                splashColor: Colors.deepOrange[100],
                                color: myWhiteColor,
                                onPressed: () {
                                  navigateToRegisterPage(context);
                                },
                                child: Text(
                                  "Register",
                                  style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: myPrimaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future navigateToHomePage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomeScreen()));
}

Future navigateToRegisterPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => RegisterScreen()));
}

Widget inputField({label, obscureText = false, hintText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: GoogleFonts.openSans(
            fontSize: 16, fontWeight: FontWeight.w600, color: myBlackColor),
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: myDarkGreyColor,
              fontStyle: FontStyle.italic),
          //contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: myDarkGreyColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange[200], width: 2)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: myDarkGreyColor, width: 2),
          ),
        ),
      ),
      SizedBox(
        height: 20,
      )
    ],
  );
}
