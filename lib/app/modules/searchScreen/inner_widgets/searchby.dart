import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

Widget Searchby(context, {required String title, required ontap}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: InkWell(
      onTap: ontap,
      child: Container(
        height: 65,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 18),
              child: Icon(
                IconlyLight.search,
                color: Colors.white,
                size: 18,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.ibmPlexMono(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
