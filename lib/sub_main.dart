import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/models/favourite.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/login/login_screen.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/splash_screen.dart';

import 'package:travel_guide/screens/Login_SignIn_screen/start_screen.dart';

import 'package:travel_guide/screens/home/profile/homeScreen_profile.dart';

import 'package:travel_guide/screens/list/state_changer.dart';

class SubMain extends StatefulWidget {
  const SubMain({Key key}) : super(key: key);

  @override
  _SubMainState createState() => _SubMainState();
  //readData();
  static bool dark;

}

class _SubMainState extends State<SubMain> {
  @override

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        build(context));
  }

  static void getData(BuildContext context){
    bool isUserLogin = false;
    String currentuser_id;
    final _auth = FirebaseAuth.instance;
    var user = _auth.currentUser;
    if(user == null)
    {
      isUserLogin = false;
      currentuser_id = null;
    }
    else{
      // bool verify = user.emailVerified;
      // print("Email verification ========== ${verify.toString()}");
      currentuser_id = user.uid;
      isUserLogin = true;
    }
    HomeScreenProfile.getData(currentuser_id,isUserLogin);
    Provider.of<StateChanger>(context).changeDarkMode(HomeScreenProfile.dark);

  }

  @override
  Widget build(BuildContext context) {
    getData(context);
    // SubMain.ge
    // HomeScreenProfile.getData(userId, isLogin);
    // print("static dark = ${SubMain.dark}");
    final hsl = HSLColor.fromColor(Colors.black);
    final hslDark = hsl.withLightness((hsl.lightness - 1).clamp(0.0, 1.0));
    hslDark.toColor();
    // readData();
    // SubMain.dark = required_data.dark;
    // print("static dark 2 = ${SubMain.dark}");
    // print("dark mode = ${required_data.dark}");

    // Provider.of<StateChanger>(context).changeDarkMode(required_data.dark);
    // print("****** dark mode on is = ${Provider.of<StateChanger>(context).dark.toString()}");
    return MaterialApp(

      theme: Provider.of<StateChanger>(context).dark == true ?
          // ThemeData.dark().copyWith(
          //   primaryColor: hslDark.toColor(),
          // ):
       ThemeData(//primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xff171E24),
        //accentColor: Colors.red,
        textTheme: TextTheme(
            body1: TextStyle(color: Colors.white)
        ),) :
      ThemeData(
        //primaryColor: Colors.black.withOpacity(0.7),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: start_screen(),
    );
  }
}
