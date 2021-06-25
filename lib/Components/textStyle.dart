import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Color ktextColor = Color(0xFF53292F);
Color kMainColor = Color(0xFFBB83FA);
//Color kMainColor = Color(0xFF7063fe);
Color buttonBackgroundColour = Color(0xFFC6BCEE);
Color kSecondaryColour = Color(0xFFF4F0FE);
Color buttonColor = Color(0xFFbd98eb);
//Color viberColor = Color(0xFF7063fe);
Color viberColor = Color(0xFF5740be);
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