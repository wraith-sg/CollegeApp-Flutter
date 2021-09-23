import 'package:flutter/material.dart';

class CSEDSAI extends StatefulWidget {
  _CSEDSAIState createState() => new _CSEDSAIState();
}

class _CSEDSAIState extends State<CSEDSAI> {


  Widget _buildCSEDSAIText() {
    return Container(
      child: Column(
          children: <Widget>[
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 5, // Space between underline and text
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0, // Underline thickness
                  ))
              ),
              child: Text(
                "Computer Science & Engineering in AI & DS", textAlign: TextAlign.justify,
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
                'B.Tech in Computer Science with specialization in Artificial'
    ' Intelligence and Data Science (DS) is 4 year programme for the students'
    ' who have interest in data science. This programme develops skills in'
    ' students to perform data analysis which is a critical part in various'
    ' real-world applications. Data Science has arise as quite possibly the'
    ' most high-development, dynamic, and rewarding professions in innovation'
    ' in these days. This course is not only aimed to provide core technologies'
    ' like machine learning , data warehouse, data mining and artificial'
    ' intelligence; but it also gives in depth inputs in areas like artificial'
    'neural networks, fuzzy techniques, big data analytics and many The main'
    ' intention of this programme is to prepare students to become industry'
    ' ready and knowledgeable, to pursue careers as data analysts, data'
    ' scientists, who can solve major problems related in the field of machine'
    ' learning, statistics, knowledge discovery, and visualization skills. \n\n'
    'With the advent of Artificial Intelligence & Data Science, Students are'
    ' transformed to industry ready professionals by building smart machines'
    ' with cutting edge technologies. \n\nTo meet this need of the hour, PIET'
    ' institute is stepping towards inculcating the required skills in our'
    ' students to be the future Data Scientist, Data Engineer or Business'
    'Analyst. \n\nAPPROVED INTAKE: \nThe approved intake of the programme'
    ' is 60 students. \n\nAFFILIATION: \nThe programme is affiliated with'
    ' Kurukshetra University.\n', textAlign: TextAlign.justify,
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
            _buildCSEDSAIText(),
          ],
        ),
      ),
    );
  }
}