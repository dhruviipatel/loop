import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/data/providers/NotificationProvider.dart';
import 'package:provider/provider.dart';
import '../../data/providers/AuthProvider.dart';
import 'inner_widgets/notiWidget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final np = Provider.of<NotificationProvider>(context, listen: false);
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final user = ap.user;
    var userid = 0;
    if (user != null) {
      userid = user.id;
    }

    return FutureBuilder(
        future: np.mynotification(userid),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load notifications'));
          } else {
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
                body: Column(
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
                    Consumer<NotificationProvider>(
                      builder: (context, np, child) {
                        final notilist = np.notifi;

                        return Expanded(
                          child: ListView.builder(
                            itemCount: notilist.length,
                            itemBuilder: (context, index) {
                              final notiType = notilist[index].type ?? "";
                              var username = "User";
                              if (notilist[index].user != null) {
                                username = notilist[index].user.name;
                              }

                              if (notiType == 1) {
                                return NotiContainer(
                                  context,
                                  containerHeight: 100,
                                  ColumData: NotiRow(
                                    name: username,
                                    notification: "liked your post",
                                    leading: Icon(
                                      IconlyLight.heart,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              } else if (notiType == 2) {
                                return NotiContainer(
                                  context,
                                  containerHeight: 100,
                                  ColumData: NotiRow(
                                    name: username,
                                    notification: "commented on your post",
                                    leading: Icon(
                                      IconlyLight.chat,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              } else {
                                return NotiContainer(
                                  context,
                                  containerHeight: 100,
                                  ColumData: NotiRow(
                                    name: username,
                                    notification: "started follow you",
                                    leading: ClipOval(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    notilist[index]
                                                        .user
                                                        .profileImage)),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
