// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';
import 'package:inline/page_transitions/loading.dart';
import 'package:inline/screens/home/home_screen.dart';
import 'package:inline/services/auth.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  final Function toggel;
  LoginScreen(this.toggel);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //loading progress
  bool isLoading = false;

  //Global Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  //import auth service
  AuthService authService = new AuthService();

  //form variable
  String email;
  String password;

  //error variable
  String error = '';

  //text controller
  TextEditingController userEmailTextConroller = new TextEditingController();
  TextEditingController userPasswordTextConroller = new TextEditingController();

  loginUser() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      dynamic result = await authService.userSignIn(
          userEmailTextConroller.text, userPasswordTextConroller.text);
      if (result == null) {
        setState(() {
          error = 'Invalid email or password, please try again';
          isLoading = false;
        });
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      // authService
      //     .userSignUp(
      //         userEmailTextConroller.text, userPasswordTextConroller.text);
      // setState(() {
      //   isLoading = true;
      // });
      // isLoading ?
      //     Container(
      //         child: Center(
      //           child: CircularProgressIndicator(),
      //         ),
      //       )
      //     :
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
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
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    inputField(
                                        label: "Email",
                                        hintText: "your@email.com",
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controllerName: userEmailTextConroller,
                                        valueStatus: (String value) {
                                          if (value.isEmpty) {
                                            return 'Email is required';
                                          }
                                          if (!RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value)) {
                                            return 'Please input a valid email';
                                          }
                                          return null;
                                        },
                                        saveValue: (String value) {
                                          email = value;
                                        }),
                                    inputField(
                                        formFieldKey: _passKey,
                                        label: "Password",
                                        hintText: "enter your password here",
                                        obscureText: true,
                                        controllerName:
                                            userPasswordTextConroller,
                                        valueStatus: (value) {
                                          if (value.isEmpty)
                                            return 'Please Enter password';
                                          if (value.length < 8)
                                            return 'Password should be more than 8 characters';
                                          return null;
                                        }),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                        error,
                                        style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.red[600]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      width: 300,
                                      height: 56,
                                      child: FlatButton(
                                        color: myPrimaryColor,
                                        onPressed: () {
                                          loginUser();
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
                                      height: 50,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Join us and create an account?',
                                            style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: myBlackColor),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              widget.toggel();
                                            },
                                            child: Text(
                                              'Signup',
                                              style: GoogleFonts.openSans(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: myPrimaryColor),
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

Widget inputField({
  label,
  obscureText = false,
  hintText,
  formFieldKey,
  valueStatus,
  saveValue,
  keyboardType,
  controllerName,
}) {
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
        key: formFieldKey,
        validator: valueStatus,
        onSaved: saveValue,
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controllerName,
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
