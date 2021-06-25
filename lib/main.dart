import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/login/login_screen.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/splash_screen.dart';
import 'package:travel_guide/screens/home/home_screen.dart';
import 'package:travel_guide/screens/list/state_changer.dart';
// import 'package:travel_guide/screens/home_screen.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/start_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //print("dark mode on is = ${Provider.of<StateChanger>(context).dark.toString()}");
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{

  // MyApp({this.dark});
  // final bool dark;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    //print("dark mode on is = ${Provider.of<StateChanger>(context).dark.toString()}");
    return ChangeNotifierProvider(
      create: (context) => StateChanger(),
      child: MaterialApp(
        // theme: Provider.of<StateChanger>(context).dark == true ?
        // ThemeData(
        //   primaryColor: Color(0xFF0A0E21),
        //   scaffoldBackgroundColor: Color(0xFF0A0E21),
        //   accentColor: Colors.blue,
        //   textTheme: TextTheme(
        //       body1: TextStyle(color: Colors.white)
        //   ),) :
        // ThemeData(
        //   primarySwatch: Colors.blue,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        // ),

        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: start_screen(),
      ),
    );
  }
}
