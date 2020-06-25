// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';
import 'package:inline/screens/authenticate/register_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Global Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  //form variable
  String _email;
  String _password;

  //error variable
  String error = '';

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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              inputField(
                                  label: "Email",
                                  hintText: "your@email.com",
                                  keyboardType: TextInputType.emailAddress,
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
                                    _email = value;
                                  }),
                              inputField(
                                  formFieldKey: _passKey,
                                  label: "Password",
                                  hintText: "enter your password here",
                                  obscureText: true,
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
                                height: 20,
                              ),
                              Container(
                                width: 300,
                                height: 56,
                                child: FlatButton(
                                  color: myPrimaryColor,
                                  onPressed: () {
                                    if (!_formKey.currentState.validate()) {
                                      return;
                                    }
                                    _formKey.currentState.save();

                                    print(_email);
                                    print(_password);
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        //widget.toggleView();
                                        navigateToRegisterScreen(context);
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

Future navigateToRegisterScreen(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => RegisterScreen()));
}

Widget inputField(
    {label,
    obscureText = false,
    hintText,
    formFieldKey,
    valueStatus,
    saveValue,
    keyboardType}) {
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
