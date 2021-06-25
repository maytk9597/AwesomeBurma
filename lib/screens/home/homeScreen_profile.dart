import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_guide/screens/Login_SignIn_screen/login/login_screen.dart';

class HomeScreenProfile extends StatefulWidget {
  const HomeScreenProfile({Key key,@required this.isLogin,@required this.userId}) : super(key: key);
 final bool isLogin;
 final String userId;


  @override
  _HomeScreenProfileState createState() => _HomeScreenProfileState();
}

class _HomeScreenProfileState extends State<HomeScreenProfile> {

  @override
  Widget build(BuildContext context) {
    print("inside user Profile++++++++++++");
    print(" Login "+widget.isLogin.toString());
    print(" user id "+widget.userId.toString());
    return Container(
      child: RawMaterialButton(
        onPressed: ()async{
          FirebaseAuth.instance.signOut();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs?.setBool("isLoggedIn", false);
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => LoginScreen()));
        },
        child: Text('Sign Out',),
      ),
    );
  }
}
