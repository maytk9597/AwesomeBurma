import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import '../../models/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.text,
    // this.press,
  }) : super(key: key);
  final String text;
  // final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(19, context),
              color: ktextColor,
            ),
          ),
          // GestureDetector(onTap: press, child: Text("See More")),
        ],
      ),
    );
  }
}
