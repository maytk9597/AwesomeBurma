import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:travel_guide/screens/home/recommendations.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key key}) : super(key: key);

  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: ktextColor,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: Drawer(),
        body: ListView(
          children: <Widget>[
            Center(
              child: KtitleText(
                title: "Awesome Burma",
                fontSize: 30.0,
                color: ktextColor,
              ),
            ),
            Recommendations(),
          ],
        ),
        bottomNavigationBar: BubbleBottomBar(
          backgroundColor: Colors.white,
          opacity: 0.7,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          items: [
            BubbleBottomBarItem(
              icon: Icon(
                Icons.home,
                color: ktextColor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: ktextColor,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: ktextColor),
              ),
              backgroundColor: kMainColor,
            ),
            BubbleBottomBarItem(
              icon: Icon(
                Icons.favorite,
                color: ktextColor,
              ),
              activeIcon: Icon(
                Icons.favorite,
                color: ktextColor,
              ),
              title: Text(
                "Favourites",
                style: TextStyle(color: ktextColor),
              ),
              backgroundColor: kMainColor,
            ),
            BubbleBottomBarItem(
              icon: Icon(
                Icons.person,
                color: ktextColor,
              ),
              activeIcon: Icon(
                Icons.person,
                color: ktextColor,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: ktextColor),
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
