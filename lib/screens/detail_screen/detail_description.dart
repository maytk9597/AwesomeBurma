import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/size_config.dart';

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
    if (widget.placeType == "attraction") {
      isAttraction = true;
    } else if (widget.placeType == "hotel") {
      isHotel = true;
    } else if (widget.placeType == "restaurant") {
      isRestaurant = true;
    }
    return Container(
      // padding: EdgeInsets.symmetric(
      //     horizontal: getProportionateScreenWidth(20, context),
      //     vertical: getProportionateScreenWidth(5, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: isAttraction
                  ? Text(
                      "Description",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: ktextColor,
                        fontSize: getProportionateScreenWidth(20, context),
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : isHotel
                      ? Text(
                          "Hotel Details",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ktextColor,
                            fontSize: getProportionateScreenWidth(20, context),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : isRestaurant
                          ? Text(
                              "Open & Close Hours",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: ktextColor,
                                fontSize:
                                    getProportionateScreenWidth(20, context),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : Text("There is Error")),
          isAttraction
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20, context)),
                  child: isPressed
                      ? Text(
                          widget.placeDocument['description'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: ktextColor,
                              fontSize:
                                  getProportionateScreenWidth(20, context)),
                        )
                      : Text(
                          widget.placeDocument['description']
                                  .substring(0, 250) +
                              '...',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: ktextColor,
                              fontSize:
                                  getProportionateScreenWidth(20, context)),
                        ))
              : isHotel || isRestaurant
                  ? Padding(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(20, context),
                        right: getProportionateScreenWidth(20, context),
                      ),
                      child: isPressed
                          ? Center(
                              child: Html(
                                  data: widget.placeDocument['description'],
                                  style: {
                                    "body": Style(
                                        textAlign: TextAlign.justify,
                                        fontSize: FontSize(20),
                                        color: ktextColor,
                                        fontWeight: FontWeight.w400)
                                  }),
                            )
                          : Center(
                              child: Html(
                                  data: widget.placeDocument['description']
                                          .substring(0, 250) +
                                      ' . . . ',
                                  style: {
                                    "body": Style(
                                        textAlign: TextAlign.justify,
                                        fontSize: FontSize(20),
                                        color: ktextColor,
                                        fontWeight: FontWeight.w400)
                                  }),
                            ),
                    )
                  : Text("Something went Wrong"),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20, context),
              vertical: 10,
            ),
            child: GestureDetector(
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

          // Container(
          //   height: getProportionateScreenHeight(200, context),
          //   child: Text(
          //     widget.description,
          //     textAlign: TextAlign.justify,
          //     style: TextStyle(
          //       fontSize: 16,
          //       height: 1.5,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
