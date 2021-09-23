import 'package:flutter/material.dart';

class CSE extends StatefulWidget {
  _CSEState createState() => new _CSEState();
  }

  class _CSEState extends State<CSE> {


    Widget _buildCSEText() {
      return Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.only(
                bottom: 5, // Space between underline and text
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0, // Underline thickness
                  ))
              ),
              child: Text(
                "Computer Science & Engineering", textAlign: TextAlign.justify,
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
                'The endeavor of the B.Tech. Computer Science and Engineering'
                    ' (CSE) program is to educate students to embark on their'
                    ' careers in the latest technology, entrepreneurship or to'
                    ' pursue higher studies in research by learning and applying'
                    ' various computational techniques. The scheme of B.Tech.'
                    ' CSE program covers basics to advanced concepts of computer'
                    ' science, including the academics and practical concepts,'
                    ' engineering skills for problem-solving. To provide an edge'
                    ' in specialized skill courses, the department has also'
                    ' started B.Tech. Computer Science and Engineering (CSE)'
                    ' Honors program in the Internet of Things (IoT), Augmented'
                    ' Reality-Virtual Reality (AR-VR), Blockchain, Artificial'
                    ' Intelligence & Machine Learning (AI & ML), and Artificial'
                    ' Intelligence & Data Science (AI & DS). The department is'
                    ' also running certain add-on courses in collaboration with'
                    ' IBM & Oracle Academy to induce professional skills among'
                    ' students. The first objective of the CSE program is to'
                    ' focus on building the foundation of students in a'
                    ' well-planned and structured manner. The second objective'
                    ' is to develop the skills and knowledge of the students'
                    ' through need-based training, research, and development. '
                    '\n\nThe overall aim of the B.Tech. (CSE) program is to'
                    ' expand the following features in students: \n\n1.	To'
                    ' understand the basic concepts of computer science and'
                    ' engineering. \n\n2.	To understand computation from basics'
                    ' to a higher level with different computer languages,'
                    ' algorithms and flow chart designing, database management,'
                    ' and applications. \n\n3.	To develop an ability to design'
                    ' new models with innovative techniques to solve various'
                    ' real-life problems to meet the forthcoming industrial'
                    ' needs. \n\n4.	To develop an ability to accomplish a common'
                    ' goal as an efficient team member. \n\n5.	To develop'
                    ' professional, social, and ethical responsibility.\n\n6.	To'
                    ' develop good communication skills. \n\n7.	To develop and'
                    ' understand technical skills based on research and'
                    ' projects. \n\nAll the graduate students from CSE program'
                    ' know their responsibility to work for the uplift of'
                    ' society and nation with their professional skills. \n\n'
                    'APPROVED INTAKE: \nThe approved intake of the programme is'
                    '180 students. \n\nAFFILIATIONS: \nThe programme is'
                    ' affiliated with Kurukshetra University and is Haryana’s'
                    ' only NBA accredited Program.\n', textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
            _buildCSEText(),
          ],
        ),
      ),
    );
  }
}