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
    bool isEmptyList;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    StateChanger listChange = Provider.of<StateChanger>(context);
    // List<Favourite> favListChange = listChange.getFavouriteList;
    // readData();
    // listChange.changeFavourite();
    if (favouriteList.isEmpty) {
      isEmptyList = true;
    } else
      isEmptyList = false;

    return isEmptyList
        ? EmptyList()
        : ListView.builder(
        itemCount: favouriteList.length,
        itemBuilder: (context, index) {
          return StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collectionGroup(favouriteList[index].type.toString())
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int length = snapshot.data.docs.length;
                  for (int i = 0; i < length; i++) {
                    if (snapshot.data.docs[i].id ==
                        favouriteList[index].id) {
                      DocumentSnapshot favourite = snapshot.data.docs[i];
                      return Dismissible(
                        background: stackBehindDismiss(),
                        key: ObjectKey(favouriteList[index]),
                        child: Container(
                          child: Place_card(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            placeDocument: favourite,
                            placeType: favouriteList[index].type,
                            isHome: false,
                          ),
                        ),
                        onDismissed: (direction) async {
                          var item = favouriteList.elementAt(index);

                          deleteItem(index);
                          Scaffold.of(context).showSnackBar(SnackBar(
                              duration: const Duration(seconds: 3),
                              content: Text("Item deleted"),
                              action: SnackBarAction(
                                  label: "UNDO",
                                  onPressed: () {
                                    undoDeletion(index, item);
                                  })));
                        },
                      );
                    }
                  }
                  print(snapshot.data.docs.length);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              });
        });
  }

  void deleteItem(index) async {
    await readData();
    setState(() {
      favouriteList.removeAt(index);
    });

    await writeData(favouriteList);
  }

  void undoDeletion(index, item) async {
    setState(() {
      favouriteList.insert(index, item);
    });

    await writeData(favouriteList);
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