import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/screens/city_detail_screen/attraction_list.dart';
import 'package:travel_guide/screens/city_detail_screen/hotel_list.dart';
import 'package:travel_guide/screens/city_detail_screen/restaurant_list.dart';

import '../../size_config.dart';

class CityDetails extends StatelessWidget {
  const CityDetails({
    Key key,
    @required this.city,
  }) : super(key: key);

  final DocumentSnapshot city;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String cityId = city.id;
    print(city.id + " inside city Details");
    print(city.data()['city_name']);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20, context),
            ),
            AttractionList(cityId: cityId),
            HotelList(cityId: cityId),
            RestaurantList(cityId: cityId),
          ],
        ),
      ),
    );
  }
}
