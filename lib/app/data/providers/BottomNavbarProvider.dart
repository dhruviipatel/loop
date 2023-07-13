import 'package:flutter/material.dart';

import '../../modules/homeScreen/home_screen.dart';
import '../../modules/newpostScreen/newpost_screen.dart';
import '../../modules/notificationScreen/notification_screen.dart';
import '../../modules/searchScreen/search_screen.dart';
import '../../modules/userprofileScreen/userprofile_screen.dart';

class BottomNavbarProvider with ChangeNotifier {
  List<GlobalKey<NavigatorState>> navigatorKeys =
      List.generate(5, (_) => GlobalKey<NavigatorState>());
  //bottom navbar
  // Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
  //   0: GlobalKey<NavigatorState>(),
  //   1: GlobalKey<NavigatorState>(),
  //   2: GlobalKey<NavigatorState>(),
  //   3: GlobalKey<NavigatorState>(),
  //   4: GlobalKey<NavigatorState>(),
  // };
  int _currentTab = 0;
  List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    NewpostScreen(),
    NotificationScreen(),
    UserProfileScreen()
  ];

  set currentTab(int tab) {
    this._currentTab = tab;
    notifyListeners();
  }

  int get currentTab => this._currentTab;
  get currentScreen => this._screens[this._currentTab];

  buildNavigator() {
    return Navigator(
        key: navigatorKeys[_currentTab],
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (_) => _screens.elementAt(_currentTab));
        });
  }

  void clearNavigatorKeys() {
    //navigatorKeys.currentTab=0;
    _currentTab = 0;
    notifyListeners();
  }
}
