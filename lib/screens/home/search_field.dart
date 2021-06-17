import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import '../../models/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(313, context),
      height: getProportionateScreenWidth(50, context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            // color: Color(0xFF3E4067),
            color: kMainColor,
            width: getProportionateScreenWidth(2, context)),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.16),
            spreadRadius: -2,
          )
        ],
      ),
      child: TextField(
        onTap: () {},
        cursorColor: kMainColor,
        onChanged: (value) {},
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search your destination…",
          hintStyle: TextStyle(
              fontSize: getProportionateScreenWidth(18, context),
              color: ktextColor),
          suffixIcon: Icon(
            Icons.search,
            color: kMainColor,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20, context),
            vertical: getProportionateScreenWidth(10, context),
          ),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
