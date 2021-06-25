import 'package:after_layout/after_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/login/login_screen.dart';
import 'package:travel_guide/screens/home/home_screen.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/start_screen.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _Loginseen = (prefs.getBool('logInseen') ?? false);
    bool status = prefs.getBool('isLoggedIn') ?? false;

    if (_Loginseen||status) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new home_screen()));
    } else {
      await prefs.setBool('LogInseen', true);




      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new start_screen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) {
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
