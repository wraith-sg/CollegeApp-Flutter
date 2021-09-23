import 'package:flutter/material.dart';
import 'package:piet/screens/new_student/leaders/founder.dart';
import 'package:piet/screens/new_student/leaders/secretary.dart';
import 'package:piet/screens/new_student/leaders/director.dart';
import 'package:piet/screens/new_student/leaders/hod.dart';
import 'package:piet/utilities/constants.dart';

class Leaders extends StatefulWidget {
  _LeadersState createState() => new _LeadersState();
}

class _LeadersState extends State<Leaders> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            'Message from Leaders',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width,
              color: Colors.white,
            ),
            Positioned(
              top: 0,
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
              top: 0,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget> [
                Container(
                  alignment: Alignment.center,
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
                          MaterialPageRoute(builder: (context) => Founder()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.07,
                        alignment: Alignment.center,
                        child: Text('Founder & Chairman', style: kLabelStyle),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 15),
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
                          MaterialPageRoute(builder: (context) => Secretary()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.07,
                        alignment: Alignment.center,
                        child: Text('Secretary', style: kLabelStyle),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 15),
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
                          MaterialPageRoute(builder: (context) => Director()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.07,
                        alignment: Alignment.center,
                        child: Text('Director', style: kLabelStyle),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 15),
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
                          MaterialPageRoute(builder: (context) => HOD()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.07,
                        alignment: Alignment.center,
                        child: Text('Head of Department (CSE)', style: kLabelStyle),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}