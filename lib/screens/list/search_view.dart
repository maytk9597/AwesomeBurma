import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/list/search_screen.dart';
import 'package:travel_guide/models/size_config.dart';
import 'content_list.dart';

class SearchView extends StatefulWidget {
  SearchView({this.city, this.type, this.search, this.searchAll});

  final String city;
  final String type;
  final bool search;
  final bool searchAll;

  static bool search_;

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  var _searchView = new TextEditingController();
  bool _firstSearch = false;
  String _query = "";
  //List <dynamic> _list = <dynamic>[];
  List<DocumentSnapshot> _filterList = <DocumentSnapshot>[];

  @override
  void initState() {
    super.initState();
    //ContentList.default_stream;
    SearchView.search_ = widget.search;
    if(ContentList.documentSnapshotList != null){
      int length = ContentList.documentSnapshotList.length;
      print("In search view , length = $length");
    }
    else{
      print("In search view, list is null");
    }
  }

  _SearchViewState(){
    _searchView.addListener(() {
      if(_searchView.text.isEmpty || widget.search == false){
        print("EMPTY empty empty empty empty");
        setState(() {
          _firstSearch = false;
           _query = "";
        });
      }
      else
        SearchView.search_ = true;
        setState(() {
          _firstSearch = true;
          _query = _searchView.text;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    //widget.search = false;
    return widget.search ? Expanded(
      child:  Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(20, context),),
          _createSearchView(),
          if(widget.search) _performSearch(), //else Container(height: 400, color: kMainColor,),
          //if(widget.searchAll) _performSearchAll(),
        ],
      ),
    ): _createSearchView();
  }

  Widget _performSearch() {
    print("In perform Search");
    _filterList = new List<DocumentSnapshot>();
    int length = ContentList.documentSnapshotList.length;

    for(int i = 0; i < length; i++){
      DocumentSnapshot item = ContentList.documentSnapshotList[i];

      if(item.data()['name'].toString().toLowerCase().contains(_query.toLowerCase())){
        _filterList.add(item);
      }
    }
    if(_query == "") _filterList.clear();
    print("length of filter list = $length");

    return _filteredListView();
  }

  // Widget _performSearchAll(){
  //   FirebaseFirestore _firebase = FirebaseFirestore.instance;
  //   return StreamBuilder<QuerySnapshot>(
  //     //stream: _firebase.collection('cities').snapshots(),
  //     builder: (context, snapshot){
  //       if(snapshot.hasData){
  //         int length = snapshot.data.docs.length;
  //         List.generate(length, (index){
  //           String city = snapshot.data.docs[index]['city_name'];
  //           return StreamBuilder<QuerySnapshot>(
  //             stream: _firebase.collection('cities').doc(city).collection(collectionPath),
  //             builder: (context, snapshot2){
  //               if(snapshot2.hasData)
  //             },
  //           );
  //         });
  //       }
  //       else{
  //         return Text("no data");
  //       }
  //     },
  //   );
  //
  //   return _filteredListView();
  // }

  Widget _filteredListView(){
    if(widget.search)
    return Flexible(
      child: ListView.builder(
          itemCount: _filterList.length,
          itemBuilder: (context, index){
            return GestureDetector(

              //color: Colors.white60,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: getProportionateScreenHeight(25, context),
                  child: Text(_filterList[index].data()['name'],
                    style: TextStyle(fontSize: getProportionateScreenWidth(20, context)),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }

  Widget _createSearchView() {
    //bool enable = false;
    return Container(
        width: getProportionateScreenWidth(300, context),
        height: getProportionateScreenHeight(50, context),
        decoration: BoxDecoration(
          border: Border.all(color: ktextColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 10),
          child: TextField(
            onTap: (){
              if(widget.search == false){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => SearchScreen()));
              }
              print("click the text field");
              setState(() {});
            },
            focusNode: FocusNode(),
            enableInteractiveSelection: false,
            cursorColor: ktextColor,
            controller: _searchView,
            style: TextStyle(
              //height: getProportionateScreenHeight(2, context),// cursor height
              fontSize: getProportionateScreenWidth(18, context),
              color: Colors.black,
            ),
            decoration: InputDecoration(
              focusColor: ktextColor,
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: new TextStyle(color: ktextColor, fontSize: 20),
            ),
            textAlign: TextAlign.left,
          ),
        )
    );
  }
}