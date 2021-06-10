import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/models/favourite.dart';
import 'package:travel_guide/screens/detail_screen/detail_screen.dart';
import 'package:travel_guide/models/size_config.dart';

class Detail_header extends StatefulWidget {
  const Detail_header(
      {Key key, @required this.placeDocument, @required this.placeType})
      : super(key: key);

  final DocumentSnapshot placeDocument;
  final String placeType;

  @override
  _Detail_headerState createState() => _Detail_headerState();
}

class _Detail_headerState extends State<Detail_header> {
  // bool isFavourite = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("inside initState");
    readData();

    print("${favouriteList.length.toString()}");
  }

  checkFavourite() {
    int flag = 1;
    if (favouriteList.isEmpty) {
      return false;
    } else {
      for (int i = 0; i < favouriteList.length; i++) {
        if (favouriteList[i].id == widget.placeDocument.id) {
          flag = flag * (-1);
        } else
          flag = flag * 1;
      }
    }
    if (flag < 1) {
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    bool isFavourite = checkFavourite();
    print(isFavourite.toString());

    return Container(
      width: double.infinity,
      // height: 400,
      child: Stack(
        children: [
          Container(
            height: getProportionateScreenHeight(300, context),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(30),
              //   bottomRight: Radius.circular(30),
              // ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.placeDocument['imageUrl']),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20, context)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: getProportionateScreenWidth(24, context),
                    ),
                  ),
                ),
                Spacer(),
                // Icon(
                //   Icons.share,
                //   color: Colors.white,
                //   size: getProportionateScreenWidth(24, context),
                // ),
                SizedBox(
                  width: getProportionateScreenWidth(26, context),
                ),
                IconButton(
                    icon: Icon(
                      Icons.bookmark,
                      color: isFavourite ? Colors.purple : Colors.white,
                      // color: Colors.white,
                      size: getProportionateScreenWidth(26, context),
                    ),
                    onPressed: () async {
                      await writeData(favouriteList);
                      await readData();
                      int index;
                      int flag = 1;
                      print(widget.placeDocument.id.toString());
                      print(widget.placeType.toString());
                      print(favouriteList.length.toString());
                      print("add to favourite");
                      // if (favouriteList.length == 0) {
                      //   print("There is no data in local file");
                      //   favouriteList.add(Favourite(
                      //       id: widget.placeDocument.id.toString(),
                      //       type: widget.placeType));
                      //   await writeData(favouriteList);
                      // } else {
                      //   for (int i = 0; i < favouriteList.length; i++) {
                      //     if (favouriteList[i].id == widget.placeDocument.id) {
                      //       print("same item inside the local file");
                      //       flag = flag * (-1);
                      //       index = i;
                      //       // favouriteList.removeAt(i);
                      //       // await writeData(favouriteList);
                      //       // print("After removing data");
                      //     } else {
                      //       print("no same item inside the local file");
                      //       flag = flag * 1;
                      //       // favouriteList.add(Favourite(
                      //       //     id: widget.placeDocument.id.toString(),
                      //       //     type: widget.placeType));
                      //       // await writeData(favouriteList);
                      //     }
                      //   }

                      // }
                      for (int i = 0; i < favouriteList.length; i++) {
                        if (favouriteList[i].id == widget.placeDocument.id) {
                          print("same item inside the local file");
                          flag = flag * (-1);
                          index = i;
                          // favouriteList.removeAt(i);
                          // await writeData(favouriteList);
                          // print("After removing data");
                        } else {
                          print("no same item inside the local file");
                          flag = flag * 1;
                          // favouriteList.add(Favourite(
                          //     id: widget.placeDocument.id.toString(),
                          //     type: widget.placeType));
                          // await writeData(favouriteList);
                        }
                      }
                      if (flag < 1) {
                        favouriteList.removeAt(index);
                        await writeData(favouriteList);
                        print("After removing data");
                        setState(() {
                          isFavourite
                              ? isFavourite = false
                              : isFavourite = true;
                        });
                      } else {
                        favouriteList.add(Favourite(
                            id: widget.placeDocument.id.toString(),
                            type: widget.placeType));
                        await writeData(favouriteList);
                        setState(() {
                          isFavourite
                              ? isFavourite = false
                              : isFavourite = true;
                        });
                      }
                      await readData();

                      // setState(() {
                      //   isFavourite ? isFavourite = false : isFavourite = true;
                      // });
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
