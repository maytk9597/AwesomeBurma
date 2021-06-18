import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travel_guide/screens/list/search_view.dart';
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
  static var content;

  @override
  _TitleListState createState() => _TitleListState();
}

class _TitleListState extends State<TitleList> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int t; String type;

  @override
  Widget build(BuildContext context) {
    TitleList.myList = List <dynamic>();
    List <dynamic> newList = List <dynamic>();

    print('type = ${widget.type}');
    if(widget.type == 'Attractions_type'){
      t = 0;
      type = 'Attractions';
    }
    else if(widget.type == 'Hotels_type'){
      t = 1;
      type = 'Hotels';
    }
    else if(widget.type == 'Restaurants_type'){
      t = 2;
      type = 'Restaurants';
    }
    TitleList.content = _firestore.collection('cities').doc(widget.city).
    collection(type).snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: TitleList.content,
      builder: (context, snapshot){
        if(snapshot.hasData){
          int l = snapshot.data.docs.length;
          for(int i = 0 ; i < l; i++){
            if(TitleList.myList == null)
              TitleList.myList.add(snapshot.data.docs[i]['type']);
            else if(!TitleList.myList.contains(snapshot.data.docs[i]['type']) &&
            snapshot.data.docs[i]['type'].toString() != "")
              TitleList.myList.add(snapshot.data.docs[i]['type']);
          }
          TitleList.myList.sort();
          newList.clear();
          newList.add("All");
          newList.addAll(TitleList.myList);

          int length = newList.length;
          //int length = TitleList.myList.length;
          //print("Length of title list = $length");

          return Container(
            width: MediaQuery.of(context).size.width,
            height: getProportionateScreenHeight(70, context),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
              child: Row(
                children: List.generate(length, (index){
                  dynamic title = newList[index];
                  //print(new_list[index].runtimeType);
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
                        if(newList.contains(Provider.of<StateChanger>(context).sub))
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