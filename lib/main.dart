import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inline/models/user.dart';
import 'package:inline/screens/validator.dart';
import 'package:inline/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xffd86a5a),
    ));
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Validator(),
      ),
    );
  }
}
