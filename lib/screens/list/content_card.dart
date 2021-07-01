import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/models/favouriteButton.dart';
import 'package:travel_guide/screens/detail_screen/detail_screen.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/list/state_changer.dart';


class ContentCard extends StatelessWidget {
  ContentCard({@required this.item, this.type});

  final DocumentSnapshot item;
  final String type;

  @override
  Widget build(BuildContext context) {
    StateChanger listchange = Provider.of<StateChanger>(context);

    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detail_screen(
                  placeDocument: item,
                  placeType: type,
                )));
      },

      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(contentCardHeight, context),
                      width: getProportionateScreenWidth(contentCardWidth, context),

                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(item.data()['imageUrl'],),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    FavouriteButton(id: item.id, type: type, listChange: listchange,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Container(
                    //height: getProportionateScreenHeight(contentCardHeight, context),
                    width: getProportionateScreenWidth(contentCardWidth, context),
                    child: Text(item.data()['name'],
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      //maxLines: 2,
                      style: TextStyle(fontSize: getProportionateScreenWidth(20, context),
                        fontWeight: FontWeight.bold, color: ktextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
