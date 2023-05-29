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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/profile.png")),
                                borderRadius: BorderRadius.circular(50)),
                            height: 50,
                            width: 50,
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
                                        text: "Jimmy Nepthew",
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
                                        text: "requested to follow you",
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
                  icon: Icon(
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
                  icon: Icon(
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
                  icon: Icon(
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
                  icon: Icon(
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
