import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/themes/themes.dart';

Widget AddComment() {
  return BottomAppBar(
    elevation: 0.0,
    color: appbBgColor,
    height: 80,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 240,
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "assets/images/profile.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        decoration: InputDecoration(
                            hintText: "Add comments...",
                            hintStyle: GoogleFonts.ibmPlexMono(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Post",
                style: TextStyle(color: appButtonColor, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
