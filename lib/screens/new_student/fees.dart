import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FeeDetails extends StatelessWidget {
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
              title: Text(' Fee Details',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            body: PhotoView(
              imageProvider: AssetImage("assets/images/fees.png"),
            )
        ));
  }
}