import 'package:flutter/material.dart';

class Secretary extends StatefulWidget {
  _SecretaryState createState() => new _SecretaryState();
}

class _SecretaryState extends State<Secretary> {


  Widget _buildSecretaryText() {
    return Container(
      child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Image(
                  filterQuality: FilterQuality.high,
                  alignment: Alignment.center,
                  image: AssetImage('assets/images/leaders/secretary.png',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text('Suresh Tayal', textAlign: TextAlign.center,
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
                'Keeping in mind that today life is an epitome of competition,'
                ' PIET takes care to inculcate professionalism among the students'
                ' while shaping and sharpening their mindsets. We foster due'
                ' emphasis on exposing our students to real-life situations of'
                ' the corporate world and enriching them with life turning'
                ' experiences to become self-reliant.\n\nOur constantly outstanding'
                ' university results of the students and notable records of placement'
                ' in renowned organizations have created unbeatable benchmarks.'
                '\n\nOur college has strong alumni body which is continually'
                ' supporting the current students. The well placed alumni of our'
                ' institution are liberally allocating time and their expertise'
                ' for this yeomen service.\n\nEvery year, we invite more than'
                ' three hundred companies to visit PIET for the recruitment of'
                ' our students. Our college has an impressive placement record'
                ' and that places us amongst the best educational institutes of'
                ' the country. All in all, eight years of legacy has been a'
                ' rewarding experience for us. Our objectives are well-laid out.'
                ' We are one of the top multi-disciplinary institutes in all'
                ' facets, academics, placements, sports, research and development.'
                '\n\n“We believe in making our students job providers and not the'
                ' job seekers”.\n\nSuresh Tayal\nSecretary\n', textAlign: TextAlign.justify,
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
            'Secretary',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            _buildSecretaryText(),
          ],
        ),
      ),
    );
  }
}