import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/city_detail_screen/city_detail.dart';
import 'package:travel_guide/models/size_config.dart';

class City_card extends StatelessWidget {
  const City_card({
    Key key,
    @required this.city,
  }) : super(key: key);

  final DocumentSnapshot city;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    // bool recommendation = true;
    // print('inside city card');
    // print(city.data()['city_name']);

    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CityDetails(
                        city: city,
                      )));
          // _firestore
          //     .collection('cities')
          //     .doc(city.id)
          //     .collection('Attractions')
          //     .doc()
          //     .update({
          //   'remark': "Not Available",
          // });
        },
        child: Container(
          // height: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    kMainColor.withOpacity(0.6), BlendMode.dstATop),
                image: NetworkImage(
                  city.data()['city_imageUrl'],
                ),
                fit: BoxFit.cover,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                city.data()['city_name'],
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ktextColor,
                    fontSize: getProportionateScreenWidth(18, context)),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: ktextColor,
                    size: getProportionateScreenWidth(20, context),
                  ),
                  Expanded(
                    child: Text(
                      city.data()['city_type'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(15, context),
                          color: ktextColor,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              // Spacer(),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Colors.white),
              //   padding: EdgeInsets.all(5),
              // child: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: <Widget>[
              //     Icon(
              //       Icons.star,
              //       color: kGrey,
              //       size: 20,
              //     ),
              //     Text(
              //       places[index].rating.toString(),
              //     )
              //   ],
              // ),
              // )
            ],
          ),
        )
        // child: Container(
        //   margin: EdgeInsets.only(bottom: 8),
        //   decoration: BoxDecoration(
        //       color: Color(0xffF3E7F7), borderRadius: BorderRadius.circular(20)),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       ClipRRect(
        //         borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(20),
        //             bottomLeft: Radius.circular(20)),
        //         child: Image(
        //           image: NetworkImage(city['city_imageUrl']),
        //           width: 130,
        //           height: 100,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //       Container(
        //         padding: EdgeInsets.symmetric(horizontal: 16),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               city['city_name'],
        //               style: TextStyle(
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w600,
        //                   color: ktextColor),
        //             ),
        //             SizedBox(
        //               height: 3,
        //             ),
        //             Text(
        //               city['city_type'],
        //               overflow: TextOverflow.clip,
        //               maxLines: 1,
        //               style: TextStyle(
        //                   fontSize: 13,
        //                   fontWeight: FontWeight.w400,
        //                   color: ktextColor),
        //             ),
        //             SizedBox(
        //               height: 6,
        //             ),
        //             // Text(
        //             //   price,
        //             //   style: TextStyle(
        //             //       fontSize: 16,
        //             //       fontWeight: FontWeight.w600,
        //             //       color: Color(0xff4E6059)),
        //             // )
        //           ],
        //         ),
        //       ),
        //       // Container(
        //       //     margin: EdgeInsets.only(bottom: 10, right: 8),
        //       //     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        //       //     decoration: BoxDecoration(
        //       //         borderRadius: BorderRadius.circular(6),
        //       //         color: Color(0xff139157)),
        //       //     child: Column(
        //       //       children: [
        //       //         Text(
        //       //           "$rating",
        //       //           style: TextStyle(
        //       //               color: Colors.white,
        //       //               fontWeight: FontWeight.w600,
        //       //               fontSize: 12),
        //       //         ),
        //       //         SizedBox(
        //       //           height: 2,
        //       //         ),
        //       //         Icon(
        //       //           Icons.star,
        //       //           color: Colors.white,
        //       //           size: 20,
        //       //         )
        //       //       ],
        //       //     ))
        //     ],
        //   ),
        // ),
        );
  }
}

// children: [
//   SizedBox(
//     width: 100,
//     child: AspectRatio(
//       aspectRatio: 0.88,
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             image: DecorationImage(
//                 // fit: BoxFit.cover,
//                 image: NetworkImage(city['city_imageUrl']))),
//       ),
//     ),
//   ),
//   SizedBox(
//     width: 20.0,
//   ),
//   Flexible(
//       child: Text(
//     city['city_name'],
//     style: TextStyle(fontSize: 20, color: ktextColor),
//   )),
// ],
