import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Item{

  Item({this.data, this.type});

  DocumentSnapshot data;
  String type;
}