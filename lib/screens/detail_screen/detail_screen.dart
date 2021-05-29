import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';

import 'package:travel_guide/screens/detail_screen/detail_button.dart';
import 'package:travel_guide/screens/detail_screen/detail_description.dart';
import 'package:travel_guide/screens/detail_screen/detail_header.dart';
import 'package:travel_guide/screens/detail_screen/detail_name&address.dart';
import 'package:travel_guide/size_config.dart';

class detail_screen extends StatefulWidget {
  String imageUrl, name, description, note, address, type;
  detail_screen(
      {this.description,
      this.name,
      this.note,
      this.imageUrl,
      this.address,
      this.type});


  @override
  _detail_screenState createState() => _detail_screenState();
}

class _detail_screenState extends State<detail_screen> {
  @override
  Widget build(BuildContext context) {

    String name = widget.name;
    String description = widget.description;
    String address = widget.address;
    String note = widget.note;
    String type = widget.type;
    print(note);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Detail_header(widget: widget),
              Detail_nameNaddress(name: name, address: address),
              Detail_description(description: description),
              Detail_button(
                note: note,
              ),
            ],
          ),

        ),
      ),
    );
    ;
  }
}
