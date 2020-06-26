import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:inline/colors/color_constant.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: myWhiteColor,
      child: Center(
        child: SpinKitThreeBounce(
          color: myPrimaryColor,
          size: 50,
        ),
      ),
    );
  }
}
