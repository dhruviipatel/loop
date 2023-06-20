import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loop/app/data/providers/CommentProvider.dart';
import 'package:loop/app/data/providers/HomeProvider.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/themes.dart';

Widget AddComment(context, postid) {
  var CommentController = new TextEditingController();
  final hp = Provider.of<HomeProvider>(context, listen: false);
  hp.mypost.call(context);
  return Consumer<CommentProvider>(
    builder: (context, cp, _) {
      final userProImage = hp.userProImage;
      final userid = hp.userid;

      return BottomAppBar(
        elevation: 0.0,
        color: appbBgColor,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 240,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(userProImage),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: CommentController,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            decoration: InputDecoration(
                              hintText: "Add comments...",
                              hintStyle: GoogleFonts.ibmPlexMono(
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (CommentController.text.isNotEmpty) {
                        cp.AddNewComment(
                            postid, CommentController.text, userid);
                        CommentController.text = "";
                      }
                    },
                    child: Text(
                      "Post",
                      style: TextStyle(color: appButtonColor, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
