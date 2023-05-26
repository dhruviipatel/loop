import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/themes/themes.dart';

Widget Commentlist() {
  return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: 16,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // decoration: BoxDecoration(border: Border.all()),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/profile.png",
                        height: 28,
                        width: 28,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Annie",
                              style: GoogleFonts.ibmPlexMono(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                            TextSpan(
                              text: " ",
                            ),
                            TextSpan(
                              text:
                                  "Lorem ipsum dolor sit abc vertc siuggd xdtig cdfw cft cvggts itrew ❤️😇",
                              style: GoogleFonts.ibmPlexMono(
                                textStyle: TextStyle(
                                    color: appHintTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 30),
                child: Text(
                  "01 minutes ago",
                  style: GoogleFonts.ibmPlexMono(
                    textStyle: TextStyle(
                        color: appHintTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
              )
            ],
          );
        },
      ));
}
