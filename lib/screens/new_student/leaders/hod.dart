import 'package:flutter/material.dart';

class HOD extends StatefulWidget {
  _HODState createState() => new _HODState();
}

class _HODState extends State<HOD> {


  Widget _buildHODText() {
    return Container(
      child: Column(
          children: <Widget>[
            Container(
              child: Container(
                height: 225,
                width: 175,
                child: Image(
                  filterQuality: FilterQuality.high,
                  alignment: Alignment.center,
                  image: AssetImage('assets/images/leaders/hod.jpg',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text('S.C. Gupta', textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Text(
                'It gives me immense pleasure to lead the department of CSE.'
                ' Our College is one of the premier institution , unique like a'
                ' prism reflecting the manifold shades of learning and co-curricular'
                ' activities.\n\nThe very motto of our department is to provide'
                ' quality education. The process of learning is extremely important'
                ' in life. What you learn, how you learn and where you learn play'
                ' a crucial role in developing ones intellectual capability,'
                ' besides career. Hence on behalf of our Computer Science and'
                ' Engineering, I welcome you all to CSE Deptt, PIET. Along with'
                ' academic knowledge CSE also trains its Engineers to face the'
                ' challenges in life by providing many value added courses to '
                'enhance their career prospects. The excellent infrastructure,'
                ' teaching faculty of the best kind ensuring quality education'
                ' such as interaction among students, parents and staff, along'
                ' with a Training and Placement Cell ensures a bright future to'
                ' its students. Thus, we are confident that our Engineers will'
                ' emerge as assets not only to this institution and to the'
                ' organization they belong, but also to the country at large.\n\n'
                'I, Congratulate the team of faculty members and the students'
                ' for their brilliant and original efforts. I wish all the'
                ' Students and Faculty a great academic career.\n\nDr. S. C. Gupta'
                '\nHOD of CSE.\n', textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
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
            'Head of Department',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            _buildHODText(),
          ],
        ),
      ),
    );
  }
}