import 'package:flutter/material.dart';

class CSEAIML extends StatefulWidget {
  _CSEAIMLState createState() => new _CSEAIMLState();
}

class _CSEAIMLState extends State<CSEAIML> {


  Widget _buildCSEAIMLText() {
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
                "Computer Science & Engineering in AI & ML", textAlign: TextAlign.justify,
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
                'B.tech in Computer Science (Artificial Intelligence & Machine'
                ' Learning) programme imparts knowledge of Machine Learning, Deep learning,'
                ' complied vision, natural language processing. Artificial intelligence'
                'theory and development of computer systems (both machines and software)'
                ' are able to perform tasks that require human intelligence like cognitive'
                ' thinking, learning, problem solving and decision making. Due to huge'
                ' advancement made in data collection, processing and computation power,'
                ' intelligent systems can now be deployed to take over a variety of tasks,'
                ' enable connectivity and enhance productivity. Artificial Intelligence (AI)'
                ' is being widely recognized to be the power that will fuel the future global'
                'digital economy.India’s own AI strategy identifies AI as an opportunity'
                ' and solution provider for inclusive economic growth and social development.'
                ' This programme harness the potential of AI in a sustainable manner and'
                ' make India’s next generation ‘AI ready’. \n\nAPPROVED INTAKE:'
                    '\nThe approved intake of the programme is 60 students. \n\nAFFILIATION:'
                    '\nThe programme is affiliated with Kurukshetra University.\n', textAlign: TextAlign.justify,
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
            _buildCSEAIMLText(),
          ],
        ),
      ),
    );
  }
}