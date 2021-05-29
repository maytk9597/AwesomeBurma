import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail_button extends StatelessWidget {
  const Detail_button({
    @required this.note,
    Key key,
  }) : super(key: key);
  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: FlatButton(
        color: kMainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: () async {
          print(note);
          if (await canLaunch(note)) {
            await launch(note);
          } else {
            throw 'Could not launch $note';
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Text(
            'View on Google Map',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18, context),
              color: ktextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
