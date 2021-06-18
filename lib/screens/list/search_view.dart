import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/list/item.dart';
import 'package:travel_guide/screens/list/search_screen.dart';
import 'package:travel_guide/models/size_config.dart';
import 'content_list.dart';
enum search_type { search, searchAll}

class SearchView extends StatefulWidget {
  SearchView({this.city, this.type, this.searchType, this.search, });

  final String city;
  final String type;
  final search_type searchType;
  final bool search;
  //final bool searchAll;

  static bool search_;
  static List<Item> searchList = <Item>[];


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
    if(SearchView.searchList.length != 0)
      SearchView.searchList.clear();
    getAllData();

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
    //getAllData();
    if(widget.searchType == search_type.search){
      return widget.search ? Expanded(
        child:  Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(20, context),),
            _createSearchView(true),
            _performSearch(),
            // if(widget.search) _performSearch(),
            // if(widget.searchAll) _performSearchAll(_query)//else Container(height: 400, color: kMainColor,),
          ],
        ),
      ):_createSearchView(false);
    }
    else if(widget.searchType == search_type.searchAll){
      return widget.search ? Expanded(
        child:  Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(20, context),),
            _createSearchView(true),
            _performSearchAll(),
            // if(widget.search) _performSearch(),
            // if(widget.searchAll) _performSearchAll(_query)//else Container(height: 400, color: kMainColor,),
          ],
        ),
      ):_createSearchView(false);
    }
    return Text("wrong Type");
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

  void getAllData() async{
    //SearchView.searchList.clear();
    FirebaseFirestore _firebase = FirebaseFirestore.instance;
    var attractions = await _firebase.collectionGroup('Attractions').get();
    var hotels = await _firebase.collectionGroup('Hotels').get();
    var restaurants = await _firebase.collectionGroup('Restaurants').get();
    int a_length = attractions.docs.length;
    int h_length = hotels.docs.length;
    int r_length = restaurants.docs.length;
    print("length of attractions = $a_length");
    print("length of hotels = $h_length");
    print("length of restaruants = $r_length");
    print("total length = ${a_length + h_length + r_length}");
    for(int i = 0 ; i < a_length ; i++){
      SearchView.searchList.add(Item(data: attractions.docs[i], type: 'Attractions'));
      //print("Attraction name = ${attractions.docs[i]['name'].toString()}");
    }
    for(int i = 0 ; i < h_length ; i++){
      SearchView.searchList.add(Item(data: hotels.docs[i], type: 'Hotels'));
    }
    for(int i = 0 ; i < r_length ; i++){
      SearchView.searchList.add(Item(data: restaurants.docs[i], type: 'Restaurants'));
    }
    print("Search view list lenght 1 = ${SearchView.searchList.length}");
  }

  Widget _performSearchAll(){

    _filterList = new List<DocumentSnapshot>();
    int length = SearchView.searchList.length;
    print("Search view list length 2 = $length");

    if(_query == "") _filterList.clear();

    for(int i = 0; i < length; i++){
      DocumentSnapshot item = SearchView.searchList[i].data;

      if(item.data()['name'].toString().toLowerCase().contains(_query.toLowerCase())){
        _filterList.add(item);
      }
    }
    if(_query == "") _filterList.clear();
    print("length of filter list = ${_filterList.length}");

    return _filteredListView();
  }

  Widget _filteredListView(){
    if(widget.search)
      return Flexible(
        child: ListView.builder(
            itemCount: _filterList.length,
            itemBuilder: (context, index){
              return Card(
                //color: Colors.white60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: getProportionateScreenHeight(60, context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_filterList[index].data()['name'],
                          style: TextStyle(fontSize: getProportionateScreenWidth(20, context)),
                        ),
                        Text(_filterList[index].data()['address'], overflow: TextOverflow.clip, maxLines: 1,
                            style: TextStyle(fontSize: getProportionateScreenWidth(14, context), color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      );
  }

  Widget _createSearchView(bool active) {
    //bool enable = false;
    return Container(
        width: getProportionateScreenWidth(313, context),
        height: getProportionateScreenHeight(60, context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            // color: Color(0xFF3E4067),
              color: ktextColor,
              width: getProportionateScreenWidth(2, context)),
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.16),
              spreadRadius: -2,
            )
          ],
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => SearchScreen(searchType: widget.searchType,)));
            print("click the button behind text field");
          },
          child: TextField(

            enabled: active,
            cursorColor: ktextColor,
            controller: _searchView,
            style: TextStyle(
              //height: getProportionateScreenHeight(2, context),// cursor height
              fontSize: getProportionateScreenWidth(18, context),
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search your destination…",
              hintStyle: TextStyle(
                  fontSize: getProportionateScreenWidth(18, context),
                  color: ktextColor),
              suffixIcon: Icon(
                Icons.search,
                color: ktextColor,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20, context),
                vertical: getProportionateScreenWidth(10, context),
              ),
            ),
            textAlign: TextAlign.left,
          ),
        )
    );
  }
}