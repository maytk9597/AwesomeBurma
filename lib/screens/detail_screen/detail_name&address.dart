import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/size_config.dart';

class Detail_nameNaddress extends StatelessWidget {
  const Detail_nameNaddress({
    Key key,
    @required this.name,
    @required this.address,
  }) : super(key: key);

  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(90, context),
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(10, context),
          horizontal: getProportionateScreenHeight(20, context)),
      decoration: BoxDecoration(
          // color: Color(0xffD9CFF7),
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(36),
        bottomRight: Radius.circular(36),
      )),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
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
                    size: getProportionateScreenWidth(15, context),
                  ),
                  Text(
                    address,
                    style: TextStyle(
                      color: ktextColor,
                      fontSize: getProportionateScreenWidth(16, context),
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

          // Row(
          //   children: [
          //     SvgPicture.asset('assets/icons/star.svg'),
          //     Text('4.8')
          //   ],
          // )
        ],
      ),
    );
  }
}
