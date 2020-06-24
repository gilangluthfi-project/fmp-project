import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';
import 'package:inline/screens/personal_information_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: myLightColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/profile-img.jpg',
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        'Name of user',
                        style: GoogleFonts.nunito(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: myBlackColor),
                      ))
                ],
              ),
            ),
          )),
          preferredSize: Size.fromHeight(120)),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Account Setting',
                    style: GoogleFonts.nunito(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: myBlackColor),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Personal Info
                profileTile(Icons.account_circle, 'Personal Information',
                    PersonalInformationScreen()),
                //Payment
                profileTile(Icons.payment, 'Payments', null),
                //Notifications
                profileTile(Icons.notifications, 'Notifications', null),
                //Favourite Place
                profileTile(Icons.favorite, 'Favourite Place', null),
                SizedBox(
                  height: 20,
                ),
                //Logout
                Container(
                  height: 58,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: myWhiteColor,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        print("Clicked");
                      },
                      splashColor: Colors.deepOrange[100],
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 0, right: 10),
                            child: Text('Log out',
                                style: GoogleFonts.nunito(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: myBlackColor)),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget profileTile(icon, textProperty, navigatorButton) {
    return Container(
      height: 58,
      width: double.infinity,
      decoration: BoxDecoration(
        color: myWhiteColor,
        border: Border(
          bottom:
              BorderSide(width: 1.0, color: myDarkGreyColor.withOpacity(0.5)),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => navigatorButton));
          },
          splashColor: Colors.deepOrange[100],
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 0, right: 10),
                child: Icon(icon, size: 32, color: myBlackColor),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Text(textProperty,
                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: myBlackColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
