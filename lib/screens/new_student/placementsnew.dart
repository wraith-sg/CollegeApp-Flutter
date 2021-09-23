import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlacementsNew extends StatefulWidget {
  _PlacementsNewState createState() => new _PlacementsNewState();
}

class _PlacementsNewState extends State<PlacementsNew> {

  Widget _wrapWithStuff(Widget child) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.885,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: child,
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
                                  return ListTile(
                                    title: Text(
                                      ds['Pnews'],
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }
                            );
                          }
                        },
                      ),
                    )
                  ].map(_wrapWithStuff).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}