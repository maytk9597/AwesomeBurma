import 'package:flutter/material.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/home/cities_list.dart';
import 'package:travel_guide/screens/home/home_header.dart';
import 'package:travel_guide/screens/home/recommendations.dart';

class HomeScreen_body extends StatelessWidget {
  const HomeScreen_body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HomeHeader(),
          SizedBox(
            height: getProportionateScreenHeight(20, context),
          ),
          Recommendations(),
          // SizedBox(
          //   height: getProportionateScreenHeight(20, context),
          // ),
          Cities_list(),
        ],
      ),
    );
  }
}
