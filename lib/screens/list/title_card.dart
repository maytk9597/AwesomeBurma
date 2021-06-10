import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';
import 'title_list.dart';


class TitleCard extends StatelessWidget {

  TitleCard({@required this.sub_type, this.sub_type_name, this.onPress, this.colour});

  String sub_type; String sub_type_name;
  final Function onPress;
  Color colour;

  @override
  Widget build(BuildContext context) {
    // print("in title card// ");
    // print("selected title  = $selectedTitle");
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(

        onTap: onPress,

        child: Container(

          height: getProportionateScreenHeight(50, context),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                sub_type_name,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: ktextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            //color: kMainColor,
            borderRadius: BorderRadius.circular(10),
            color: selectedTitle == sub_type ? buttonBackgroundColour : kSecondaryColour,
            //border: Border.all(color: kMainColor),
          ),
        ),
      ),
    );
  }
}