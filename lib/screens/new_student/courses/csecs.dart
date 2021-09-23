import 'package:flutter/material.dart';

class CSECS extends StatefulWidget {
  _CSECSState createState() => new _CSECSState();
}

class _CSECSState extends State<CSECS> {


  Widget _buildCSECSText() {
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
                "Computer Science & Engineering in Cyber Security", textAlign: TextAlign.justify,
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
                'The 4-year Bachelor of Technology in Computer Science and'
    ' Engineering (Cyber Security) program is now better designed to meet the'
    ' current challenges relating to data protection from cyber attacks with'
    ' proper risk evaluation and alleviation as well as meet the industry needs,'
    ' thanks to the value addition by academicians, researchers and industry'
    ' experts. This program helps to train professionals who are capable of'
    ' adapting to all situations in homeland or abroad.The program offers'
    ' courses in computer networks, cryptography, network security, digital'
    ' forensics, cyber laws and ethics etc. this is one of the most coveted'
    'graduation programme that opens avenues for core job roles of Cyber'
    ' Security Analyst, Security Engineer, Security Architect, Security'
    ' Administrator, Security Software Developer, Cryptanalyst, Digital'
    ' Forensic Analyst, Cloud Security Architect, Intrusion Detection'
    ' Specialist, Cybercrime Investigator, Malware Analyst, Data Privacy'
    ' Officer etc. As of now placement opportunities for these cyber security'
    ' job exist with premium organizations like ABB Corp, Cisco, IBM, , Nokia'
    ' Philips, Amazon, IndusFace, Deloitte, SBI-Infosec Wing, Symantec,'
    ' CloudByte and so on. \n\nAFFILIATION: \nThe programme is affiliated with'
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
            _buildCSECSText(),
          ],
        ),
      ),
    );
  }
}