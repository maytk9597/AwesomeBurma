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
import 'package:travel_guide/sub_main.dart';

Future<void> main() async {
  print("In main");
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
      child: SubMain(),
    );
  }
}
