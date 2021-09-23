import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class News extends StatefulWidget {
  _NewsState createState() => new _NewsState();
}

class _NewsState extends State<News> {

  Widget _wrapWithStuff(Widget child) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.895,
        color: Colors.black,
        child: child,
      ),
    );
  }

  Future getNews() async {
    var fire = FirebaseFirestore.instance;
    QuerySnapshot qs = await fire.collection('news').get();
    return qs.docs;
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
            'News',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Card(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('news')
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
                            DocumentSnapshot ds = snapshot.data.docs[index];
                            return ListTile(
                                title: Text(
                                  ds['news'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            );
                          }
                      );
                    }
                  },
                ),
            ),
          ].map(_wrapWithStuff).toList(),
        ),
      ),
    );
  }
}
