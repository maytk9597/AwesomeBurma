import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'content_card.dart';

class ContentList extends StatefulWidget {

  ContentList({@required this.city, @required this.type, this.sub_type});

  final String city;
  final String type;
  dynamic sub_type;

  static Stream<QuerySnapshot> default_stream;
  static List<DocumentSnapshot> documentSnapshotList = <DocumentSnapshot>[];

  @override
  _ContentListState createState() => _ContentListState();

}

class _ContentListState extends State<ContentList> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> stream;
    ContentList.default_stream = _firestore.collection('cities').doc(widget.city).
    collection(widget.type).snapshots();

    if(widget.sub_type == 'All'){
      //print('**** sub_type = all');
          stream = ContentList.default_stream;
    }
    else  {
      //print('*** Not all // sub_type = ${widget.sub_type}');
      stream = _firestore.collection('cities').doc(widget.city).
      collection(widget.type).where('type', isEqualTo: widget.sub_type.toString()).snapshots();
    }

    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot){
        if(snapshot.hasData){
          ContentList.documentSnapshotList.clear();
          //print("???" + snapshot.data.docs[0].data()['type'].toString());
          int length = snapshot.data.docs.length;
          print("length = $length");//print(snapshot.data.docs[0]['name']);
          //print("first item is =  " + snapshot.data.docs[0].data()['name'].toString());
          return Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                dragStartBehavior: DragStartBehavior.start,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: List.generate(length, (index){
                    DocumentSnapshot item = snapshot.data.docs[index];
                    //print("index = $index");
                    ContentList.documentSnapshotList.add(item);
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