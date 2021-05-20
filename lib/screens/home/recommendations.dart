import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
            .collection('attractions')
            // .where('recommendations', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('inside data fetched');
            return Column(
              children: <Widget>[Text('Data fetched')],
            );
          } else {
            return Text('no data fetched');
          }
        });
  }
}
