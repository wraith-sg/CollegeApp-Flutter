import 'package:flutter/material.dart';
import 'package:piet/screens/login/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P.I.E.T.',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
