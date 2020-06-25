import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';
import 'package:inline/page_transitions/slide_transition.dart';
import 'package:inline/screens/home/profile_screen.dart';
import 'package:inline/screens/queue/queue_screen.dart';
import 'package:inline/screens/queue/recent_screen.dart';
import 'package:inline/screens/queue/top_screen.dart';

import 'myqueue_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomeScreenBody();
      case 1:
        return MyQueueScreen();
      case 2:
        return ProfileScreen();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue),
            title: Text('My Queue'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
        ],
        iconSize: 28,
        selectedItemColor: Color(0xfff27360),
        unselectedItemColor: Color(0xff36374c),
      ),
      backgroundColor: Colors.white,
      body: callPage(_currentIndex),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hi, Name',
                        style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: myPrimaryColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Where are you going today?',
                        style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: myBlackColor),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: myWhiteColor,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/profile-img.jpg',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: myLightColor),
              child: Stack(
                children: <Widget>[
                  TextField(
                    maxLengthEnforced: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        border: InputBorder.none,
                        hintText: 'Search here...',
                        hintStyle: GoogleFonts.openSans(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: myBlueGreyColor,
                        )),
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: myBlackColor),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: myPrimaryColor),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            print("Search");
                          },
                          borderRadius: BorderRadius.circular(10),
                          splashColor: Colors.deepOrange[600],
                          child: Center(
                            child: Icon(
                              Icons.search,
                              color: myWhiteColor,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 70, right: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: myBackgroundColor),
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    SlideLeftRoute(page: RecentScreen()));
                              },
                              borderRadius: BorderRadius.circular(10),
                              splashColor: Colors.deepOrange[100],
                              child: Center(
                                child: Icon(
                                  Icons.access_time,
                                  size: 32,
                                  color: myPrimaryColor,
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Recent',
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: myPrimaryColor),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: myBackgroundColor),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, SlideLeftRoute(page: TopScreen()));
                            },
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Colors.deepOrange[100],
                            child: Center(
                              child: Icon(
                                Icons.whatshot,
                                size: 32,
                                color: myPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Top',
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: myPrimaryColor),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: myBackgroundColor),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              print("Clicked");
                            },
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Colors.deepOrange[100],
                            child: Center(
                              child: Icon(
                                Icons.favorite_border,
                                size: 32,
                                color: myPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Favourite',
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: myPrimaryColor),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: myBackgroundColor),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              print("Clicked");
                            },
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Colors.deepOrange[100],
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 36,
                                color: myPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Add',
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: myPrimaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Headline',
                style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: myBlackColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 156,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: myWhiteColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/img-2.jpg',
                  ),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Always remember to stay 2 meters apart from each other.',
                style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: myDarkGreyColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Top Queues',
                style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: myBlackColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 10, bottom: 30),
              //padding: EdgeInsets.only(right: 10),
              height: 210,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  topCard(context, 'Name 1', 'assets/images/img-1.jpg'),
                  topCard(context, 'Name 2', 'assets/images/img-2.jpg'),
                  topCard(context, 'Name 3', 'assets/images/img-1.jpg'),
                  topCard(context, 'Name 4', 'assets/images/img-2.jpg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topCard(BuildContext context, shopName, imagePath) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QueueScreen()));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 1,
          child: Container(
            width: 156,
            child: Column(
              children: <Widget>[
                Container(
                  width: 156,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: myLightColor,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        imagePath,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(shopName,
                              style: GoogleFonts.openSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: myBlackColor)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text('waiting :',
                                  style: GoogleFonts.openSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: myBlackColor)),
                            ),
                            Container(
                              child: Text('14/25',
                                  style: GoogleFonts.openSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: myPrimaryColor)),
                            ),
                          ],
                        )
                      ],
                    ),
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
