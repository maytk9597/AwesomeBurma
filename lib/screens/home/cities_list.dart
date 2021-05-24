import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/city_card.dart';
import 'package:travel_guide/Components/textStyle.dart';

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
            return Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Cities",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: ktextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Column(
                      children: List.generate(length, (index) {
                    DocumentSnapshot city = snapshot.data.docs[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: City_card(city: city),
                    );
                  })),
                )
              ],
            );
          } else {
            return Text('no data fetched');
          }
        });
  }
}
