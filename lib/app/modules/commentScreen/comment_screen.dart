import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';

import 'inner_widgets/addcomment.dart';
import 'inner_widgets/commentlist.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomSheet: AddComment(),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: appbBgColor,
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
                      fontSize: 21),
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
          body: Commentlist()),
    );
  }
}
