import 'package:flutter/material.dart';
import 'package:inline/models/user.dart';
import 'package:inline/screens/authenticate/authenticate.dart';
import 'package:inline/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class Validator extends StatefulWidget {
  @override
  _ValidatorState createState() => _ValidatorState();
}

class _ValidatorState extends State<Validator> {
  @override
  Widget build(BuildContext context) {
    //access user data from provider
    //what stream to listen
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
