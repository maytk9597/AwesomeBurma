import 'package:flutter/material.dart';
import 'package:travel_guide/Components/constants.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/list/list_view_screen.dart';

class Build_icon extends StatefulWidget {
  const Build_icon({Key key, @required this.index,@required this.city}) : super(key: key);
  final int index;
  final String city;
  @override
  _Build_iconState createState() => _Build_iconState();
}

class _Build_iconState extends State<Build_icon> {
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = widget.index;
        });
        print(type[widget.index]);
        Navigator.push(context,  MaterialPageRoute(builder: (context) => List_View_Screen(
          city: widget.city,
          type: type[widget.index].toString(),
          sub_type: "All",
        )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10, context)),
        height: 70.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: selectedIndex != null && selectedIndex == widget.index
              ? kSecondaryColour
              : buttonBackgroundColour,
          // ? Color(0xFFC9B392)
          // : Color(0xFFD3CBC1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Column(
            children: [
              Icon(
                icons[widget.index],
                size: getProportionateScreenWidth(23, context),
                color: ktextColor,
              ),
              Text(
                type[widget.index],
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(15, context),
                    color: ktextColor),
              ),
            ],
          ),
        ),
        // child: Image(
        //   image: _images[index],
        //   fit: BoxFit.fitHeight,

        //   // color: _selectedIndex == index ? kMainColor : Colors.transparent,
        // ),
      ),
    );
  }
}
