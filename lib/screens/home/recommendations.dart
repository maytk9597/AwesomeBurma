import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/place_card.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/home/section_title.dart';
import 'package:travel_guide/models/size_config.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({
    Key key,
  }) : super(key: key);

  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collectionGroup('Attractions')
            .where('recommendation', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print('inside data fetched');
            int length = snapshot.data.docs.length;
            // print("recommendations length = " + length.toString());
            List<int> rndIndex = [];
            var rng = new Random();
            for (var i = 0; i < 7; i++) {
              int rnd = rng.nextInt(length);
              if (rndIndex.contains(rnd)) {
                i--;
              } else
                rndIndex.add(rnd);
            }
            // print("random index Number = ${rndIndex.toString()}");

            return Column(
              children: <Widget>[
                Row(
                  children: [SectionTitle(text: 'Recommendations')],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15, context),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: getProportionateScreenHeight(210, context),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(rndIndex.length, (index) {
                        int indexNumber = rndIndex[index];

                        print("inside list generate");
                        DocumentSnapshot recommendationPlace =
                            snapshot.data.docs[indexNumber];
                        return Place_card(
                          height: 120,
                          width: 200,
                          placeDocument: recommendationPlace,
                          placeType: "Attractions",
                          isHome: true,
                        );
                      }),
                    ),
                  ),
                )
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //       horizontal: getProportionateScreenWidth(20)),
                //   child: Text("Recommendations"),
                // )
              ],
            );
          } else {
            //print("no data fetch");
            return Text('no data fetched');
          }
        });
  }
}
