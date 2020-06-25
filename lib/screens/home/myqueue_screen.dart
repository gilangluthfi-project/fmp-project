import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';

class MyQueueScreen extends StatefulWidget {
  @override
  _MyQueueScreenState createState() => _MyQueueScreenState();
}

class _MyQueueScreenState extends State<MyQueueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: myWhiteColor, boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 0.5,
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(0, 1))
            ]),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My Queue',
                    style: GoogleFonts.nunito(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: myBlackColor),
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
                        onTap: () {
                          print("Clicked");
                        },
                        child: Icon(
                          Icons.notifications_none,
                          size: 32,
                          color: myBlackColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(100),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Current Queue',
                    style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: myBlackColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Cards
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20),
                          width: 40,
                          height: 40,
                          child: Icon(
                            Icons.history,
                            size: 32,
                            color: myBlackColor,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 20, right: 20),
                              child: Text('Thursday, 14/06/2020, 14.30',
                                  style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: myDarkGreyColor)),
                            ),
                            Container(
                              child: Text('Shop Name',
                                  style: GoogleFonts.openSans(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: myBlackColor)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: 128,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.amberAccent,
                              ),
                              child: Center(
                                child: Text('In Queue',
                                    style: GoogleFonts.openSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: myWhiteColor)),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(top: 15, left: 20, right: 20),
                              child: Text('No.',
                                  style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: myBlackColor)),
                            ),
                            Container(
                              child: Text('#0',
                                  style: GoogleFonts.openSans(
                                      fontSize: 56,
                                      fontWeight: FontWeight.w600,
                                      color: myPrimaryColor)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    'Completed Queues',
                    style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: myBlackColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    print("Clicked");
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.history,
                              size: 32,
                              color: myBlackColor,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 20, right: 20),
                                child: Text('Thursday, 14/06/2020, 14.30',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: myDarkGreyColor)),
                              ),
                              Container(
                                child: Text('Shop Name',
                                    style: GoogleFonts.openSans(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: myBlackColor)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                width: 128,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green,
                                ),
                                child: Center(
                                  child: Text('Completed',
                                      style: GoogleFonts.openSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: myWhiteColor)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
