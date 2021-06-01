import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/home/search_field.dart';

import '../../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: getProportionateScreenWidth(25, context)),
      child: Stack(
        overflow: Overflow.visible,
        // alignment: Alignment.center,
        children: [
          Container(
              height: getProportionateScreenHeight(315, context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/home_bg.jpg",
                  ),
                ),
              )),
          // Image.asset(
          //   "assets/images/home_bg.jpg",
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: getProportionateScreenHeight(315, context),
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(70, context),
                  width: getProportionateScreenWidth(10, context),
                ),
                Icon(Icons.menu),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(80, context)),

              Center(
                child: KtitleText(
                  title: "Awesome Burma",
                  fontSize: getProportionateScreenWidth(50, context),
                  color: ktextColor,
                ),
              ),
              Center(
                child: Text(
                  'To Travel is To Live',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ktextColor,
                      fontFamily: 'DancingScript',
                      fontSize: getProportionateScreenWidth(25, context)),
                ),
              ),
              // Text(
              //   "Travel Community App",
              //   style: TextStyle(color: Colors.white),
              // ),
            ],
          ),
          Positioned.fill(
            // bottom: getProportionateScreenWidth(-300, context),
            bottom: -280,
            child: Align(alignment: Alignment.center, child: SearchField()),
          )
        ],
      ),
    );
  }
}
