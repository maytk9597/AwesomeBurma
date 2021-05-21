import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';

class Place_card extends StatelessWidget {
  const Place_card({
    Key key,
    @required this.recommendationPlace,
  }) : super(key: key);

  final DocumentSnapshot recommendationPlace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                // padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: ktextColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(recommendationPlace['imageUrl']))),
              ),
            )),
            SizedBox(
              height: 5.0,
            ),
            Text(
              recommendationPlace['name'],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: ktextColor, fontSize: 20),
              maxLines: 2,
              softWrap: false,
            )
          ],
        ),
      ),
    );
  }
}
