import 'package:flutter/material.dart';
import 'package:loop/app/modules/newpostScreen/editpost/brightness_screen.dart';
import 'package:loop/app/modules/newpostScreen/editpost/crop_screen.dart';
import 'package:loop/app/modules/newpostScreen/editpost/filter_screen.dart';
import 'package:loop/app/modules/newpostScreen/editpost/smiley_screen.dart';
import 'package:loop/app/modules/newpostScreen/editpost/text_screen.dart';

class EditNavbarProvider with ChangeNotifier {
  //Edit navbar
  int get currentTab => this._currentTab;
  get currentScreen => this._screens[this._currentTab];

  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    01: GlobalKey<NavigatorState>(),
    02: GlobalKey<NavigatorState>(),
    03: GlobalKey<NavigatorState>(),
    04: GlobalKey<NavigatorState>(),
    05: GlobalKey<NavigatorState>(),
  };
  int _currentTab = 01;
  List<Widget> _screens = [
    CropScreen(),
    FilterScreen(),
    SmileyScreen(),
    TextScreen(),
    BrightnessScreen()
  ];

  List _selectedImage = [];
  get selectedImage => _selectedImage;

  myselectedImage(List image) {
    _selectedImage = image;
    notifyListeners();
  }

  set currentTab(int tab) {
    this._currentTab = tab;
    notifyListeners();
  }
}
