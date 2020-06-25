import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';
import 'package:inline/page_transitions/slide_transition.dart';
import 'package:inline/screens/queue/inqueue_screen.dart';

class QueueScreen extends StatefulWidget {
  @override
  _QueueScreenState createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            height: 200,
            decoration: BoxDecoration(color: myLightColor, boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 0.5,
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(0, 1))
            ]),
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/img-2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        child: Material(
                          shape: CircleBorder(),
                          color: Colors.transparent,
                          child: InkWell(
                            customBorder: CircleBorder(),
                            splashColor: Colors.deepOrange[100],
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 32,
                              color: myWhiteColor,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            child: Material(
                              shape: CircleBorder(),
                              color: Colors.transparent,
                              child: InkWell(
                                customBorder: CircleBorder(),
                                splashColor: Colors.deepOrange[100],
                                onTap: () {},
                                child: Icon(
                                  Icons.share,
                                  size: 32,
                                  color: myWhiteColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            child: Material(
                              shape: CircleBorder(),
                              color: Colors.transparent,
                              child: InkWell(
                                customBorder: CircleBorder(),
                                splashColor: Colors.deepOrange[100],
                                onTap: () {},
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 32,
                                  color: myWhiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(200),
      ),
      backgroundColor: myWhiteColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                'Shop Name',
                style: GoogleFonts.openSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: myBlackColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.star,
                    size: 28,
                    color: Colors.yellow[400],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text('4',
                      style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: myBlueGreyColor)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text('(32 visitors)',
                      style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: myBlueGreyColor)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 146,
              width: double.infinity,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: myBlackColor),
                maxLines: 10,
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Customer(s) Queue :',
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: myBlackColor),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 280,
                child: Text(
                  'This place only allows for 5 customer(s) at a time, with a max queue size of 40. ',
                  style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: myBlackColor),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Center(
                child: Text(
                  'Waiting',
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: myBlackColor),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Center(
                child: Text(
                  '34/40',
                  style: GoogleFonts.openSans(
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      color: myPrimaryColor),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 300,
                height: 56,
                child: FlatButton(
                  color: myPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                        context, SlideLeftRoute(page: InQueueScreen()));
                  },
                  child: Text(
                    "Join Queue",
                    style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: myWhiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
