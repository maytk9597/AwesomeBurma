import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/place_card.dart';
import 'package:travel_guide/screens/home/section_title.dart';
import 'package:travel_guide/models/size_config.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({
    Key key,
    @required this.cityId,
  }) : super(key: key);

  final String cityId;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    print(cityId + " inside Attraction List");
    // return Container();
    return StreamBuilder(
        stream: _firestore
            .collection('cities')
            .doc(cityId)
            .collection('Restaurants')
            .where('recommendation', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            int length = snapshot.data.docs.length;
            print(snapshot.data.docs.length.toString() +
                " inside fetch data for restaurants");
            return Column(
              children: <Widget>[
                Row(
                  children: [SectionTitle(text: 'Top Restaurants')],
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: getProportionateScreenHeight(250, context),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(length, (index) {
                        // _firestore
                        //     .collection('cities')
                        //     .doc(cityId)
                        //     .collection('Restaurants')
                        //     // .doc(snapshot.data.docs[index].id)
                        //     .add({
                        //   'remark': "Open Everyday",
                        //   'description': "",
                        //   'imageUrl': "",
                        //   'name': "",
                        //   'note': "",
                        //   'openingHours': "7 A.M - 9 P.M ",
                        //   'ph_no': "Not Available",
                        //   'type': "",
                        //   'recommendation': false,
                        //   'address': "",
                        // });
                        DocumentSnapshot recommendationPlace =
                            snapshot.data.docs[index];
                        return Place_card(
                          height: 120,
                          width: 200,
                          isHome: false,
                          placeDocument: recommendationPlace,
                          placeType: "Restaurants",
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
            ;
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
