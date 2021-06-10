import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:travel_guide/Components/details_description_constants.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/detail_screen/detail_body.dart';
import 'package:travel_guide/models/size_config.dart';

class Detail_description extends StatefulWidget {
  const Detail_description(
      {Key key, @required this.placeDocument, this.placeType})
      : super(key: key);

  final DocumentSnapshot placeDocument;
  final String placeType;

  @override
  _Detail_descriptionState createState() => _Detail_descriptionState();
}

class _Detail_descriptionState extends State<Detail_description> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    bool isHotel = false;
    bool isRestaurant = false;
    bool isAttraction = false;
    if (widget.placeType == "Attractions") {
      isAttraction = true;
    } else if (widget.placeType == "Hotels") {
      isHotel = true;
    } else if (widget.placeType == "Restaurants") {
      isRestaurant = true;
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(12, context),
          ),
          detailBody(
            placeDocument: widget.placeDocument,
            isPressed: isPressed,
            placeType: widget.placeType,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20, context),
              vertical: 10,
            ),
            child: isRestaurant
                ? SizedBox(
                    height: 20,
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        isPressed = !isPressed;
                        print(isPressed);
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          isPressed ? 'See Less' : 'See More',
                          style: TextStyle(
                            color: ktextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: ktextColor,
                        )
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
