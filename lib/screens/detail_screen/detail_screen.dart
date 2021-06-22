import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide/Components/constants.dart';
import 'package:travel_guide/Components/textStyle.dart';

import 'package:travel_guide/screens/detail_screen/detail_button.dart';
import 'package:travel_guide/screens/detail_screen/detail_description.dart';
import 'package:travel_guide/screens/detail_screen/detail_header.dart';
import 'package:travel_guide/screens/detail_screen/detail_name.dart';
import 'package:travel_guide/models/size_config.dart';

class detail_screen extends StatefulWidget {
  DocumentSnapshot placeDocument;
  String placeType;
  detail_screen({this.placeDocument, this.placeType});

  @override
  _detail_screenState createState() => _detail_screenState();
}

class _detail_screenState extends State<detail_screen> {
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Detail_header(
                placeDocument: widget.placeDocument,
                placeType: widget.placeType,
              ),
              Detail_name(
                placeDocument: widget.placeDocument,
                placeType: widget.placeType,
              ),
              SizedBox(
                width: getProportionateScreenHeight(15, context),
              ),
              Detail_description(
                placeType: widget.placeType,
                placeDocument: widget.placeDocument,
              ),
              // Detail_button(
              //   placeDocument: widget.placeDocument,
              //   placeType: widget.placeType,
              // ),
            ],
          ),
        ),
        bottomNavigationBar: Detail_button(
          placeDocument: widget.placeDocument,
          placeType: widget.placeType,
        ),
      ),
    );
  }
}
