import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/data/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/BottomNavbarProvider.dart';
import '../../../data/providers/UserProfileProvider.dart';

Widget Setting(context, {required isbtnclicked}) {
  final up = Provider.of<UserProfileProvider>(context);
  final ap = Provider.of<AuthProvider>(context);
  final bp = Provider.of<BottomNavbarProvider>(context, listen: false);
  return InkWell(
    onTap: () {
      up.onbtnclick();
    },
    child: PopupMenuButton(
      onOpened: () => up.onbtnclick(),
      onCanceled: () {
        up.onbtnclick();
      },
      color: appbBgColor,
      child: Icon(IconlyLight.setting, size: 27, color: Colors.white),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      itemBuilder: (context) => [
        PopupMenuItem(
          height: 50,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  child: InkWell(
                    onTap: () => {},
                    child: Text("My Profile",
                        style: GoogleFonts.ibmPlexMono(
                          textStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              )
            ],
          ),
        ),
        PopupMenuItem(
          height: 50,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  child: InkWell(
                    onTap: () => {},
                    child: Text("Terms of Use",
                        style: GoogleFonts.ibmPlexMono(
                          textStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              )
            ],
          ),
        ),
        PopupMenuItem(
          height: 50,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  child: InkWell(
                    onTap: () => {},
                    child: Text("Privacy Policy",
                        style: GoogleFonts.ibmPlexMono(
                          textStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              )
            ],
          ),
        ),
        PopupMenuItem(
          height: 50,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  child: InkWell(
                    onTap: () => {},
                    child: Text("About",
                        style: GoogleFonts.ibmPlexMono(
                          textStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              )
            ],
          ),
        ),
        PopupMenuItem(
          height: 30,
          padding: EdgeInsets.zero,
          child: Container(
            width: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: InkWell(
                onTap: () {
                  up.onbtnclick();
                  ap.Logout(context);
                  bp.clearNavigatorKeys();
                },
                child: Text("Logout",
                    style: GoogleFonts.ibmPlexMono(
                      textStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
