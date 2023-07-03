import 'package:flutter/material.dart';

class NewpostProvider with ChangeNotifier {
  bool _isOpenedDropdown = false;
  get isOpenedDropdown => _isOpenedDropdown;

  dropdowntap() {
    _isOpenedDropdown = !_isOpenedDropdown;
    notifyListeners();
  }
}
