import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/screens/list/item.dart';
import 'package:travel_guide/screens/list/state_changer.dart';
//import 'package:travel_guide/size_config.dart';
import 'title_list.dart';

import 'content_card.dart';

class ContentList extends StatefulWidget {

  ContentList({@required this.city, @required this.type, this.sub_type});

  final String city;
  final String type;
  dynamic sub_type;

  static var default_stream;
  static List<Item> documentSnapshotList = <Item>[];

  @override
  _ContentListState createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    ContentList.default_stream = _firestore.collection('cities').doc(widget.city).
    collection(widget.type).snapshots();
    List<DocumentSnapshot> newList = List <DocumentSnapshot>();

    return StreamBuilder<QuerySnapshot>(
      stream: ContentList.default_stream,
      builder: (context, snapshot){
        if(snapshot.hasData){
          ContentList.documentSnapshotList.clear();
          int length = snapshot.data.docs.length;
          //print("length = $length");//print(snapshot.data.docs[0]['name']);
          newList = List <DocumentSnapshot>();
          for(int i = 0 ; i < length; i ++){
            if(widget.sub_type != "All"){
              if(snapshot.data.docs[i]['type'] == widget.sub_type){
                newList.add(snapshot.data.docs[i]);
              }
            }
            else
              newList.add(snapshot.data.docs[i]);
              Item item = new Item(data: snapshot.data.docs[i], type: widget.type);
              ContentList.documentSnapshotList.add(item);
          }
          //print("length of new list = ${newList.length}");
          return Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: List.generate(newList.length, (index){
                    DocumentSnapshot item = newList[index];
                    //print("index = $index");
                    //ContentList.documentSnapshotList.add(item);
                    return ContentCard(
                      item: item,
                      type: widget.type,
                    );
                  }),
                )
            ),
          );
        }
        else{
          print("no data in list # In ContentList");
          return Text('no data');
        }
      },
    );
  }
}