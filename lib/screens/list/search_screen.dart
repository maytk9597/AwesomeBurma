import 'package:flutter/material.dart';
import 'package:travel_guide/screens/list/search_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'content_list.dart';
import 'content_card.dart';
import 'search_view.dart';

class SearchScreen extends StatelessWidget {

  String _query = "";
  List <dynamic> _list = <dynamic>[];
  List<DocumentSnapshot> _filterList = <DocumentSnapshot>[];

  SearchScreen({this.searchAll});
  final bool searchAll;

  @override
  Widget build(BuildContext context) {
    if(SearchView.search_) print("NOT NULL NOT NULL NOT NULL");
    else
      print("NULL NULL NULL");
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SearchView(search: true, searchAll: searchAll,),

              //if (SearchView.search_) _performSearch(),
            ],
          ),
        ),
      ),
    );
  }
}
