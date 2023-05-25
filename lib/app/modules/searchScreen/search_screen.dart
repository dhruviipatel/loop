import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';

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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
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
                      "Search by Username",
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
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
                      "Search by #",
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
            Expanded(
              child: ListView.builder(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
