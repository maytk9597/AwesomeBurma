import 'package:flutter/material.dart';

Color ktextColor = Color(0xFF53292F);
Color kMainColor = Color(0xFFBB83FA);

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
