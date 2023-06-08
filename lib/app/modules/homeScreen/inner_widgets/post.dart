import 'package:flutter/material.dart';
import 'package:loop/app/modules/commentScreen/comment_screen.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/postClick.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../core/themes/themes.dart';
import 'more.dart';

Widget MyHomePost(hp, clickvalue, postlist, context) {
  return ListView.builder(
    itemCount: postlist.length,
    itemBuilder: (context, index) {
      final mypostImage = postlist[index].postImage;
      final mypostVideo = postlist[index].postVideo;
      final mypostComment = postlist[index].postComments;
      final postCaption = postlist[index].postCaption ?? "";
      //print(mypostComment);
      // Check if postImage list is not empty and has enough elements
      final hasPostImage = mypostImage.isNotEmpty && index < mypostImage.length;

      //Check if postComment list is not empty and has enough elements
      final hasPostComment =
          mypostComment.isNotEmpty && index < mypostComment.length;

      // Check if postVideo list is not empty and has enough elements
      final hasPostVideo = mypostVideo.isNotEmpty && index < mypostVideo.length;

      //get post user data
      final postuserId = postlist[index].customerId;
      hp.postuserdata(postuserId);
      var postuser = hp.postuser;
      var postuserprofile = hp.postuserprofile;
      String profileImageUrl =
          "https://looptest.inventdi.com/profile_images/" + postuserprofile;

      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          height: 557,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: appbBgColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 3))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 74,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 15, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(profileImageUrl),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border:
                                  Border.all(color: appButtonColor, width: 2),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            postuser,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                      More(clickvalue: clickvalue, context: context),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostClick(
                      postuser: postuser,
                      postlist: postlist[index],
                      postuserImage: profileImageUrl,
                    ),
                  ),
                ),
                child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: hasPostImage
                        ? PageView.builder(
                            onPageChanged: (index1) {
                              hp.ImageViews(mypostImage);
                            },
                            itemCount: mypostImage.length,
                            itemBuilder: (context, idx1) {
                              return Image.network(
                                mypostImage[idx1].postImage,
                                fit: BoxFit.cover,
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
                                  postlist[index].postCaption ?? "",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
              ),
              SizedBox(
                height: 17,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                            size: 15,
                          ),
                          Text(
                            postlist[index].postLikesCount.toString(),
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          Container(
                            height: 15,
                            width: 1,
                            child: VerticalDivider(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            MdiIcons.chatProcessing,
                            color: appButtonColor,
                            size: 15,
                          ),
                          Text(
                            postlist[index].postCommentsCount.toString(),
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          MdiIcons.update,
                          color: Colors.white,
                          size: 12,
                        ),
                        Text(
                          postlist[index].humanReadableCreatedDate,
                          style: TextStyle(fontSize: 9, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 14),
                child: Row(
                  children: [
                    Text(
                      postuser,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      postCaption,
                      style: TextStyle(fontSize: 12, color: appHintTextColor),
                    )
                  ],
                ),
              ),
              hasPostComment
                  ? Padding(
                      padding: const EdgeInsets.only(left: 25, top: 6),
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentScreen(),
                            )),
                        child: Text(
                          "View All ${postlist[index].postCommentsCount.toString()} Comments",
                          style:
                              TextStyle(fontSize: 12, color: appHintTextColor),
                        ),
                      ),
                    )
                  : Container(
                      height: 15,
                    ),
              hasPostComment
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 6, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "jinal",
                                style:
                                    TextStyle(fontSize: 9, color: Colors.white),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "test user",
                                style: TextStyle(
                                    fontSize: 9, color: appHintTextColor),
                              )
                            ],
                          ),
                          Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                            size: 15,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 15,
                    ),
              Divider(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 10, top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 240,
                      child: Row(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/noprofile.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border:
                                  Border.all(color: appButtonColor, width: 2),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: TextField(
                              cursorColor: Colors.white,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                              decoration: InputDecoration(
                                  hintText: "Add a comments...",
                                  hintStyle: TextStyle(color: appHintTextColor),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Post",
                      style: TextStyle(color: appButtonColor, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
