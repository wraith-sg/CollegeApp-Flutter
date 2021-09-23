import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class TimeTable extends StatelessWidget {
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
           title: Text(' Time Table',
             style: TextStyle(
               color: Colors.white,
               fontWeight: FontWeight.bold,
               fontFamily: 'OpenSans',
             ),
           ),
         ),
         body: PhotoView(
           imageProvider: AssetImage("assets/images/timetable.png"),
         )
     ));
   }
}