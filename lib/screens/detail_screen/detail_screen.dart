import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/size_config.dart';

class detail_screen extends StatefulWidget {
  String imageUrl, name, description, type, address;
  detail_screen(
      {this.description, this.name, this.type, this.imageUrl, this.address});

  @override
  _detail_screenState createState() => _detail_screenState();
}

class _detail_screenState extends State<detail_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // width: double.infinity,
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: NetworkImage(widget.imageUrl),
                    height: getProportionateScreenHeight(400, context),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 350,
                    padding: EdgeInsets.only(
                        top: getProportionateScreenHeight(20, context)),
                    child: Column(
                      children: [
                        Container(
                          // height: getProportionateScreenHeight(50, context),

                          // color: kMainColor.withOpacity(0.4),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  getProportionateScreenWidth(24, context)),
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
                                    size: 24,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  Spacer(),
//                         Container(
//                           padding: EdgeInsets.only(
//                             left: 24,
//                             right: 24,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 widget.name,
//                                 style: TextStyle(
//                                     color: ktextColor,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 23),
//                               ),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Text(
//                                 widget.type,
//                                 style: TextStyle(
//                                     color: ktextColor,
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 17),
//                               ),
//                               SizedBox(
//                                 height: 12,
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.location_on,
//                                     color: Colors.white70,
//                                     size: 25,
//                                   ),
//                                   SizedBox(
//                                     width: 8,
//                                   ),
//                                   Text(
//                                     widget.address,
//                                     style: TextStyle(
//                                         color: ktextColor,
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 17),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 18,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(30),
//                                   topRight: Radius.circular(30))),
//                           height: 50,
//                         )
