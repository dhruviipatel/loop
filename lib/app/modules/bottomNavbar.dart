import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:provider/provider.dart';
import 'homeScreen/inner_widgets/homeProvider.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, homeprovider, child) => SafeArea(
              child: Scaffold(
                backgroundColor: appbBgColor,
                body: homeprovider.buildNavigator(),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  selectedIconTheme:
                      IconThemeData(size: 30, color: appButtonColor),
                  unselectedIconTheme: IconThemeData(size: 30),
                  showUnselectedLabels: false,
                  selectedItemColor: appButtonColor,
                  unselectedItemColor: Colors.white,
                  backgroundColor: appbBgColor,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.home),
                        activeIcon: Icon(IconlyBold.home),
                        label: "1"),
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.search),
                        activeIcon: Icon(IconlyBold.search),
                        label: "2"),
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.camera),
                        activeIcon: Icon(IconlyBold.camera),
                        label: "3"),
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.notification),
                        activeIcon: Icon(IconlyBold.notification),
                        label: "4"),
                    BottomNavigationBarItem(
                        icon: Icon(IconlyLight.profile),
                        activeIcon: Icon(IconlyBold.profile),
                        label: "5"),
                  ],
                  currentIndex: homeprovider.currentTab,
                  onTap: (int idx) {
                    homeprovider.currentTab = idx;
                  },
                ),
              ),
            ));
  }
}
