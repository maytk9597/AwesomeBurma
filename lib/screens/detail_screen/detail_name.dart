import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';

class Detail_name extends StatelessWidget {
  const Detail_name({Key key, @required this.placeDocument, this.placeType})
      : super(key: key);

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
    return Container(
      // height: getProportionateScreenHeight(120, context),
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(10, context),
          horizontal: getProportionateScreenHeight(15, context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isHotel
              ? Row(
                  children: [
                    Text(
                      placeDocument['name'].toString().toUpperCase(),
                      style: TextStyle(
                        color: ktextColor,
                        fontSize: getProportionateScreenWidth(23, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return index < int.parse(placeDocument['type'])
                            ? Icon(
                                Icons.star,
                                color: kMainColor,
                                size: getProportionateScreenWidth(15, context),
                              )
                            : Icon(
                                Icons.star_border,
                                color: kMainColor,
                                size: getProportionateScreenWidth(15, context),
                              );
                      }),
                    ),
                    Text(
                      placeDocument['type'].toString(),
                      style: TextStyle(
                          color: ktextColor,
                          fontSize: getProportionateScreenWidth(18, context)),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      placeDocument['name'].toString().toUpperCase(),
                      style: TextStyle(
                        color: ktextColor,
                        fontSize: getProportionateScreenWidth(23, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      placeDocument['type'],
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(15, context),
                          color: ktextColor,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15, context),
                    )
                  ],
                ),
          // isRestaurant
          //     ? SizedBox()
          //     : Row(
          //         children: [
          //           Icon(
          //             Icons.location_on,
          //             size: getProportionateScreenWidth(23, context),
          //           ),
          //           Flexible(
          //             child: Text(
          //               placeDocument['address'],
          //               maxLines: 2,
          //               // textAlign: TextAlign.justify,
          //               // softWrap: false,
          //               overflow: TextOverflow.fade,
          //               style: TextStyle(
          //                 color: ktextColor,
          //                 fontSize: getProportionateScreenWidth(18, context),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          // Text(
          //   widget.type,
          //   style: TextStyle(
          //     color: ktextColor,
          //     fontSize: getProportionateScreenWidth(15, context),
          //   ),
          // ),
        ],
      ),
    );
  }
}
