import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/favourite.dart';
import 'package:travel_guide/models/favouriteButton.dart';
import 'package:travel_guide/models/heartPainter.dart';
import 'package:travel_guide/screens/detail_screen/detail_screen.dart';
import 'package:travel_guide/models/size_config.dart';
import 'package:travel_guide/screens/list/state_changer.dart';

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

    print("${required_data.favList.length.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    StateChanger listChange = Provider.of<StateChanger>(context);
    String id = widget.placeDocument.id;
    String type = widget.placeType;

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
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(10, context),
                left: getProportionateScreenWidth(10, context)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await writeData(required_data);
                    await readData();
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
                  width: getProportionateScreenWidth(30, context),
                ),
                FavouriteButton(id: id, type: type, listChange: listChange)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
