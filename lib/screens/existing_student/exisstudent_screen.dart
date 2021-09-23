import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piet/screens/existing_student/barcodescan.dart';
import 'package:piet/screens/existing_student/news.dart';
import 'package:piet/screens/existing_student/syllabus.dart';
import 'package:piet/screens/existing_student/placements.dart';
import 'package:piet/utilities/constants.dart';
import 'package:piet/screens/existing_student/feedback.dart';
import 'package:piet/screens/existing_student/timetable.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExisStudentScreen extends StatefulWidget {
  _ExisStudentScreenState createState() => new _ExisStudentScreenState();
}

class _ExisStudentScreenState extends State<ExisStudentScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  signOut() async {
    await _auth.signOut();
    Navigator.of(context, rootNavigator: true).pop(context);
  }

  Widget _buildCarousel() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.black),
      child: SizedBox(
        child: Carousel(
          boxFit: BoxFit.fitWidth,
          dotSize: 4,
          dotSpacing: 15,
          showIndicator: true,
          indicatorBgPadding: 2.5,
          dotIncreasedColor: Colors.white,
          dotColor: Colors.white,
          dotPosition: DotPosition.bottomCenter,
          dotBgColor: Colors.transparent,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(seconds: 2),
          images: [
            ExactAssetImage('assets/images/1.jpg'),
            ExactAssetImage('assets/images/2.jpg'),
            ExactAssetImage('assets/images/3.jpg'),
            ExactAssetImage('assets/images/4.jpg'),
            ExactAssetImage('assets/images/5.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return Container(
      padding: EdgeInsets.only(top: 35.0),
      child: Column(
        children: <Widget>[
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              // SizedBox(height: 25),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 35.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 8.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFA97BD5),
                        Color(0XFF8340C2),
                      ],
                      stops: [0.1, 0.6],
                    ),
                  ),
                  child: InkWell(
                    splashColor: Colors.black12.withAlpha(10),
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TimeTable()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.365,
                      height: MediaQuery.of(context).size.height * 0.185,
                      alignment: Alignment.center,
                      child: Text('Time Table', style: kLabelStyle),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 35.0, bottom: 35.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 8.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFA97BD5),
                        Color(0XFF8340C2),
                      ],
                      stops: [0.1, 0.6],
                    ),
                  ),
                  child: InkWell(
                    splashColor: Colors.black12.withAlpha(10),
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Syllabus()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.365,
                      height: MediaQuery.of(context).size.height * 0.185,
                      alignment: Alignment.center,
                      child: Text('Syllabus', style: kLabelStyle),
                    ),
                  ),
                ),
              ),
            ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 35.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 8.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFA97BD5),
                        Color(0XFF8340C2),
                      ],
                      stops: [0.1, 0.6],
                    ),
                  ),
                  child: InkWell(
                    splashColor: Colors.black12.withAlpha(10),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BarcodeScanner()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.365,
                      height: MediaQuery.of(context).size.height * 0.185,
                      alignment: Alignment.center,
                      child: Text('Fees Details', style: kLabelStyle),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 35.0, bottom: 35.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 8.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFA97BD5),
                        Color(0XFF8340C2),
                      ],
                      stops: [0.1, 0.6],
                    ),
                  ),
                  child: InkWell(
                    splashColor: Colors.black12.withAlpha(10),
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => News()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.365,
                      height: MediaQuery.of(context).size.height * 0.185,
                      alignment: Alignment.center,
                      child: Text('News', style: kLabelStyle),
                    ),
                  ),
                ),
              ),
            ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 35.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 8.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFA97BD5),
                        Color(0XFF8340C2),
                      ],
                      stops: [0.1, 0.6],
                    ),
                  ),
                  child: InkWell(
                    splashColor: Colors.black12.withAlpha(10),
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Placements()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.365,
                      height: MediaQuery.of(context).size.height * 0.185,
                      alignment: Alignment.center,
                      child: Text('Placements', style: kLabelStyle),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left:35.0, bottom: 35.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 8.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFA97BD5),
                        Color(0XFF8340C2),
                      ],
                      stops: [0.1, 0.6],
                    ),
                  ),
                  child: InkWell(
                    splashColor: Colors.black12.withAlpha(10),
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FeedbackForm()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.365,
                      height: MediaQuery.of(context).size.height * 0.185,
                      alignment: Alignment.center,
                      child: Text('Feedback', style: kLabelStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ]
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            title: Text(
              ' \nWelcome',
              style: TextStyle(
                letterSpacing: 1.5,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
            actions: <Widget>[
              IconButton(
                  padding: EdgeInsets.only(right: 15, top: 25),
                  icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                  ),
                  onPressed: () {
                    signOut();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('You have been signed out successfully')));
                  }
              ),
            ]
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                    children: <Widget>[
                      Container(
                        height: size.height,
                        width: size.width,
                        color: Colors.white,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.18,
                        left: 0,
                        child: Image.asset(
                          "assets/images/auth/new_topl.png",
                          width: size.width * 0.3,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Image.asset(
                          "assets/images/auth/new_bottoml.png",
                          width: size.width * 0.25,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.18,
                        right: 0,
                        child: Image.asset(
                          "assets/images/auth/new_topr.png",
                          width: size.width * 0.3,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          "assets/images/auth/new_bottomr.png",
                          width: size.width * 0.4,
                        ),
                      ),
                      Container(
                        // color: Colors.white,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                              _buildGrid(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            _buildCarousel(),
                          ],
                        ),
                      ),
                    ]
                ),
            ),
        ),
    );
  }
}
