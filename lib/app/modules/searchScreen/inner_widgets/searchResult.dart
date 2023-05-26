import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget SearchResult() {
  return ListView.builder(
    itemCount: 14,
    itemBuilder: (context, index) {
      return Container(
        height: 70,
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/profile.png",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
          ),
          title: Text(
            "Floyd Miles",
            style: GoogleFonts.ibmPlexMono(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
        ),
      );
    },
  );
}
