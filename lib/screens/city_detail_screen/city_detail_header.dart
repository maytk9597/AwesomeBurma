import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';

class City_detail_header extends StatelessWidget {
  const City_detail_header(
      {Key key, @required this.imageUrl, this.type, this.name})
      : super(key: key);

  final String imageUrl;
  final String type;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(overflow: Overflow.visible, children: [
      Column(
        children: [
          Container(
              height: getProportionateScreenHeight(320, context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                ),

                // image: DecorationImage(
                //   fit: BoxFit.cover,
                //   image: AssetImage(
                //     "assets/images/home_bg.jpg",
                //   ),
                // ),
              )),

          // KtitleText(
          //   title: "Where do you Like to go?",
          //   fontSize: getProportionateScreenWidth(30, context),
          //   color: ktextColor,
          // ),
        ],
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
            Spacer()
          ],
        ),
      ),
      Positioned(
        // bottom: getProportionateScreenWidth(-300, context),
        bottom: 0,
        // left: 5,
        child: Container(
          padding: EdgeInsets.only(left: 20),
          width: MediaQuery.of(context).size.width,
          color: ktextColor.withOpacity(0.5),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.toUpperCase(),
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      type.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        ),
      )
    ]);
  }
}
