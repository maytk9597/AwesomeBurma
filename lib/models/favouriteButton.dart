import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/favourite.dart';
import 'package:travel_guide/models/heartPainter.dart';
import 'package:travel_guide/screens/list/state_changer.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({
    Key key,
    @required this.id,
    @required this.type,
    @required this.listChange,
  }) : super(key: key);

  final String id;
  final String type;
  final StateChanger listChange;

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  void initState() {
    // TODO: implement initState
    super.initState();
    print("inside initState");
    readData();

    print("${required_data.favList.length.toString()}");
  }

  checkFavourite() {
    int flag = 1;
    if (required_data.favList.isEmpty) {
      return false;
    } else {
      for (int i = 0; i < required_data.favList.length; i++) {
        if (required_data.favList[i].id == widget.id) {
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
    return RawMaterialButton(
      onPressed: () async {
        await writeData(required_data);
        await readData();
        int index;
        int flag = 1;
        // print(widget.placeDocument.id.toString());
        // print(widget.placeType.toString());
        print(required_data.favList.length.toString());
        print("add to favourite");

        for (int i = 0; i < required_data.favList.length; i++) {
          if (required_data.favList[i].id == widget.id) {
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
          required_data.favList.removeAt(index);
          await writeData(required_data);
          print("After removing data");
          setState(() {
            isFavourite ? isFavourite = false : isFavourite = true;
          });
        } else {
          required_data.favList
              .add(Favourite(id: widget.id.toString(), type: widget.type));
          await writeData(required_data);
          setState(() {
            isFavourite ? isFavourite = false : isFavourite = true;
          });
        }
        await readData();
        widget.listChange.changeFavourite();

        // setState(() {
        //   isFavourite ? isFavourite = false : isFavourite = true;
        // });
      },
      child: CustomPaint(
        size: Size(30, 33),
        painter:
            HeartPainter(fillColor: isFavourite ? kMainColor : Colors.white),
      ),
    );
  }
}
