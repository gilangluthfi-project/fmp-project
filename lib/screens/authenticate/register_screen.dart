import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';
import 'package:inline/screens/authenticate/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Global Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  //form variable
  String name;
  String email;
  String password;
  //error variable
  String error = '';

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
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  inputField(
                                      label: "Name",
                                      hintText: "input your name",
                                      keyboardType: TextInputType.text,
                                      valueStatus: (String value) {
                                        if (value.isEmpty) {
                                          return 'Name is required';
                                        }
                                        return null;
                                      },
                                      saveValue: (String value) {
                                        name = value;
                                      }),
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
                                        email = value;
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
                                  inputField(
                                      label: "Retype Password",
                                      hintText: "retype your password here",
                                      obscureText: true,
                                      valueStatus: (confirmPassword) {
                                        if (confirmPassword.isEmpty)
                                          return 'Enter confirm password';
                                        var password =
                                            _passKey.currentState.value;
                                        if (!equalsIgnoreCase(
                                            confirmPassword, password))
                                          return 'Confirm Password invalid';
                                        return null;
                                      },
                                      saveValue: (String value) {
                                        password = value;
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
                                        // navigateToHomePage(context);
                                        if (!_formKey.currentState.validate()) {
                                          return;
                                        }
                                        _formKey.currentState.save();
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
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Already have an account?',
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
                                            navigateToLoginScreen(context);
                                            //widget.toggleView();
                                          },
                                          child: Text(
                                            'Login',
                                            style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: myPrimaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
          ],
        ),
      ),
    );
  }
}

Future navigateToLoginScreen(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
        obscureText: obscureText,
        keyboardType: keyboardType,
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
