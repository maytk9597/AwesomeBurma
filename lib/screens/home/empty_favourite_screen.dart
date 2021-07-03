import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/home/home_screen.dart';
import 'package:travel_guide/screens/list/state_changer.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.close,
            color: kMainColor,
            size: getProportionateScreenWidth(40, context),
          ),
          Text(
            "There is No Items in Favourite List",
            style: TextStyle(
                color: ktextColor,
                fontSize: getProportionateScreenWidth(20, context)),
          ),
          Container(
            width: getProportionateScreenWidth(220, context),
            child: FlatButton(
                color: buttonBackgroundColour,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => home_screen()));
                  Provider.of<StateChanger>(context).changeToEdit(0);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  child: Text(
                    'Let\'s Find Some Favourites',

                    textAlign: TextAlign.center,

                    style: TextStyle(



                      fontSize: getProportionateScreenWidth(15, context),
                      color: ktextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
