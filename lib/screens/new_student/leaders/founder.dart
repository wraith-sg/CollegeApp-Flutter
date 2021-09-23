import 'package:flutter/material.dart';

class Founder extends StatefulWidget {
  _FounderState createState() => new _FounderState();
}

class _FounderState extends State<Founder> {


  Widget _buildFounderText() {
    return Container(
      child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Image(
                  filterQuality: FilterQuality.high,
                  alignment: Alignment.center,
                  image: AssetImage('assets/images/leaders/founder.png',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text('Hari Om Tayal', textAlign: TextAlign.center,
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
                'Since the inception of PIET our aim is to provide an'
                ' academically exhilarating environment allowing our students to'
                ' feel more responsible towards their society. It is fulfilling to note'
                ' that our concerted efforts under the auspices of Vidhyapeeth Education'
                ' Trust have fructified and PIET today enjoys the distinction in the'
                ' fields of engineering, management and above all social welfare. Our'
                'beliefs have influenced the way of teaching and make the students'
                ' participate in philanthropy and social welfare. I have realized that'
                ' there can’t be a nobler act than to lead an educational institute'
                ' like PIET. \n\nI strongly believe that education ought to be “good” or'
                ' “moral” and for this reason it is important to groom the students morally'
                ' for the real life of the corporate world and imbibe in them not only'
                ' academic brilliance but also professional ethics. \n\nOver years, we have'
                ' been aiming at the welfare of the society and embracing the excellence'
                ' in education. Education is a very important contributing element to both'
                ' the benevolence and economic development of the society. \n\n“I reiterate my'
                'promise to make the students human beings first and then professionals."'
                '\n\nHari Om Tayal\nFounder and Chairman\n', textAlign: TextAlign.justify,
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
            'Founder & Chairman',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            _buildFounderText(),
          ],
        ),
      ),
    );
  }
}