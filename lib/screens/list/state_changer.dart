import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_guide/models/favourite.dart';
import 'package:travel_guide/main.dart';

class StateChanger with ChangeNotifier {
  dynamic sub = 'All';
  int index = 0;
  bool dark = false;

  void changeState(dynamic newTitle) {
    sub = newTitle;
    notifyListeners();
  }

  void changeFavourite() {
    readData();
    notifyListeners();
  }

  void changeToEdit(int new_index){
    index = new_index;
    notifyListeners();
  }

  void changeDarkMode(bool newValue){
    dark = newValue;
    notifyListeners();
  }
}
