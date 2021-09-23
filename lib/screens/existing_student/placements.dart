import 'package:flutter/material.dart';
import 'package:piet/screens/existing_student/placementreg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Placements extends StatefulWidget {
  _PlacementsState createState() => new _PlacementsState();
}

class _PlacementsState extends State<Placements> {

  Widget _wrapWithStuff(Widget child) {
    return Container(
      padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.68,
        color: Colors.black,
        child: child,
      ),
    );
  }

  Widget _buildRegisterWithText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Want to register for placements?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: 150.0,
      child: MaterialButton(
        elevation: 6.0,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PlacementForm()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Text(
          'Register',
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
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
            // padding: EdgeInsets.only(left: 15, top: 25),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          title: Text(
            'Placements',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Container(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Card(
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('placement_news')
                            .orderBy('time', descending: true)
                            .snapshots(),
                        builder: (_, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (_, index) {
                                  DocumentSnapshot ds =
                                      snapshot.data.docs[index];
                                  //ds.get('Pnews');
                                  return ListTile(
                                    title: Text(
                                      ds['Pnews'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                });
                          }
                        },
                      ),
                    )
                  ].map(_wrapWithStuff).toList(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      _buildRegisterWithText(),
                      SizedBox(height: 10),
                      _buildRegisterBtn(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
