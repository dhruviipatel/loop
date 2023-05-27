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
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };
  int _currentTab = 0;
  List<Widget> _screens = [
    CropScreen(),
    FilterScreen(),
    SmileyScreen(),
    TextScreen(),
    BrightnessScreen()
  ];

  set currentTab(int tab) {
    this._currentTab = tab;
    notifyListeners();
  }
}
