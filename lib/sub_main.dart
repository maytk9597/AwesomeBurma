import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/login/login_screen.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/splash_screen.dart';
import 'package:travel_guide/screens/list/state_changer.dart';

class SubMain extends StatefulWidget {
  const SubMain({Key key}) : super(key: key);

  @override
  _SubMainState createState() => _SubMainState();
}

class _SubMainState extends State<SubMain> {
  @override
  Widget build(BuildContext context) {

    final hsl = HSLColor.fromColor(Colors.black);
    final hslDark = hsl.withLightness((hsl.lightness - 1).clamp(0.0, 1.0));
    hslDark.toColor();
    // print("****** dark mode on is = ${Provider.of<StateChanger>(context).dark.toString()}");
    return MaterialApp(

      theme: Provider.of<StateChanger>(context).dark == true ?
          ThemeData.dark().copyWith(
            primaryColor: hslDark.toColor(),
          ):
       // ThemeData(primaryColor: Color(0xFF0A0E21),
       //  scaffoldBackgroundColor: hslDark.toColor(),
       //  //accentColor: Colors.red,
       //  textTheme: TextTheme(
       //      body1: TextStyle(color: Colors.white)
       //  ),) :
      ThemeData(
        //primaryColor: Colors.black.withOpacity(0.7),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: Splash(),
    );
  }
}
