import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/screens/detail_screen/detail_screen.dart';
import 'package:travel_guide/size_config.dart';

class Detail_header extends StatelessWidget {
  const Detail_header({
    Key key,
    @required this.placeDocument,
  }) : super(key: key);

  final DocumentSnapshot placeDocument;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 400,
      child: Stack(
        children: [
          Container(
            height: getProportionateScreenHeight(350, context),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(30),
              //   bottomRight: Radius.circular(30),
              // ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(placeDocument['imageUrl']),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20, context)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: getProportionateScreenWidth(24, context),
                    ),
                  ),
                ),
                Spacer(),
                // Icon(
                //   Icons.share,
                //   color: Colors.white,
                //   size: getProportionateScreenWidth(24, context),
                // ),
                SizedBox(
                  width: getProportionateScreenWidth(24, context),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: getProportionateScreenWidth(24, context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
