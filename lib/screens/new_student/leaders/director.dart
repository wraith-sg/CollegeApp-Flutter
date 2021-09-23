import 'package:flutter/material.dart';

class Director extends StatefulWidget {
  _DirectorState createState() => new _DirectorState();
}

class _DirectorState extends State<Director> {


  Widget _buildDirectorText() {
    return Container(
      child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Image(
                  filterQuality: FilterQuality.high,
                  alignment: Alignment.center,
                  image: AssetImage('assets/images/leaders/director.jpg',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text('Shakti Kumar', textAlign: TextAlign.center,
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
                'Right from its inception in 2006, Panipat Institute of'
                ' Engineering and Technology is on its fast track of growth and'
                ' academic contribution. PIET is one of those few institutions'
                ' of higher learning which have established themselves and surged'
                ' ahead purely due to their crystal clear vision, mission and'
                ' commitment of the staff ensuring that we continue to shape our'
                ' students to a higher quality professionals, who'
                ' are competent in their chosen field, follow morals and ethics'
                ' and contribute to the development of our society through their'
                ' profession. \n\nTwenty first century is the century of knowledge'
                ' driven industry. A competent, confident and vast knowledge force'
                ' is the most sought after propeller needed for the social growth.'
                ' PIET has been a very vibrant institution in the Science, Management'
                ' and Technological area. We have State of the Art infrastructure'
                ' with best of the faculty to ensure the transformation of our'
                ' students to world class professionals. The teaching learning'
                ' process is a continuously monitored process that thrives on the'
                ' feedback of all the stake holders including students, parents,'
                ' industry and academia. \n\nPractice is what we believe produces'
                ' skilled, employable knowledge force. Hence, the institute banks'
                ' on excellent laboratory based practice, project based learning'
                ' and teaching the students in the State of the Art Centres of'
                ' Excellence. We have recently added Centre of Excellence in Data'
                ' Science supported by Dell-EMC, We propose to add Centre of'
                ' Excellence in Artificial Intelligence and Machine Learning,'
                ' Internet of Things and Robotics and Automation to skill our'
                ' students in the emerging industrial requirements. \n\nApart from its'
                ' focus on knowledge creation and dissemination, PIET runs a number'
                ' of programs such as Value Based Learning, Personality Development,'
                ' good physical and mental health through Sports and Cultural'
                ' initiatives to ensure that our student turn out to be good human'
                ' beings, responsible citizens and excellent leaders in all domains'
                ' of life. \n\nTeam PIET believes in “Co-existing, Co-operating and'
                ' Co-evolving to Success”. The vibrant students on the PIET campus'
                ' carry fuller sense of ‘confidence’ capable enough to serve the'
                ' cause of being a good human thereby ready to cultivate a civilized'
                ' society. Welcome to be a part of PIET to usher in a era of paradise'
                ' on earth. \n\nDr. Shakti Kumar \nDirector\n', textAlign: TextAlign.justify,
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
            'Director',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            _buildDirectorText(),
          ],
        ),
      ),
    );
  }
}