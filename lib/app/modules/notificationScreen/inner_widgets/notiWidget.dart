import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/themes/themes.dart';

Widget NotiContainer(context,
    {required double containerHeight, required ColumData}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
    child: Container(
      height: containerHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xff757575).withOpacity(0.43),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
        child: ColumData,
      ),
    ),
  );
}

Widget NotiRow(
    {required String name,
    required String notification,
    required Widget leading}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipOval(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Color(0xff454545),
              borderRadius: BorderRadius.circular(50)),
          height: 50,
          width: 50,
          child: leading,
        ),
      ),
      SizedBox(width: 15),
      Expanded(
        child: Container(
            height: 50,
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: name,
                      style: GoogleFonts.ibmPlexMono(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                    TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: notification,
                      style: GoogleFonts.ibmPlexMono(
                        textStyle: TextStyle(
                            color: appHintTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    ],
  );
}
