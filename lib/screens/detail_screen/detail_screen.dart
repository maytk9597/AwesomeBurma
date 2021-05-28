import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/size_config.dart';

class detail_screen extends StatefulWidget {
  String imageUrl, name, description, note;
  detail_screen({this.description, this.name, this.note, this.imageUrl});

  @override
  _detail_screenState createState() => _detail_screenState();
}

class _detail_screenState extends State<detail_screen> {
  @override
  Widget build(BuildContext context) {
    print(widget.name);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              // height: 400,
              child: Stack(
                children: [
                  Image.network(
                    widget.imageUrl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),

                  // Image(image: NetworkImage(widget.imageUrl)),
                  // Image.asset(
                  //   'assets/images/header.png',
                  //   height: 400,
                  //   fit: BoxFit.cover,
                  // ),
                  // Positioned(
                  //   left: getProportionateScreenWidth(20, context),
                  //   top: getProportionateScreenHeight(40, context),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Navigator.pop(context);
                  //     },
                  //     child: Icon(
                  //       Icons.arrow_back_ios,
                  //     ),
                  //   ),
                  // ),
                  // Positioned(
                  //   right: getProportionateScreenWidth(16, context),
                  //   top: getProportionateScreenHeight(100, context),
                  //   child: Container(
                  //     padding: EdgeInsets.all(8),
                  //     decoration: BoxDecoration(
                  //         color: kMainColor,
                  //         borderRadius: BorderRadius.circular(36)),
                  //     child: Icon(Icons.favorite),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
