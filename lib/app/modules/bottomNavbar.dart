import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'homeScreen/inner_widgets/homeProvider.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, homeprovider, child) => SafeArea(
              child: Scaffold(
                backgroundColor: appbBgColor,
                body: homeprovider.currentScreen,
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  selectedIconTheme: IconThemeData(size: 30),
                  unselectedIconTheme: IconThemeData(size: 30),
                  showUnselectedLabels: false,
                  selectedItemColor: appButtonColor,
                  unselectedItemColor: Colors.white,
                  backgroundColor: appbBgColor,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.home), label: "1"),
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.search), label: "2"),
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.camera), label: "3"),
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.notification), label: "4"),
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.profile), label: "5"),
                  ],
                  currentIndex: homeprovider.currentTab,
                  onTap: (int idx) {
                    homeprovider.currentTab = idx;
                    print(homeprovider.currentTab);
                  },
                ),
              ),
            ));
  }
}
