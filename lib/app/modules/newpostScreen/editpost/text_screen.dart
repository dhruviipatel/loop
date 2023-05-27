import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbBgColor,
      bottomSheet: BottomSheet(
        backgroundColor: appbBgColor,
        onClosing: () {},
        enableDrag: false,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(90, 30, 90, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.asset("assets/images/colorfull.png"),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    MdiIcons.formatAlignRight,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: appButtonColor),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.font,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Container(
          height: 450,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/cropimg.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
