import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inline/colors/color_constant.dart';

class PersonalInformationScreen extends StatefulWidget {
  @override
  _PersonalInformationScreenState createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    'assets/images/profile-img.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
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
                      Container(
                        child: InkWell(
                          onTap: () {
                            print('save');
                          },
                          child: Text(
                            'Save',
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: myWhiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Container(
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
                          Icons.add_a_photo,
                          size: 32,
                          color: myWhiteColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(200),
      ),
      backgroundColor: myWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  'Edit my profile',
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: myBlackColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              inputField('Name'),
              inputField('Email'),
              SizedBox(
                height: 10,
              ),
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
                          child: Text('Change Password',
                              style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: myBlackColor)),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputField(hintText) {
    return Container(
      child: Column(
        children: <Widget>[
          TextFormField(
            // obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: myDarkGreyColor,
              ),
              border: InputBorder.none,
            ),
          ),
          Divider(
            color: myDarkGreyColor,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
