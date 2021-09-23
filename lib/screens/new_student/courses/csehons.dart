import 'package:flutter/material.dart';

class CSEHONS extends StatefulWidget {
  _CSEHONSState createState() => new _CSEHONSState();
}

class _CSEHONSState extends State<CSEHONS> {


  Widget _buildCSEHONSText() {
    return Container(
      child: Column(
          children: <Widget>[
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                bottom: 5,
                right: 10,// Space between underline and text
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0, // Underline thickness
                  ))
              ),
              child: Text(
                "B.Tech. Hons. in Computer Science & Engineering", textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Text(
                'PIET has introduced the AICTE approved B.Tech (Honors) program'
    ' in Computer Science Engineering. The B.Tech ( Honors) program at PIET'
    ' offers the  student a unique opportunity to specialize in a field of'
    ' interest in addition to the core Engineering program one pursues. \n\nIt'
    ' gives a special opportunity for student to get a major degree in Computer'
    ' Science Engineering and a minor degree in one of the following'
    ' specialization: \n\n1. Blockchain \n2. IOT \n3. AR-VR\n', textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            '  About This Programme',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            _buildCSEHONSText(),
          ],
        ),
      ),
    );
  }
}