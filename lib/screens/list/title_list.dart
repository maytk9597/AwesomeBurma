import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_guide/screens/list/state_changer.dart';
import 'title_card.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:provider/provider.dart';


bool showContainer = false;

class TitleList extends StatefulWidget {

  TitleList({ @required this.type, this.city, });

  final dynamic type;
  String city;
  static List<dynamic> myList = List<dynamic>();
  static dynamic selectedTitle = 'All';

  @override
  _TitleListState createState() => _TitleListState();
}

class _TitleListState extends State<TitleList> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


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

          TitleList.myList = snapshot.data.docs[t]['type'];
          int length = TitleList.myList.length;

          return Container(
            width: MediaQuery.of(context).size.width,
            height: getProportionateScreenHeight(70, context),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
              child: Row(
                children: List.generate(length, (index){
                  dynamic title = TitleList.myList[index];
                  print(TitleList.myList[index].runtimeType);
                  dynamic title2;
                  if(widget.type == 'Hotels_type' && title != 'All')
                    title2 = title + ' star';
                  else
                    title2 = title;
                  return TitleCard(

                    sub_type: title,
                    sub_type_name: title2,
                    onPress: () {
                      //print("pressed!!!!");
                      Provider.of<StateChanger>(context).changeState(title);
                      setState(() {
                        if(TitleList.myList.contains(Provider.of<StateChanger>(context).sub))
                          TitleList.selectedTitle = title;
                        else
                          TitleList.selectedTitle = "All";
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