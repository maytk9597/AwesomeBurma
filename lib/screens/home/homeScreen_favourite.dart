import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Components/place_card.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/favourite.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/home/empty_favourite_screen.dart';
import 'package:travel_guide/screens/home/homeScreen_body.dart';
import 'package:travel_guide/screens/home/home_screen.dart';
import 'package:travel_guide/screens/list/state_changer.dart';

class HomeScreen_favourite extends StatefulWidget {
  const HomeScreen_favourite({Key key}) : super(key: key);

  @override
  _HomeScreen_favouriteState createState() => _HomeScreen_favouriteState();
}

class _HomeScreen_favouriteState extends State<HomeScreen_favourite> {
  @override
  void initState() {
    // TODO: implement initState
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("in homeScreen_favourite");
    bool isEmptyList;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    StateChanger listChange = Provider.of<StateChanger>(context);
    // List<Favourite> favListChange = listChange.getFavouriteList;
    readData();
    // listChange.changeFavourite();
    print("before favlist");
    if (required_data.favList.isEmpty) {
      print("Favlist is empty");
      isEmptyList = true;
    } else
      print("FavList is not empty");
      isEmptyList = false;
    print("FavList length = ${required_data.favList.length}");
    print("dark mode = ${required_data.dark.toString()}");
    int length = required_data.favList.length;
    return isEmptyList
        ? EmptyList()
        : ListView.builder(
            itemCount: length,
            itemBuilder: (context, index) {
              print("FavList length = ${required_data.favList.length}");
              print("dark mode = ${required_data.dark.toString()}");
              // var name = _firestore.collectionGroup("Attractions").
              if(length > 0)
                // print("")
                print("?????? type = ${required_data.favList[0].type}");
              else
                print("??????????????????");
              return StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collectionGroup(required_data.favList[index].type.toString())
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("^^^^^^^^ has data");
                      int length = snapshot.data.docs.length;
                      print("length of snapshot = $length");
                      for(int i = 0 ; i < snapshot.data.docs.length; i++){
                        print("name name = ${snapshot.data.docs[i]['name']}");
                        if (snapshot.data.docs[i].id ==
                            required_data.favList[index].id) {
                          DocumentSnapshot favourite = snapshot.data.docs[i];
                          return Dismissible(
                            background: stackBehindDismiss(),
                            key: ObjectKey(required_data.favList[index]),
                            child: Container(
                              child: Place_card(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                placeDocument: favourite,
                                placeType: required_data.favList[index].type,
                                isHome: false,
                              ),
                            ),
                            onDismissed: (direction) async {
                              var item = required_data.favList.elementAt(index);

                              deleteItem(index);
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  duration: const Duration(seconds: 1),
                                  content: Text("Item deleted"),
                                  action: SnackBarAction(
                                      label: "UNDO",
                                      onPressed: () {
                                        undoDeletion(index, item);
                                      })));
                            },
                          );
                        }
                        // else
                        //   return Text("no data..............");
                      }
                      // return Text("no data");
                      print(snapshot.data.docs.length.toString() + "111 &&&&&&&&&&&");
                      // for (int i = 0; i < snapshot.data.docs.length; i++) {
                      //   print("i = $i");
                      //   print("snapshot id = ${snapshot.data.docs[i].id}");
                      //   print("snapshot name = ${snapshot.data.docs[i]['name']}");
                      //   print("data id = ${required_data.favList[index].id}");
                      //   if (snapshot.data.docs[i].id ==
                      //       required_data.favList[index].id) {
                      //     DocumentSnapshot favourite = snapshot.data.docs[i];
                      //     return Dismissible(
                      //       background: stackBehindDismiss(),
                      //       key: ObjectKey(required_data.favList[index]),
                      //       child: Container(
                      //         child: Place_card(
                      //           height: 150,
                      //           width: MediaQuery.of(context).size.width,
                      //           placeDocument: favourite,
                      //           placeType: required_data.favList[index].type,
                      //           isHome: false,
                      //         ),
                      //       ),
                      //       onDismissed: (direction) async {
                      //         var item = required_data.favList.elementAt(index);
                      //
                      //         deleteItem(index);
                      //         Scaffold.of(context).showSnackBar(SnackBar(
                      //             duration: const Duration(seconds: 1),
                      //             content: Text("Item deleted"),
                      //             action: SnackBarAction(
                      //                 label: "UNDO",
                      //                 onPressed: () {
                      //                   undoDeletion(index, item);
                      //                 })));
                      //       },
                      //     );
                      //   }
                      //   else
                      //     return Text("no data..........");
                      // }
                      print(snapshot.data.docs.length.toString() + "&&&&&&&&&&&");

                      return Text("no data");
                    } else {
                      print("^^^^^^^^ no data");
                      return Center(child: CircularProgressIndicator());
                    }

                  });
            });
  }

  void deleteItem(index) async {
    await readData();
    setState(() {
      required_data.favList.removeAt(index);
    });

    await writeData(required_data);
  }

  void undoDeletion(index, item) async {
    setState(() {
      required_data.favList.insert(index, item);
    });

    await writeData(required_data);
  }

  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Center(
        child: Icon(
          Icons.delete,
          size: getProportionateScreenWidth(40, context),
          color: Colors.white,
        ),
      ),
    );
  }
}
