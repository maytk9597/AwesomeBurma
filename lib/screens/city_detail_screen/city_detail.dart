import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/buildIcon.dart';
import 'package:travel_guide/Components/constants.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/screens/city_detail_screen/attraction_list.dart';
import 'package:travel_guide/screens/city_detail_screen/city_detail_header.dart';
import 'package:travel_guide/screens/city_detail_screen/hotel_list.dart';
import 'package:travel_guide/screens/city_detail_screen/restaurant_list.dart';

import '../../models/size_config.dart';

class CityDetails extends StatefulWidget {
  const CityDetails({
    Key key,
    @required this.city,
  }) : super(key: key);

  final DocumentSnapshot city;

  @override
  _CityDetailsState createState() => _CityDetailsState();
}

class _CityDetailsState extends State<CityDetails> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String cityId = widget.city.id;
    print(widget.city.id + " inside city Details");
    print(widget.city.data()['city_name']);
    return SafeArea(
      child: Scaffold(
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: [
                City_detail_header(
                    imageUrl: widget.city.data()['city_header_imageUrl'],
                    type: widget.city.data()['city_type'],
                    name: widget.city.data()['city_name']),
                SizedBox(
                  height: getProportionateScreenHeight(30, context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: type
                      .asMap()
                      .entries
                      .map(
                        (MapEntry map) => Build_icon(
                          city: widget.city.data()['city_name'],
                          index: map.key,
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20, context),
                ),
                AttractionList(cityId: cityId),
                HotelList(cityId: cityId),
                RestaurantList(cityId: cityId),
              ],
            ),
          ),
          // SizedBox.expand(
          //   child: DraggableScrollableSheet(
          //       initialChildSize: 0.25,
          //       minChildSize: 0.12,
          //       maxChildSize: 0.8,
          //       builder:
          //           (BuildContext context, ScrollController scrollController) {
          //         return Container(
          //           decoration: BoxDecoration(
          //               gradient: LinearGradient(colors: [
          //                 Color(0xffF4F0FE),
          //                 Color(0xffE6CFFB),
          //               ]),
          //               borderRadius: BorderRadius.only(
          //                   topRight: Radius.circular(
          //                       getProportionateScreenWidth(20, context)),
          //                   topLeft: Radius.circular(
          //                       getProportionateScreenWidth(20, context)))),
          //           // padding: EdgeInsets.symmetric(
          //           //     // horizontal: getProportionateScreenWidth(15, context),
          //           //     vertical: getProportionateScreenHeight(0, context)),
          //           child: ListView(
          //             controller: scrollController,
          //             children: [
          //               AttractionList(cityId: cityId),
          //               HotelList(cityId: cityId),
          //               RestaurantList(cityId: cityId),
          //             ],
          //           ),
          //         );
          //       }),
          // )
        ]),
      ),
    );
  }
}
