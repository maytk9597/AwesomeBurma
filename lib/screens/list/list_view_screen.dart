import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/home/search_field.dart';
import 'package:travel_guide/screens/list/content_list.dart';
import 'package:travel_guide/screens/list/search_view.dart';
import 'package:travel_guide/size_config.dart';
import 'title_list.dart';
import 'state_changer.dart';

class List_View_Screen extends StatelessWidget {

  List_View_Screen({@required this.type, @required this.city, @required this.sub_type});

  final String type;
  final String city;
  final dynamic sub_type;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   title: Center(child: KtitleText(title: type, fontSize: size, color: ktextColor,)),
        // ),
        
        body: Column(
          children: <Widget>[
            Center(child: Text(
              type,
              style: TextStyle(
                fontSize: size,
                color: ktextColor,
                fontWeight: FontWeight.bold,
              ),
            ),),
            //Center(child: KtitleText(title: type, fontSize: size, color: ktextColor,)),
            //Container(height: getProportionateScreenHeight(80, context),),
            SizedBox(height: getProportionateScreenHeight(5, context),),

            SearchView(city: city, type: type, search: false,),

            SizedBox(height: getProportionateScreenHeight(5, context),),

            TitleList(
              city: city,
              type: type +'_type',
            ),

            ContentList(
              city: city,
              type: type,
              sub_type: Provider.of<StateChanger>(context).sub,
            )
          ],
        ),
      ),
    );
  }

}
