import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/detail_screen/detail_screen.dart';
import 'package:travel_guide/size_config.dart';

class Place_card extends StatelessWidget {
  const Place_card({
    Key key,
    @required this.placeDocument,
  }) : super(key: key);

  final DocumentSnapshot placeDocument;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tap on recommendation');
        print(placeDocument['imageUrl']);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detail_screen(
                      imageUrl: placeDocument['imageUrl'],
                      name: placeDocument['name'],
                      type: placeDocument['type'],
                      description: placeDocument['description'],
                      address: placeDocument['address'],
                    )));
      },
      child: Stack(children: [
        Container(
          margin: EdgeInsets.all(10.0),
          width: getProportionateScreenWidth(130, context),
          height: getProportionateScreenWidth(180, context),
          decoration: BoxDecoration(
            // image: DecorationImage(
            //     image: NetworkImage(recommendationPlace['imageUrl']),
            //     fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.purple[100], spreadRadius: 2, blurRadius: 3)
            // ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // margin: EdgeInsets.all(10.0),
                width: getProportionateScreenWidth(130, context),
                height: getProportionateScreenWidth(130, context),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(placeDocument['imageUrl']),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12, spreadRadius: 2, blurRadius: 3)
                    ]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeDocument['name'],
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18, context),
                        color: ktextColor,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    placeDocument['address'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(15, context),
                        color: ktextColor,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

// return Padding(
//   padding: EdgeInsets.only(left: 20.0),
//   child: GestureDetector(
//     onTap: () {},
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//             child: AspectRatio(
//           aspectRatio: 1.02,
//           child: Container(
//             // padding: EdgeInsets.all(5.0),
//             decoration: BoxDecoration(
//                 color: ktextColor.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(15),
//                 image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(recommendationPlace['imageUrl']))),
//           ),
//         )),
//         SizedBox(
//           height: 5.0,
//         ),
//         Text(
//           recommendationPlace['name'],
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(color: ktextColor, fontSize: 20),
//           maxLines: 2,
//           softWrap: false,
//         )
//       ],
//     ),
//   ),
// );
