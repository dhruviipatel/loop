import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import '../../data/models/userPostModel.dart';
import 'inner_widgets/addcomment.dart';

import 'inner_widgets/commentlist.dart';

class CommentScreen extends StatelessWidget {
  final Post post;
  final String userid;

  const CommentScreen({Key? key, required this.post, required this.userid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mypostComment = post.postComments;
    final postid = post.postId;
    int myuserid = int.parse(userid);

    return SafeArea(
      child: Scaffold(
        bottomSheet: AddComment(context, postid),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appbBgColor,
          iconTheme: IconThemeData(color: Colors.white),
          title: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Comment",
              hintStyle: GoogleFonts.ibmPlexMono(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 21,
                ),
              ),
            ),
            cursorColor: Colors.white,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                IconlyLight.send,
                color: Colors.white,
              ),
            ),
          ],
          bottom: PreferredSize(
            child: Divider(
              thickness: 1,
              color: Colors.white,
            ),
            preferredSize: Size.fromHeight(20),
          ),
        ),
        backgroundColor: appbBgColor,
        body: CommentList(mypostComment, myuserid),
      ),
    );
  }
}
