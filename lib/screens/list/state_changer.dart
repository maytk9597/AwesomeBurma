import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_guide/models/favourite.dart';

class StateChanger with ChangeNotifier {
  dynamic sub = 'All';

  void changeState(dynamic newTitle) {
    sub = newTitle;
    notifyListeners();
  }

  void changeFavourite() {
    readData();
    notifyListeners();
  }
}
