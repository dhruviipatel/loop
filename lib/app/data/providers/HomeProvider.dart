import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  //click on more item
  bool _isclicked = false;

  bool get isclicked => _isclicked;

  click() {
    _isclicked = !_isclicked;
    notifyListeners();
  }
}
