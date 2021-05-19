import 'package:flutter/material.dart';
// import 'package:travel_guide/screens/home_screen.dart';
import 'package:travel_guide/screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: start_screen(),
    );
  }
}

