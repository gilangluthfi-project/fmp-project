import 'package:flutter/material.dart';
import 'package:inline/screens/authenticate/login_screen.dart';
import 'package:inline/screens/authenticate/register_screen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  //toggle condition
  bool showLoginScreen = true;

  void toggleView() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(toggleView);
    } else {
      return RegisterScreen(toggleView);
    }
  }
}
