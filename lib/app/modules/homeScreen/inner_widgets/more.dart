import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/homeProvider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

Widget More(context, {required isclicked}) {
  final v1 = Provider.of<HomeProvider>(context);

  return InkWell(
    onTap: () {
      v1.click();
    },
    child: PopupMenuButton(
      onOpened: () => v1.click(),
      onCanceled: () {
        v1.click();
      },
      color: appbBgColor,
      child: Icon(
        MdiIcons.dotsHorizontal,
        color: Colors.white,
      ),
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
                    onTap: () => {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: appbBgColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50))),
                        context: context,
                        builder: (context) => DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.5,
                          minChildSize: 0.3,
                          maxChildSize: 0.8,
                          builder: (context, scrollController) =>
                              SingleChildScrollView(
                            child: BottomUnfollowSheet(context),
                          ),
                        ),
                      ),
                    },
                    child: Text("Unfollow",
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
                    onTap: () => {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: appbBgColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50))),
                        context: context,
                        builder: (context) => DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.5,
                          minChildSize: 0.3,
                          maxChildSize: 0.8,
                          builder: (context, scrollController) =>
                              SingleChildScrollView(
                            child: BottomReportSheet(context),
                          ),
                        ),
                      ),
                    },
                    child: Text("Report",
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
                onTap: () => {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: appbBgColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50))),
                    context: context,
                    builder: (context) => DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.35,
                      minChildSize: 0.3,
                      maxChildSize: 0.8,
                      builder: (context, scrollController) =>
                          SingleChildScrollView(
                        child: BottomSharetoSheet(context),
                      ),
                    ),
                  ),
                },
                child: Text("Share to...",
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

Widget BottomUnfollowSheet(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 35, right: 35),
    child: Column(
      children: [
        SizedBox(height: 30),
        Text("Unfollow",
            style: GoogleFonts.ibmPlexMono(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            )),
        SizedBox(height: 15),
        Container(
          color: Colors.white,
          height: 4,
          width: 203,
        ),
        SizedBox(height: 45),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: AssetImage(
                "assets/images/profile.png",
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(color: appButtonColor, width: 2),
          ),
        ),
        SizedBox(height: 30),
        Text(
          "Don't want to see this ?",
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 22),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: appHintTextColor,
              fontSize: 15,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 45),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "Unfollow Texting User",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
        )
      ],
    ),
  );
}

Widget BottomReportSheet(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 25),
      Center(
        child: Text("Report",
            style: GoogleFonts.ibmPlexMono(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            )),
      ),
      SizedBox(height: 8),
      Divider(
        color: Colors.white,
        thickness: 1,
      ),
      SizedBox(height: 22),
      Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Text(
          "Why are you reporting this post?",
          style: GoogleFonts.ibmPlexMono(
            textStyle: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Text(
          "Amet minim mollit non deserunt ullam coest sit aliqua dolor do amet sint.",
          style: GoogleFonts.ibmPlexMono(
            textStyle: TextStyle(
                color: appHintTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
      SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Divider(
          thickness: 1,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Text(
          "It's Spam?",
          style: GoogleFonts.ibmPlexMono(
            textStyle: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Divider(
          thickness: 1,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Text(
          "I just don't like it?",
          style: GoogleFonts.ibmPlexMono(
            textStyle: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Divider(
          thickness: 1,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Text(
          "False Information?",
          style: GoogleFonts.ibmPlexMono(
            textStyle: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ],
  );
}

Widget BottomSharetoSheet(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 32, right: 32, top: 30),
    child: Column(
      children: [
        Text("Share",
            style: GoogleFonts.ibmPlexMono(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            )),
        SizedBox(height: 15),
        Container(
          color: Colors.white,
          height: 4,
          width: 203,
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset("assets/images/Facebookrounded.png",
                    height: 30, width: 30),
                8.heightBox,
                Text(
                  "Facebook",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
            Column(
              children: [
                Image.asset("assets/images/Twitterrounded.png",
                    height: 30, width: 30),
                8.heightBox,
                Text(
                  "Twitter",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
            Column(
              children: [
                Image.asset("assets/images/whatsapprounded.png",
                    height: 30, width: 30),
                8.heightBox,
                Text(
                  "WhatsApp",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
            Column(
              children: [
                Image.asset("assets/images/Instagramrounded.png",
                    height: 30, width: 30),
                8.heightBox,
                Text(
                  "Instagram",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            )
          ],
        ),
        34.heightBox,
        Container(
          width: MediaQuery.of(context).size.width,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
        )
      ],
    ),
  );
}
