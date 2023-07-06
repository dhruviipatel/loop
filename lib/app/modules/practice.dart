import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconoir_icons/iconoir_icons.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:photo_manager/src/types/entity.dart';

import 'newpostScreen/addpostInfo_screen.dart';
import 'newpostScreen/editpost/brightness_screen.dart';
import 'newpostScreen/editpost/filter_screen.dart';
import 'newpostScreen/editpost/smiley_screen.dart';
import 'newpostScreen/editpost/text_screen.dart';

class MyBottomTabBar extends StatelessWidget {
  final List<AssetEntity> selectedAssetList;
  MyBottomTabBar({required this.selectedAssetList});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appbBgColor,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text("New Post",
                style: GoogleFonts.ibmPlexMono(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 21),
                )),
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
          body: TabBarView(
            children: [
              //CropScreen(),
              FilterScreen(
                selectedAssetList: selectedAssetList,
              ),
              SmileyScreen(
                selectedAssetList: selectedAssetList,
              ),
              TextScreen(
                selectedAssetList: selectedAssetList,
              ),
              BrightnessScreen(
                selectedAssetList: selectedAssetList,
              )
            ],
          ),
          bottomNavigationBar: Container(
            color: appbBgColor,
            child: TabBar(
              unselectedLabelColor:
                  Colors.white, // Color for unselected tab icons
              labelColor: Colors.orange, // Color for selected tab icon
              tabs: [
                // Tab(
                //   icon: Icon(
                //     Icons.crop,
                //   ),
                // ),
                Tab(
                  icon: Iconoir(
                    IconoirIcons.colorFilter,
                  ),
                ),
                Tab(
                  icon: Icon(
                    MdiIcons.emoticonOutline,
                  ),
                ),
                Tab(
                  icon: Iconoir(
                    IconoirIcons.textSize,
                  ),
                ),
                Tab(
                  icon: Iconoir(
                    IconoirIcons.sunLight,
                  ),
                )
              ],
              indicator: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.transparent, width: 0.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
