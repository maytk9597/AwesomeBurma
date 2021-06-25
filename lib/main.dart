import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/login/login_screen.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/splash_screen.dart';
import 'package:travel_guide/screens/home/home_screen.dart';
import 'package:travel_guide/screens/list/state_changer.dart';
// import 'package:travel_guide/screens/home_screen.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/start_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StateChanger(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: start_screen(),
      ),
    );
  }
}
