import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_guide/Components/city_card.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/home/section_title.dart';
import 'package:travel_guide/models/size_config.dart';

class Cities_list extends StatefulWidget {
  const Cities_list({
    Key key,
  }) : super(key: key);

  @override
  _Cities_listState createState() => _Cities_listState();
}

class _Cities_listState extends State<Cities_list> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('cities').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            int length = snapshot.data.docs.length;
            print("city length = " + length.toString());

            return Column(children: [
              Row(
                children: [SectionTitle(text: 'Cities')],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10, context),
              ),
              // Container(
              //     child: Wrap(
              //         spacing: 8, //vertical spacing
              //         runSpacing: 8, //horizontal spacing
              //         alignment: WrapAlignment.center,
              //         crossAxisAlignment: WrapCrossAlignment.center,
              //         children: [
              //       ListView.builder(
              //         itemCount: length,
              //         itemBuilder: (context, index) {
              //           return City_card(city: snapshot.data.docs[index]);
              //         },
              //       ),
              //     ]))
              Container(
                child: StaggeredGridView.countBuilder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: length,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 5,
                    crossAxisCount: 4,
                    itemBuilder: (context, index) {
                      print("inside grid view " + index.toString());
                      print("snapshot data " +
                          snapshot.data.docs[index]['city_name'].toString());
                      return City_card(city: snapshot.data.docs[index]);
                    },
                    staggeredTileBuilder: (index) {
                      bool lastIndex = false;
                      if (index == length - 1 && length.isOdd)
                        lastIndex = true;
                      else
                        lastIndex = false;

                      return StaggeredTile.count(
                          lastIndex ? 4 : 2, index.isOdd ? 2 : 2.5);
                    }),
              )
            ]);
          } else {
            return Text('no data fetched');
          }
        });
  }
}

// return Column(
//   children: [
//     Row(
//       children: [SectionTitle(text: 'Cities')],
//     ),
//     SizedBox(
//       height: 20.0,
//     ),
//     Container(
//       child: Column(
//           children: List.generate(length, (index) {
//         // bool recommendation = false;
//         DocumentSnapshot city = snapshot.data.docs[index];
//         // _firestore
//         //     .collection('cities')
//         //     .doc(city.id)
//         //     .collection('Attractions')
//         //     .add({
//         //   'name': "",
//         //   'address': "",
//         //   'description': "",
//         //   'recommendation': recommendation,
//         //   'imageUrl': "",
//         //   'note': "",
//         //   'type': ""
//         // });
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10.0),
//           child: City_card(city: city),
//         );
//       })),
//     )
//   ],
// );
