import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:piet/screens/existing_student/barcodescan.dart';

//ignore: must_be_immutable
class StudentFees extends StatefulWidget {
  String _rollno;
  StudentFees(String roll) {
    this._rollno = roll;
  }
  _StudentFeesState createState() => _StudentFeesState(this._rollno);
}

class _StudentFeesState extends State<StudentFees> {
  String _rollid;
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('Existing-Student');
  _StudentFeesState(String roll) {
    this._rollid = roll;
  }
  Stream<QuerySnapshot> ss;
  findRoll() async {
    try {
      ss = _ref.where('rollno', isEqualTo: _rollid).snapshots();
    } catch (error) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BarcodeScanner()),
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please Enter a Valid Roll Number')));
    }
  }

  qName() {
    return StreamBuilder<QuerySnapshot>(
        stream: ss,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return Text(snapshot.data.docs[0].get('Name').toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
        });
  }

  qRoll() {
    return StreamBuilder<QuerySnapshot>(
        stream: ss,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return Text(snapshot.data.docs[0].get('rollno').toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
        });
  }

  qCourse() {
    return StreamBuilder<QuerySnapshot>(
        stream: ss,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return Text(snapshot.data.docs[0].get('course').toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
        });
  }

  p() {
    debugPrint(ss.toString());
  }

  qFees() {
    return StreamBuilder<QuerySnapshot>(
        stream: ss,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return Text(snapshot.data.docs[0].get('fees').toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
        });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    findRoll();
    p();
    findRoll();
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
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                      child: Column(
                          children: <Widget>[
                            Text(
                              'Details:',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Table(
                              defaultColumnWidth: FixedColumnWidth(175.0),
                              border: TableBorder.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 2),
                              children: [
                                TableRow(children: [
                                  Column(children: [
                                    Text('Name',
                                        style: TextStyle(fontSize: 16.0))
                                  ]),
                                  Column(children: [
                                    Container(
                                        child: StreamBuilder<QuerySnapshot>(
                                            stream: ss,
                                            builder: (context,
                                                AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                              if (!snapshot.hasData)
                                                return Center(
                                                    child:
                                                    CircularProgressIndicator(),
                                                );
                                              return Container(
                                                child: Text(snapshot
                                                    .data.docs[0]
                                                    .get('Name')
                                                    .toString()),
                                              );
                                            }))
                                  ]),
                                ]),
                                TableRow(children: [
                                  Column(children: [
                                    Text('Roll Number',
                                        style: TextStyle(fontSize: 16.0))
                                  ]),
                                  Column(children: [
                                    Container(
                                        child: StreamBuilder<QuerySnapshot>(
                                            stream: ss,
                                            builder: (context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (!snapshot.hasData)
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());

                                              return Container(
                                                child: Text(snapshot
                                                    .data.docs[0]
                                                    .get('rollno')
                                                    .toString()),
                                              );
                                            }))
                                  ]),
                                ]),
                                TableRow(children: [
                                  Column(children: [
                                    Text('Branch',
                                        style: TextStyle(fontSize: 16.0))
                                  ]),
                                  Column(children: [
                                    Container(
                                        child: StreamBuilder<QuerySnapshot>(
                                            stream: ss,
                                            builder: (context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (!snapshot.hasData)
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());

                                              return Container(
                                                child: Text(snapshot
                                                    .data.docs[0]
                                                    .get('stream')
                                                    .toString()),
                                              );
                                            }))
                                  ]),
                                ]),
                                TableRow(children: [
                                  Column(children: [
                                    Text('Fees Pending',
                                        style: TextStyle(fontSize: 16.0))
                                  ]),
                                  Column(children: [
                                    Container(
                                        child: StreamBuilder<QuerySnapshot>(
                                            stream: ss,
                                            builder: (context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (!snapshot.hasData)
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());

                                              return Container(
                                                child: Text(snapshot
                                                    .data.docs[0]
                                                    .get('fees')
                                                    .toString()),
                                              );
                                            }
                                        )
                                    )
                                  ]
                                  ),
                                ]
                                ),
                              ],
                            ),
                          ]
                      )
                  ),
                ),
              ],
            )
        )
    );
  }
}
