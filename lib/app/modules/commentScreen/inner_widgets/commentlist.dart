import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loop/app/data/providers/CommentProvider.dart';
import 'package:loop/app/data/providers/HomeProvider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../core/themes/themes.dart';
import '../../../data/models/userPostModel.dart';

class CommentList extends StatelessWidget {
  final List<PostComment> mypostComment;

  CommentList(this.mypostComment);

  @override
  Widget build(BuildContext context) {
    final cp = Provider.of<CommentProvider>(context, listen: false);
    var cmtlikedlist = context.watch<CommentProvider>().cmtlikeList;

    print("1111:${cmtlikedlist}");

    return Consumer<HomeProvider>(
      builder: (context, hp, _) {
        final allusers = hp.allUsers;

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: mypostComment.length,
            itemBuilder: (context, index) {
              final commentuserid = mypostComment[index].customerId;
              final postCommentId = mypostComment[index].postCommentId;
              final postId = mypostComment[index].postId;
              final commentIndex = mypostComment[index];

              // Set time ago in comment
              final createdat = DateFormat("dd-MM-yyyy hh:mm:ss")
                  .parse(mypostComment[index].createdAt);
              String timeAgo = timeago.format(createdat);

              // Set image of comment user
              var cimage = "";
              var cuserid = "";
              for (int i = 0; i < allusers.length; i++) {
                if (allusers[i].id == commentuserid) {
                  cimage = "https://looptest.inventdi.com/profile_images/" +
                      allusers[i].profileImage;
                  cuserid = allusers[i].id.toString();
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
                            image: NetworkImage(cimage),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(28.0)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      for (int i = 0;
                                          i < allusers.length;
                                          i++) ...{
                                        if (allusers[i].id ==
                                            commentuserid) ...{
                                          TextSpan(
                                            text: allusers[i].name,
                                            style: GoogleFonts.ibmPlexMono(
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        }
                                      },
                                      TextSpan(text: " "),
                                      TextSpan(
                                        text: mypostComment[index].postComment,
                                        style: GoogleFonts.ibmPlexMono(
                                          textStyle: TextStyle(
                                            color: appHintTextColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(children: [
                                InkWell(
                                  onTap: () {
                                    if (!cmtlikedlist.contains(commentIndex)) {
                                      context
                                          .read<CommentProvider>()
                                          .doCommentLike(commentIndex, cuserid,
                                              postId, postCommentId);
                                    } else {
                                      context
                                          .read<CommentProvider>()
                                          .undoCommentLike(commentIndex,
                                              cuserid, postId, postCommentId);
                                    }
                                  },
                                  child: cmtlikedlist.contains(commentIndex)
                                      ? Icon(
                                          MdiIcons.heart,
                                          color: Colors.orange,
                                          size: 12,
                                        )
                                      : Icon(
                                          MdiIcons.heartOutline,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  mypostComment[index]
                                      .postCommentLikesCount
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ])
                            ]),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 30),
                    child: Text(
                      timeAgo,
                      style: GoogleFonts.ibmPlexMono(
                        textStyle: TextStyle(
                          color: appHintTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
