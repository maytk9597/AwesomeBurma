
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'title_list.dart';

class StateChanger with ChangeNotifier{

  dynamic sub = 'All';

  void changeState(dynamic newTitle){
    sub = newTitle;
    notifyListeners();
  }
}