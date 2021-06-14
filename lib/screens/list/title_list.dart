import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_guide/screens/list/state_changer.dart';
import 'title_card.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:provider/provider.dart';

dynamic selectedTitle = 'All';
bool showContainer = false;

class TitleList extends StatefulWidget {

  TitleList({ @required this.type, this.city, });

  final dynamic type;
  String city;

  @override
  _TitleListState createState() => _TitleListState();
}

class _TitleListState extends State<TitleList> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<dynamic> myList = List<dynamic>();
  int t;

  @override
  Widget build(BuildContext context) {

    print('type = ${widget.type}');

    if(widget.type == 'Attractions_type')
      t = 0;
    else if(widget.type == 'Hotels_type')
      t = 1;
    else if(widget.type == 'Restaurants_type')
      t = 2;

    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('type').snapshots(),
      builder: (context, snapshot){

        if(snapshot.hasData){

          myList = snapshot.data.docs[t]['type'];
          int length = myList.length;

          return Container(
            width: MediaQuery.of(context).size.width,
            height: getProportionateScreenHeight(70, context),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
              child: Row(
                children: List.generate(length, (index){
                  dynamic title = myList[index];
                  print(myList[index].runtimeType);
                  dynamic title2;
                  if(widget.type == 'Hotels_type' && title != 'All')
                    title2 = title + ' star';
                  else
                    title2 = title;
                  //print("title = $title");
                  return TitleCard(

                    sub_type: title,
                    sub_type_name: title2,
                    onPress: () {
                      print("pressed!!!!");
                      Provider.of<StateChanger>(context).changeState(title);
                      setState(() {
                        selectedTitle = title;
                        //Provider.of<StateChanger>(context).changeState(title);
                      });
                    },
                  );
                }),
              )
            ),
          );
        }
        else{
          print("no data  # In TitleList");
          return Text('no data');
        }
      },
    );
  }


}