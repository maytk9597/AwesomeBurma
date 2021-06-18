import 'package:flutter/material.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/size_config.dart';

class makeInput extends StatelessWidget {
  makeInput({this.onChanged, this.label, this.obscureText});
  String label;
  Function onChanged;
  bool obscureText;
  @override
  Widget build(BuildContext context) {
    final RegExp emailRegex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: ktextColor),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          onChanged: onChanged,
          obscureText: obscureText,
          validator: (value) {
            if (label == 'Email') {
              if (value.isEmpty) {
                return '$label cannot be blank';
              } else {
                if (!emailRegex.hasMatch(value)) {
                  return 'Enter a valid email';
                }
              }

              // if (emailRegex.hasMatch(value)) {
              //   return 'Enter a Valid Email';
              // }
              // } else {
              //   if (value.length < 6) {
              //     return 'Password Length must be at least 6 characters long';
              //   }
            } else if (label == 'Password') {
              if (value.isEmpty) {
                return '$label cannot be blank';
              } else {
                if (value.length < 6) {
                  return 'Password Length must be at least 6 characters long';
                }
              }
            } else {
              if (value.isEmpty) {
                return '$label cannot be blank';
              }
            }
          },
          decoration: InputDecoration(
            // labelText: label,
            labelStyle: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: ktextColor),
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10, context)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: ktextColor)),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(30, context),
        ),
      ],
    );
  }
}
