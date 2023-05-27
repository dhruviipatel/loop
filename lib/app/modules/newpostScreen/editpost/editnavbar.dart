import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconoir_icons/iconoir_icons.dart';
import 'package:loop/app/modules/newpostScreen/addpostInfo_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/themes.dart';
import 'editnavbarProvider.dart';

class EditNavbar extends StatelessWidget {
  const EditNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appbBgColor,
          elevation: 0.0,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: appButtonColor,
            ),
          ),
          title: Text("New Post",
              style: GoogleFonts.ibmPlexMono(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 21),
              )),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddpostInfoscreen(),
                )),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: appButtonColor,
                ),
              ),
            )
          ],
        ),
        body: Consumer<EditNavbarProvider>(
            builder: (context, editprovider, child) => SafeArea(
                  child: Scaffold(
                    backgroundColor: appbBgColor,
                    body: editprovider.currentScreen,
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
                            icon: Icon(Icons.crop), label: "1"),
                        BottomNavigationBarItem(
                            icon: Iconoir(IconoirIcons.colorFilter),
                            label: "2"),
                        BottomNavigationBarItem(
                            icon: Icon(MdiIcons.emoticonOutline), label: "3"),
                        BottomNavigationBarItem(
                            icon: Iconoir(IconoirIcons.textSize), label: "4"),
                        BottomNavigationBarItem(
                            icon: Iconoir(IconoirIcons.sunLight), label: "5"),
                      ],
                      currentIndex: editprovider.currentTab,
                      onTap: (int idx) {
                        editprovider.currentTab = idx;
                      },
                    ),
                  ),
                )),
      ),
    );
  }
}
