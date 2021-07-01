import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/screens/list/state_changer.dart';

List<Color> color_list = [Color(0xffbb83fa), Color(0xFF53292F), Colors.white, Color(0xFFC6BCEE),
  Color(0xFFF4F0FE)];
List<Color> dark_color_list = [Color(0xff296ea5), Colors.white, Color(0xff1e3546),
  Color(0xff296ea5), Color(0xff1c2a35)];

// List<Color> light_color_list = [Color(0xffF6ABB6), Color(0xFF53292F), Color(0xffF4B6C2),
//   Color(0xffEEC9D2), Color(0xffEAD5DC)];

List<Color> current_color_list  = color_list;
Color kMainColor = current_color_list[0];
Color ktextColor = current_color_list[1];
Color white = current_color_list[2];
Color buttonBackgroundColour = color_list[3];
Color kSecondaryColour = color_list[4];
Color temp = ktextColor;

const double size = 50;
const contentCardHeight = 220.0;
const contentCardWidth = 350.0;

//double fSize = getProportionateScreenWidth(15, context);

// font style of the text on the card of the list_view screen
const kContentText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Color(0xFF53292F),
);

const kContentAddressText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Color(0xFF53292F),
);

class KtitleText extends StatelessWidget {
  KtitleText({
    this.title,
    this.fontSize,
    this.color,
  });
  String title;
  double fontSize;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: color,
          fontFamily: 'Pattaya',
          fontSize: fontSize,
          fontWeight: FontWeight.w600),
    );
  }
}