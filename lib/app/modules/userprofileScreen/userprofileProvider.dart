import 'package:flutter/material.dart';

class UserProfileProvider with ChangeNotifier {
  //click on more item
  bool _buttonclicked = false;

  bool get buttonclicked => _buttonclicked;

  onbtnclick() {
    _buttonclicked = !_buttonclicked;
    notifyListeners();
  }
}
