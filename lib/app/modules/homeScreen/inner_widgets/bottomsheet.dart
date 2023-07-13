import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loop/app/data/providers/UserProfileProvider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/themes/themes.dart';

Widget BottomUnfollowSheet(context,
    {required postuserid,
    required loginuserid,
    required postuserprofile,
    required postusername}) {
  final up = Provider.of<UserProfileProvider>(context);
  return Padding(
    padding: const EdgeInsets.only(left: 35, right: 35),
    child: Column(
      children: [
        SizedBox(height: 30),
        Text(
          "Unfollow",
          style: GoogleFonts.ibmPlexMono(
            textStyle: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.w500),
          ),
        ),
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
              image: NetworkImage(postuserprofile),
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
          "Are you sure that you want to unfollow this user ?",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: appHintTextColor,
              fontSize: 15,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 45),
        InkWell(
          onTap: () {
            up.UnFollowUser(postuserid, int.parse(loginuserid), context);
            Navigator.pop(context);
            //   ScaffoldMessenger.of(context)
            // .showSnackBar(SnackBar(content: Text("Unfollow user successfull")));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 35,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "Unfollow $postusername",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget BottomReportSheet(context, reportlist) {
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
      Expanded(
        child: ListView.builder(
          itemCount: reportlist.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Text(
                    reportlist[index].title,
                    style: GoogleFonts.ibmPlexMono(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
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
              ],
            );
          },
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
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
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
          ),
        )
      ],
    ),
  );
}

Widget BottomDeletePostSheet(
  context,
  // {required postuserid,
  // required loginuserid,
  // required postuserprofile,
  // required postusername}
) {
  return Padding(
    padding: const EdgeInsets.only(left: 35, right: 35),
    child: Column(
      children: [
        SizedBox(height: 30),
        Text(
          "Delete",
          style: GoogleFonts.ibmPlexMono(
            textStyle: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 15),
        Container(
          color: Colors.white,
          height: 4,
          width: 203,
        ),
        SizedBox(height: 30),
        Text(
          "Are you sure that you want to delete this post ?",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: appHintTextColor,
              fontSize: 17,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                //up.UnFollowUser(postuserid, int.parse(loginuserid), context);
                Navigator.pop(context);
                //   ScaffoldMessenger.of(context)
                // .showSnackBar(SnackBar(content: Text("Unfollow user successfull")));
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appButtonColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Delete",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                //up.UnFollowUser(postuserid, int.parse(loginuserid), context);
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
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
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
