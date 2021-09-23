import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:piet/screens/existing_student/StudentFees.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BarcodeScanner extends StatefulWidget {
  _BarcodeScannerState createState() => new _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  String _rollno = '';
  Future<void> scanBarcodeNormal() async {
    String result;
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(result);
    } on PlatformException {
      result = 'Unknown Error Occurred';
    }
    if (!mounted) return null;
    if (result == '-1') {
      return AlertDialog(
          content: Text('Please Verify your Email'),
          actions: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarcodeScanner()),
                );
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            )
          ]);
    } else {
      setState(() {
        _rollno = result;
        check(_rollno);
      });
    }
  }

  check(String _search) {
    CollectionReference _ref =
        FirebaseFirestore.instance.collection('Existing-Student');
    _ref.where('rollno', isEqualTo: _search).get().then((snapshot) async => {
          if (snapshot.size != 0)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentFees(_search)))
            }
          else
            {
              setState(() {
                _rollno = 'Please Enter a Valid Roll Number';
              }),
            }
        });
  }

  Widget _buildRollNoTF() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Roll Number',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            height: 60.0,
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20.0),
                hintText: 'For ex. 28*****',
                hintStyle: TextStyle(
                  // fontWeight: FontWeight.bold,
                  color: Colors.black38,
                  fontFamily: 'OpenSans',
                ),
              ),
              onSubmitted: (String input) {
                setState(() {
                  _rollno = input;
                  check(_rollno);
                });
              },
            ),
          ),
        ]);
  }

  Widget _buildQRbtn() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.black, // background
        onPrimary: Colors.white, // foreground
      ),
      label: Text('Scan your ID Card'),
      icon: Icon(Icons.qr_code),
      onPressed: () => scanBarcodeNormal(),
    );
  }

  Widget _buildResult() {
    return Text(
      'Result : $_rollno\n',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            'Fee Details',
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
                height: size.height,
                width: size.width,
                color: Colors.white,
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/auth/new_topl.png",
                  width: size.width * 0.3,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/auth/new_bottoml.png",
                  width: size.width * 0.25,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/auth/new_topr.png",
                  width: size.width * 0.3,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/auth/new_bottomr.png",
                  width: size.width * 0.4,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      _buildRollNoTF(),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                      _buildQRbtn(),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                      _buildResult()
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
