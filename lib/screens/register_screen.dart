import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';
import 'package:inline/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myWhiteColor,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
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
                              'Create Account',
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
                              'Please create your account',
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
                                inputField(
                                    label: "Retype Password",
                                    hintText: "retype your password here",
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
                                      "Sign up",
                                      style: GoogleFonts.openSans(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: myWhiteColor),
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
          ],
        ),
      ),
    );
  }
}

Future navigateToHomePage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
      TextField(
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
