import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:travel_guide/screens/home_screen.dart';
import 'package:travel_guide/screens/start_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
