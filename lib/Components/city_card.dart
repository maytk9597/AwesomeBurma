import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';

class City_card extends StatelessWidget {
  const City_card({
    Key key,
    @required this.city,
  }) : super(key: key);

  final DocumentSnapshot city;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: NetworkImage(city['city_imageUrl']))
          // SizedBox(
          //   width: double.infinity,
          // child: Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       image: DecorationImage(
          //           fit: BoxFit.cover,
          //           image: NetworkImage(city['city_imageUrl']))),
          // ),
          // ),
          //           child: Container(
          //   // padding: EdgeInsets.all(5.0),
          //   decoration: BoxDecoration(
          //       color: ktextColor.withOpacity(0.1),
          //       borderRadius: BorderRadius.circular(15),
          //       image: DecorationImage(
          //             fit: BoxFit.cover,
          //             image: NetworkImage(city['city_imageUrl']))),
          // ),
        ],
      ),
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
