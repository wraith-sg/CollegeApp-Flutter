import 'package:flutter/material.dart';
import 'package:piet/utilities/constants.dart';
import 'package:piet/screens/new_student/courses/cse.dart';
import 'package:piet/screens/new_student/courses/cseaiml.dart';
import 'package:piet/screens/new_student/courses/csedsai.dart';
import 'package:piet/screens/new_student/courses/csecs.dart';
import 'package:piet/screens/new_student/courses/csehons.dart';

class Courses extends StatefulWidget {
  _CoursesState createState() => new _CoursesState();
}

class _CoursesState extends State<Courses> {
    @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            'Courses',
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
              children: <Widget> [
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
                          MaterialPageRoute(builder: (context) => CSE()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.07,
                        alignment: Alignment.center,
                        child: Text('B.Tech. Computer Science', style: kLabelStyle,
                          textAlign: TextAlign.center,
                        ),
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
                          MaterialPageRoute(builder: (context) => CSEAIML()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.07,
                        alignment: Alignment.center,
                        child: Text('B.Tech. Computer Science in AI & ML',
                          style: kLabelStyle, textAlign: TextAlign.center,
                        ),
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
                          MaterialPageRoute(builder: (context) => CSEDSAI()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.07,
                        alignment: Alignment.center,
                        child: Text('B.Tech. Computer Science in AI & DS',
                          style: kLabelStyle, textAlign: TextAlign.center,
                        ),
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
                          MaterialPageRoute(builder: (context) => CSECS()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.07,
                        alignment: Alignment.center,
                        child: Text('B.Tech. Computer Science in Cyber Security',
                          style: kLabelStyle, textAlign: TextAlign.center,
                        ),
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
                          MaterialPageRoute(builder: (context) => CSEHONS()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.07,
                        alignment: Alignment.center,
                        child: Text('B.Tech. Hons. in Computer Science',
                          style: kLabelStyle, textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}