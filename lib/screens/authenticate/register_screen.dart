import 'package:flutter/material.dart';
import 'package:inline/page_transitions/loading.dart';
import 'package:inline/screens/home/home_screen.dart';
import 'package:inline/services/auth.dart';
import 'package:inline/services/database.dart';
import 'package:quiver/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggel;
  RegisterScreen(this.toggel);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //loading progress
  bool isLoading = false;

  //import auth service
  AuthService authService = new AuthService();
  DatabaseService databaseService = new DatabaseService();

  //Global Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  //form variable
  String name;
  String email;
  String password;
  //error variable
  String error = '';

  //text controller
  TextEditingController userNameTextConroller = new TextEditingController();
  TextEditingController userEmailTextConroller = new TextEditingController();
  TextEditingController userPasswordTextConroller = new TextEditingController();

  registerUser() async {
    if (_formKey.currentState.validate()) {
      // Map<String, String> userInfoMap = {
      //   "name": userNameTextConroller.text,
      //   "email": userEmailTextConroller.text
      // };
      setState(() {
        isLoading = true;
      });
      databaseService.updateUserData(
          userNameTextConroller.text, userEmailTextConroller.text);
      //databaseService.uploadUserInfo(userInfoMap);
      dynamic result = await authService.userSignUp(
          userEmailTextConroller.text, userPasswordTextConroller.text);
      if (result == null) {
        setState(() {
          error = 'This email address is already use by another account';
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
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
                                          controllerName: userNameTextConroller,
                                          valueStatus: (String value) {
                                            if (value.isEmpty) {
                                              return 'Name is required';
                                            }
                                            return null;
                                          },
                                          // saveValue: (String value) {
                                          //   name = value;
                                          // },
                                        ),
                                        inputField(
                                          label: "Email",
                                          hintText: "your@email.com",
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controllerName:
                                              userEmailTextConroller,
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
                                          // saveValue: (String value) {
                                          //   email = value;
                                          // },
                                        ),
                                        inputField(
                                            formFieldKey: _passKey,
                                            label: "Password",
                                            hintText:
                                                "enter your password here",
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
                                          controllerName:
                                              userPasswordTextConroller,
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
                                          // saveValue: (String value) {
                                          //   password = value;
                                          // },
                                        ),
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
                                              registerUser();
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
                                                  widget.toggel();
                                                },
                                                child: Text(
                                                  'Login',
                                                  style: GoogleFonts.openSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: myPrimaryColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 80,
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

// Future navigateToLoginScreen(context) async {
//   Navigator.push(
//       context, MaterialPageRoute(builder: (context) => LoginScreen()));
// }

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
        obscureText: obscureText,
        keyboardType: keyboardType,
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
