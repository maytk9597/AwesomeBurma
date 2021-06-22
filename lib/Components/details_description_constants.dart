import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

Column buildAttractNRestaurantTime(BuildContext context, var placeDocument) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Opening Times",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: ktextColor,
            fontSize: getProportionateScreenWidth(20, context)),
      ),
      SizedBox(
        height: getProportionateScreenHeight(10, context),
      ),
      Text(
        placeDocument['openingHours'],
        maxLines: 2,
        overflow: TextOverflow.fade,
        style: TextStyle(
            color: ktextColor,
            // fontWeight: FontWeight.w500,
            fontSize: getProportionateScreenWidth(18, context)),
      ),
      Text(
        placeDocument['remark'],
        maxLines: 2,
        overflow: TextOverflow.fade,
        style: TextStyle(
            color: ktextColor,
            // fontWeight: FontWeight.w500,
            fontSize: getProportionateScreenWidth(18, context)),
      ),
    ],
  );
}

Expanded buildHotelTime(BuildContext context, var placeDocument) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Check In / Check Out Time",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: ktextColor,
              fontSize: getProportionateScreenWidth(20, context)),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10, context),
        ),
        Html(data: placeDocument['hours'], style: {
          "body": Style(
              fontSize: FontSize(getProportionateScreenWidth(18, context)),
              color: ktextColor,
              fontWeight: FontWeight.w400)
        }),
      ],
    ),
  );
}