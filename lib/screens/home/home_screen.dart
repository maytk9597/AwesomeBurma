import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Components/home_app_bar.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:travel_guide/screens/home/cities_list.dart';
import 'package:travel_guide/screens/home/profile/edit_profile.dart';
import 'package:travel_guide/screens/home/homeScreen_body.dart';
import 'package:travel_guide/screens/home/homeScreen_favourite.dart';
import 'package:travel_guide/screens/home/profile/homeScreen_profile.dart';
import 'package:travel_guide/screens/home/home_header.dart';
import 'package:travel_guide/screens/home/recommendations.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/list/state_changer.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key key}) : super(key: key);

  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    print("current index = $index");
    setState(() {
      Provider.of<StateChanger>(context).changeToEdit(index);
      _selectedIndex = Provider.of<StateChanger>(context).index;
    });
  }


  @override
  Widget build(BuildContext context) {

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
    HomeScreenProfile.getData(currentuser_id,isUserLogin); // get user info first because of await

    var Screen = [HomeScreen_body(), HomeScreen_favourite(),
      HomeScreenProfile(isLogin: isUserLogin, userId: currentuser_id,),
      EditProfile(userId: currentuser_id,),
    ];

    return SafeArea(
      child: Scaffold(
        // appBar: buildAppBar(context, isTransparent: true),
        // drawer: Drawer(),
        body: Screen[Provider.of<StateChanger>(context).index],
        bottomNavigationBar: BubbleBottomBar(
          backgroundColor: white,
          opacity: 0.7,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          items: [
            BubbleBottomBarItem(
              icon: Icon(
                Icons.home,
                color: temp,
              ),
              activeIcon: Icon(
                Icons.home,
                color: temp,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: temp),
              ),
              backgroundColor: kMainColor,
            ),
            BubbleBottomBarItem(
              icon: Icon(
                Icons.favorite,
                color: temp,
              ),
              activeIcon: Icon(
                Icons.favorite,
                color: temp,
              ),
              title: Text(
                "Favourites",
                style: TextStyle(color: temp),
              ),
              backgroundColor: kMainColor,
            ),
            BubbleBottomBarItem(
              icon: Icon(
                Icons.person,
                color: temp,
              ),
              activeIcon: Icon(
                Icons.person,
                color: temp,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: temp),
              ),
              backgroundColor: kMainColor,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
