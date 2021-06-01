import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/size_config.dart';

class Detail_nameNaddress extends StatelessWidget {
  const Detail_nameNaddress({
    Key key,
    @required this.placeDocument,
  }) : super(key: key);

  final DocumentSnapshot placeDocument;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: getProportionateScreenHeight(120, context),
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(10, context),
          horizontal: getProportionateScreenHeight(15, context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            placeDocument['name'],
            style: TextStyle(
              color: ktextColor,
              fontSize: getProportionateScreenWidth(20, context),
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: getProportionateScreenWidth(23, context),
              ),
              Flexible(
                child: Text(
                  placeDocument['address'],
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  // softWrap: false,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: ktextColor,
                    fontSize: getProportionateScreenWidth(16, context),
                  ),
                ),
              ),
            ],
          ),
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
