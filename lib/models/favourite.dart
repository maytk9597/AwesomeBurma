import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'data.dart';

class Favourite {
  final String id;
  final String type;
  Favourite({@required this.id, @required this.type});

  Map toJson() => {
        'productId': id,
        'quantity': type,
      };
  factory Favourite.fromJson(dynamic json) {
    return Favourite(
        id: json['productId'] as String, type: json['quantity'] as String);
  }
}

Data required_data = new Data(favList: [], dark: false);
//var favList = [];
// data.dark = false;
// List<Favourite> favouriteList = [];

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/cart_data.json');
}

Future readData() async {
  try {
    final file = await _localFile;
    print('inside read');

    // Read the file
    String json = file.readAsStringSync();
    var objsJson = jsonDecode(json) as List;
    required_data.favList = objsJson.map((e) => Favourite.fromJson(e)).toList();
    print("${required_data.favList.length} inside readData");
    // return json;
  } catch (e) {
    // If encountering an error, return 0
    return null;
  }
  print('read successful' );
}

Future writeData(Data data) async {
  print('inside writeData ' + data.favList.length.toString());
  final file = await _localFile;
  String jsonFormat = jsonEncode(required_data.favList);

  // Write the file
  return await file.writeAsString(jsonFormat);

  // var data2 = await readData();
  // print(data2);
}
