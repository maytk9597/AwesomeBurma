import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/list/content_list.dart';
import 'package:travel_guide/screens/list/search_view.dart';
import 'title_list.dart';
import 'state_changer.dart';

class List_View_Screen extends StatelessWidget {

  List_View_Screen({@required this.type, @required this.city, @required this.sub_type});

  final String type;
  final String city;
  final dynamic sub_type;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          children: <Widget>[

            SizedBox(height: getProportionateScreenHeight(20, context),),

            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, size: 30, color: ktextColor,),
                    onPressed: (){
                      Navigator. pop(context);
                    },
                  )
                ),
                Center(
                  child: Text("  " + type, textAlign: TextAlign.center,
                    style: TextStyle(fontSize: size, color: ktextColor, fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],

            ),

            SizedBox(height: getProportionateScreenHeight(5, context),),

            SearchView(city: city, type: type, searchType: search_type.search, search: false,),

            SizedBox(height: getProportionateScreenHeight(5, context),),

            TitleList(city: city, type: type +'_type',),

            ContentList(city: city, type: type,
              sub_type: TitleList.myList.contains(Provider.of<StateChanger>(context).sub) ?
              Provider.of<StateChanger>(context).sub  : "All"),

          ],
        ),
      ),
    );
  }
}
