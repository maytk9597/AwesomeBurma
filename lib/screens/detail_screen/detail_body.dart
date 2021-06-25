import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:travel_guide/Components/details_description_constants.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class detailBody extends StatelessWidget {
  detailBody(
      {Key key, @required this.placeDocument, this.isPressed, this.placeType})
      : super(key: key);

  DocumentSnapshot placeDocument;
  bool isPressed;
  String placeType;

  @override
  Widget build(BuildContext context) {
    bool isHotel = false;
    bool isRestaurant = false;
    bool isAttraction = false;
    if (placeType == "Attractions") {
      isAttraction = true;
    } else if (placeType == "Hotels") {
      isHotel = true;
    } else if (placeType == "Restaurants") {
      isRestaurant = true;
    }
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(13, context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: ktextColor,
                  size: getProportionateScreenWidth(30, context),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(20, context),
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () async {
                      if (await canLaunch(placeDocument['note'])) {
                        await launch(placeDocument['note']);
                      } else {
                        throw 'Could not launch ${placeDocument['note']}';
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address",
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: ktextColor,
                              fontWeight: FontWeight.w500,
                              fontSize:
                              getProportionateScreenWidth(20, context)),
                        ),
                        Text(
                          placeDocument['address'],
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: ktextColor,
                              // fontWeight: FontWeight.w500,
                              fontSize:
                              getProportionateScreenWidth(18, context)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10, context),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10, context),
            ),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: ktextColor,
                  size: getProportionateScreenWidth(30, context),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(20, context),
                ),
                isHotel
                    ? buildHotelTime(context, placeDocument)
                    : buildAttractNRestaurantTime(context, placeDocument),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10, context),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10, context),
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: ktextColor,
                  size: getProportionateScreenWidth(30, context),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(20, context),
                ),
                GestureDetector(
                  onTap: () {
                    print(placeDocument['ph_no']);
                    launch('tel://${placeDocument['ph_no']}');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact Number",
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            color: ktextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: getProportionateScreenWidth(20, context)),
                      ),
                      Text(
                        placeDocument['ph_no'],
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            color: ktextColor,
                            // fontWeight: FontWeight.w500,
                            fontSize: getProportionateScreenWidth(18, context)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10, context),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10, context),
            ),
            isRestaurant
                ? SizedBox(
              height: 0,
            )
                : Text(
              "Description",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: ktextColor,
                // color: Colors.black,
                fontSize: getProportionateScreenWidth(20, context),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10, context),
            ),
            isRestaurant
                ? SizedBox()
                : isPressed
                ? Text(
              placeDocument['description'],
              // textAlign: TextAlign.justify,
              style: TextStyle(
                  color: ktextColor,
                  fontSize: getProportionateScreenWidth(18, context)),
            )
                : Text(
              placeDocument['description'].length < 100
                  ? placeDocument['description']
                  : placeDocument['description'].substring(0, 100) +
                  '...',
              // textAlign: TextAlign.justify,
              style: TextStyle(
                  color: ktextColor,
                  fontSize: getProportionateScreenWidth(18, context)),
            ),
          ],
        ));
  }
}