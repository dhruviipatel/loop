import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/searchScreen/inner_widgets/searchResult.dart';
import 'package:loop/app/modules/searchScreen/inner_widgets/searchby.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: GoogleFonts.ibmPlexMono(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 21),
                        ),
                      ),
                      cursorColor: Colors.white,
                    ),
                  ),
                  Icon(
                    IconlyLight.search,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Divider(thickness: 1, color: Colors.white),
            SizedBox(height: 20),
            Searchby(context, title: "Search by Username", ontap: () {}),
            SizedBox(height: 20),
            Searchby(context, title: "Search by #", ontap: () {}),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 20),
              child: Text(
                "Search result",
                style: GoogleFonts.ibmPlexMono(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ),
            Expanded(child: SearchResult())
          ],
        ),
      ),
    );
  }
}
