import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class AboutPIET extends StatefulWidget {
  _AboutPIETState createState() => new _AboutPIETState();
  }

  class _AboutPIETState extends State<AboutPIET> {

    Widget _buildCarousel() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.235,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.black),
        child: SizedBox(
          child: Carousel(
            boxFit: BoxFit.cover,
            dotSize: 4,
            dotSpacing: 15,
            // dotColor: Colors.black,
            // dotIncreasedColor: Colors.black,
            showIndicator: true,
            indicatorBgPadding: 2,
            dotPosition: DotPosition.bottomCenter,
            dotBgColor: Colors.transparent,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(seconds: 2),
            images: [
              ExactAssetImage('assets/images/aboutus/1.jpg'),
              ExactAssetImage('assets/images/aboutus/2.jpg'),
              ExactAssetImage('assets/images/aboutus/3.jpg'),
              ExactAssetImage('assets/images/aboutus/4.jpg'),
              ExactAssetImage('assets/images/aboutus/5.jpg'),
              ExactAssetImage('assets/images/aboutus/6.jpg'),
            ],
          ),
        ),
      );
    }

    Widget _buildAboutPIETText() {
      return Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Text(
                'Panipat Institute of Engineering and Technology (PIET) was'
                    ' established by the VidhyaPeeth Education trust in the'
                    ' year 2006. It was the time when state and NCR was'
                    ' striving of producing World Class technocrats and'
                    ' Managers. PIET was Self Financed Initiative by a'
                    ' Private Management which always had an eye on quality'
                    ' of technical education. \n\nThe great philosophy of PIET'
                    ' management has created an edifice that is strengthening'
                    ' its foundation, which can only rise higher and higher.'
                    ' Quality and Integrity is the essence for achieving'
                    ' Excellence at PIET. Members of Executive Academic'
                    ' Advisory Board being eminent personalities and'
                    ' philanthropists which have been successful in their'
                    ' endeavors set out with a common desire to design to'
                    ' serve the community through value based education.\n\n'
                    'When we look at some option of best engineering'
                    ' Institute'
                    ' in National Capital Region, PIET stands out of a clear'
                    ' leader. A Multidisciplinary institute affiliated to'
                    ' Kurukshetra University, Kurukshetra approved by AICTE,'
                    ' New Delhi provides Undergraduate programs in Engineering'
                    ' and Management. PIET has consistently pushed the war of'
                    ' excellence to garner riche for itself among the Ten'
                    ' Engineering institute in Delhi/NCR in the field of'
                    ' Engineering Education. \n\nIt has focus on its goal of'
                    ' producing Entrepreneurs, world class Manager and'
                    ' technocrats employable throughout the globe. The '
                    'institute has one of the largest student populations'
                    ' among engineering colleges of NCR. PIET is the most'
                    ' preferred destination for the students from across the'
                    ' country which could be attributed to the quality of'
                    ' education, infrastructure, healthy teaching Learning'
                    ' practices as well as producing industry ready students.'
                    '\n\nPIET is a family of aspiring students supportive'
                    ' parents, committed faculty and visionary Management who'
                    ' all are working together to make a difference in'
                    ' education field.', textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Center(
                child: Image(
                  filterQuality: FilterQuality.high,
                  alignment: Alignment.center,
                  image: AssetImage('assets/images/aboutus/accreditations.png',
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
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
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            '  About P.I.E.T.',
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
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.235),
                    _buildAboutPIETText(),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  _buildCarousel(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}