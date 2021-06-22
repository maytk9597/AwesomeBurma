import 'package:flutter/material.dart';

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
    print(" user id "+widget.userId);
    return Container();
  }
}
