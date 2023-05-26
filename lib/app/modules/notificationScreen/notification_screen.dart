import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';

import 'inner_widgets/notiWidget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appbBgColor,
          title: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Notification",
              hintStyle: GoogleFonts.ibmPlexMono(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 21),
              ),
            ),
            cursorColor: Colors.white,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                IconlyLight.search,
                color: Colors.white,
              ),
            )
          ],
          bottom: PreferredSize(
              child: Divider(
                thickness: 1,
                color: Colors.white,
              ),
              preferredSize: Size.fromHeight(20)),
        ),
        backgroundColor: appbBgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "New",
                  style: GoogleFonts.ibmPlexMono(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
              ),
              //follow request notification
              NotiContainer(
                context,
                containerHeight: 140,
                ColumData: Column(
                  children: [
                    NotiRow(
                      name: "Jimmy Nepthew",
                      notification: "requested to follow you",
                      leadingchild: Image.asset(
                        "assets/images/profile.png",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65, top: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 36,
                            width: 86,
                            decoration: BoxDecoration(
                                color: appButtonColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: Text("Accept",
                                  style: GoogleFonts.ibmPlexMono(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  )),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 36,
                            width: 86,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: Text("Reject",
                                  style: GoogleFonts.ibmPlexMono(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //comment notification
              NotiContainer(
                context,
                containerHeight: 100,
                ColumData: NotiRow(
                  name: "Darlene Robort",
                  notification: "commented on your post",
                  leadingchild: Icon(
                    IconlyLight.chat,
                    color: Colors.white,
                  ),
                ),
              ),

              //like notification
              NotiContainer(
                context,
                containerHeight: 100,
                ColumData: NotiRow(
                  name: "Nickey Warner",
                  notification: "liked your post",
                  leadingchild: Icon(
                    IconlyLight.heart,
                    color: Colors.white,
                  ),
                ),
              ),
              //comment notification
              NotiContainer(
                context,
                containerHeight: 100,
                ColumData: NotiRow(
                  name: "Darlene Robort",
                  notification: "commented on your post",
                  leadingchild: Icon(
                    IconlyLight.chat,
                    color: Colors.white,
                  ),
                ),
              ),
              //comment notification
              NotiContainer(
                context,
                containerHeight: 100,
                ColumData: NotiRow(
                  name: "Darlene Robort",
                  notification: "commented on your post",
                  leadingchild: Icon(
                    IconlyLight.chat,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
