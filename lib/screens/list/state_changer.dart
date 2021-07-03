import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_guide/Components/textStyle.dart';
import 'package:travel_guide/models/favourite.dart';
import 'package:travel_guide/main.dart';
import 'package:travel_guide/screens/home/profile/homeScreen_profile.dart';

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
    if(dark == true)
      current_color_list = dark_color_list;
    else
      //current_color_list = light_color_list;
      current_color_list = color_list;
    //current_color_list = dark_color_list;
    kMainColor = current_color_list[0];
    ktextColor = current_color_list[1];
    white = current_color_list[2];
    buttonBackgroundColour = current_color_list[3];
    kSecondaryColour = current_color_list[4];
    notifyListeners();
  }
}
