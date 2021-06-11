import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail_button extends StatelessWidget {
  const Detail_button({
    @required this.placeDocument,
    this.placeType,
    Key key,
  }) : super(key: key);
  final DocumentSnapshot placeDocument;
  final String placeType;

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
    return isAttraction || isRestaurant
        ? Container(
            height: 90,
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            child: FlatButton(
                color: buttonBackgroundColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () async {
                  print(placeDocument['note']);
                  if (await canLaunch(placeDocument['note'])) {
                    await launch(placeDocument['note']);
                  } else {
                    throw 'Could not launch ${placeDocument['note']}';
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: Text(
                    'View on Google Map',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18, context),
                      color: ktextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
          )
        : isHotel
            ? Container(
                height: 90,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                child: FlatButton(
                    color: buttonBackgroundColour,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () async {
                      print(placeDocument['booking']);
                      if (await canLaunch(placeDocument['booking'])) {
                        await launch(placeDocument['booking']);
                      } else {
                        throw 'Could not launch ${placeDocument['booking']}';
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18, context),
                          color: ktextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
              )
            : Text("Something went wrong");
  }
}
