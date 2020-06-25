import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';
import 'package:inline/screens/queue/queue_screen.dart';

class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
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
                          color: myBlackColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Recent Queues',
                    style: GoogleFonts.nunito(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: myBlackColor),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(100),
      ),
      backgroundColor: myWhiteColor,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  queueCards(shopName: 'Simetri Coffee'),
                  queueCards(shopName: 'Adam Barber'),
                  queueCards(shopName: 'Mc Donald'),
                  queueCards(shopName: 'Mic & Mac'),
                  queueCards(shopName: 'Cragos'),
                  queueCards(shopName: 'Wineyard'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget queueCards({shopName}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QueueScreen()));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Container(
            height: 120,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: myLightColor),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/img-1.jpg',
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(shopName,
                                    style: GoogleFonts.openSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: myBlackColor)),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.yellow[400],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text('4',
                                        style: GoogleFonts.openSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: myBlackColor)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text('(32 visitors)',
                                        style: GoogleFonts.openSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: myBlackColor)),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text('3 visitor(s) at a time',
                                    style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: myPrimaryColor)),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Text('waiting',
                                    style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: myBlackColor)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, left: 40),
                                child: Text('14/25',
                                    style: GoogleFonts.openSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: myPrimaryColor)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 200,
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Convallis posuere morbi leo urna. Nec feugiat nisl pretium fusce id.',
                          style: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: myBlackColor),
                          maxLines: 2,
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
