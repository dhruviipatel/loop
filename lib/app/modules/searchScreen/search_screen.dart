import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:provider/provider.dart';
import '../../data/providers/SearchProvider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final search = Provider.of<SearchProvider>(context);
    search.getAllUsers.call();

    var founduser = search.foundUsers;

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
                      onChanged: (value) => search.runFilter(value),
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
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
                itemCount: founduser.length,
                itemBuilder: (context, index) {
                  //check profile pic value empty or not
                  var profile =
                      "https://looptest.inventdi.com/profile_images/default.png";
                  if (founduser.isNotEmpty) {
                    var fu = jsonDecode(jsonEncode(founduser));
                    if (fu[index]['profile_image'] != null &&
                        fu[index]['profile_image'].isNotEmpty) {
                      profile =
                          "https://looptest.inventdi.com/profile_images/" +
                              fu[index]['profile_image'];
                    }
                  }
                  return Container(
                    height: 70,
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: NetworkImage(
                              profile,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                      ),
                      title: Text(
                        founduser[index].name,
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
