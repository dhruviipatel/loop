import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loop/app/data/providers/HomeProvider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../core/themes/themes.dart';

Widget Commentlist(mypostComment, context) {
  return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: mypostComment.length,
        itemBuilder: (context, index) {
          final hp = Provider.of<HomeProvider>(context);
          hp.mypost(context);
          var allusers = hp.allUsers;

          final commentuserid = mypostComment[index].customerId;

          //set time ago in comment
          final createdat = DateFormat("dd-MM-yyyy hh:mm:ss")
              .parse(mypostComment[index].createdAt);
          //print("created at: ${createdat}");
          String timeAgo = timeago.format(createdat);

          //set image of comnment user
          var cimage = "";
          for (int i = 0; i < allusers.length; i++) {
            if (allusers[i].id == commentuserid) {
              cimage = "https://looptest.inventdi.com/profile_images/" +
                  allusers[i].profileImage;
            }
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: NetworkImage(
                          cimage,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(28.0)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            for (int i = 0; i < allusers.length; i++) ...{
                              if (allusers[i].id == commentuserid) ...{
                                TextSpan(
                                  text: allusers[i].name,
                                  style: GoogleFonts.ibmPlexMono(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                              }
                            },
                            TextSpan(
                              text: " ",
                            ),
                            TextSpan(
                              text: mypostComment[index].postComment,
                              style: GoogleFonts.ibmPlexMono(
                                textStyle: TextStyle(
                                    color: appHintTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 30),
                child: Text(
                  // mypostComment[index].createdAt,
                  timeAgo,
                  style: GoogleFonts.ibmPlexMono(
                    textStyle: TextStyle(
                        color: appHintTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
              )
            ],
          );
        },
      ));
}
