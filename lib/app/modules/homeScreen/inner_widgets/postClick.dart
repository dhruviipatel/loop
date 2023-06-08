import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/data/models/userPostModel.dart';
import 'package:loop/app/data/providers/HomeProvider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'more.dart';

class PostClick extends StatelessWidget {
  final String postuser;
  final String postuserImage;
  final Post postlist;

  PostClick({
    Key? key,
    required this.postlist,
    required this.postuser,
    required this.postuserImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hp = Provider.of<HomeProvider>(context, listen: false);
    final clickvalue = hp.isclicked;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        bottomSheet: BottomSheet(
          backgroundColor:
              clickvalue ? Colors.black.withOpacity(0.95) : appbBgColor,
          elevation: 0.0,
          enableDrag: false,
          onClosing: () {},
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15)),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Icon(
                      IconlyBold.heart,
                      color: appButtonColor,
                    ),
                    6.widthBox,
                    Text(
                      postlist.postLikesCount.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
                      child: VerticalDivider(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      IconlyLight.chat,
                      color: Colors.white,
                    ),
                    6.widthBox,
                    Text(
                      postlist.postCommentsCount.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: clickvalue == true
            ? Stack(
                children: [
                  InnerPage(
                      context, postlist, clickvalue, postuser, postuserImage),
                  Container(
                    color: Colors.black.withOpacity(0.8),
                  )
                ],
              )
            : Stack(
                children: [
                  InnerPage(
                      context, postlist, clickvalue, postuser, postuserImage),
                  Container()
                ],
              ),
      ),
    );
  }
}

Widget InnerPage(context, postlist, isclicked, postuser, postuserImage) {
  final hp = Provider.of<HomeProvider>(context);
  final hasPostImage = postlist.postImage.isNotEmpty;
  final hasPostVideo = postlist.postVideo.isNotEmpty;
  return Stack(
    children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: hasPostImage
            ? PageView.builder(
                onPageChanged: (index1) {
                  hp.ImageViews(postlist.postImage);
                },
                itemCount: postlist.postImage.length,
                itemBuilder: (context, idx1) {
                  return Image.network(
                    postlist.postImage[idx1].postImage,
                    fit: BoxFit.contain,
                  );
                },
              )
            : hasPostVideo
                ? Image.asset(
                    "assets/images/post1.png",
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Text(
                      postlist.postCaption ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: NetworkImage(postuserImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(color: appButtonColor, width: 2),
            ),
          ),
          title: Text(
            postuser,
            style: TextStyle(color: Colors.white),
          ),
          trailing: More(clickvalue: isclicked, context: context),
        ),
      )
    ],
  );
}
