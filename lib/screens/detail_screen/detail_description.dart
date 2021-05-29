import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/size_config.dart';

class Detail_description extends StatefulWidget {
  const Detail_description({
    Key key,
    @required this.description,
  }) : super(key: key);

  final String description;

  @override
  _Detail_descriptionState createState() => _Detail_descriptionState();
}

class _Detail_descriptionState extends State<Detail_description> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //     horizontal: getProportionateScreenWidth(20, context),
      //     vertical: getProportionateScreenWidth(5, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   widget.type,
          //   style: TextStyle(
          //     color: ktextColor,
          //     fontSize: 16,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Description",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: ktextColor,
                fontSize: getProportionateScreenWidth(20, context),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20, context)),
              child: isPressed
                  ? Text(
                      widget.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16, context)),
                    )
                  : Text(
                      widget.description.substring(0, 250) + '...',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16, context)),
                    )),
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
