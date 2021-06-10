import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/size_config.dart';
import 'package:travel_guide/Components/textStyle.dart';


class ContentCard extends StatelessWidget {
  ContentCard({@required this.item, this.type});

  final DocumentSnapshot item;
  Text type;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){},

      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(contentCardHeight, context),
                      width: getProportionateScreenWidth(contentCardWidth*2.4, context),

                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(item.data()['imageUrl'],),
                            fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [BoxShadow(
                              color: Colors.black12, spreadRadius: 2, blurRadius: 3)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        //height: getProportionateScreenHeight(contentCardHeight, context),
                        width: getProportionateScreenWidth(contentCardWidth*2.3, context),
                        child: Text(item.data()['name'],
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                          //maxLines: 2,
                          style: TextStyle(fontSize: getProportionateScreenWidth(18, context),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(child: IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.bookmark_border,
                size: getProportionateScreenWidth(35, context),
                color: Colors.black,
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

