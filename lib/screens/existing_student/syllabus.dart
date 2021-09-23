import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class Syllabus extends StatefulWidget {
  _SyllabusState createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
        home: new Scaffold(
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
                'Syllabus',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            backgroundColor: Colors.black,
            body:
               PdfViewer.openAsset('assets/syllabus.pdf'),
        ),
    );
  }
}