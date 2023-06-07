import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../data/providers/AuthProvider.dart';
import '../../data/providers/HomeProvider.dart';
import '../commentScreen/comment_screen.dart';
import 'inner_widgets/category.dart';
import 'inner_widgets/more.dart';
import 'inner_widgets/postClick.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hp = Provider.of<HomeProvider>(context, listen: false);
    final clickvalue = hp.isclicked;

    hp.mypost.call(context);
    var postlist = hp.postlist;

    //call mycata function at initial state to get catalist
    hp.mycata.call();

    var userlist = hp.allUsers;

    final ap = Provider.of<AuthProvider>(context);
    //get token
    ap.getToken();
    //check login status
    ap.checkLoginStatus(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        body: clickvalue == true
            ? Stack(
                children: [
                  HomePageData(hp, clickvalue, postlist, userlist),
                  Container(
                    color: Colors.black.withOpacity(0.8),
                  )
                ],
              )
            : Stack(
                children: [
                  HomePageData(hp, clickvalue, postlist, userlist),
                  Container()
                ],
              ),
      ),
    );
  }
}

Widget HomePageData(hp, clickvalue, postlist, userlist) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: InkWell(
          onTap: () => hp.click(),
          child: Image.asset(
            "assets/images/logo.png",
            height: 43,
            width: 97,
          ),
        ),
      ),
      SizedBox(
        height: 28,
      ),
      // horizontal categoty
      Category(),

      Expanded(
        child: ListView.builder(
          itemCount: postlist.length,
          itemBuilder: (context, index) {
            final post = postlist[index];

            final postImage = post.postImage;

            final postVideo = post.postVideo;

            final postComment = post.postComments;

            final postuserlist = hp.postUserlist;

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
                                      image: NetworkImage(
                                        "https://looptest.inventdi.com/profile_images/${postuserlist[index].profileImage}",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    border: Border.all(
                                        color: appButtonColor, width: 2),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  postuserlist[index].name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                            More(isclicked: clickvalue, context),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostClick(
                            postUserlist: postuserlist[index],
                          ),
                        ),
                      ),
                      child: Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: postImage.isNotEmpty
                              ?
                              //for image post
                              Image.asset(
                                  "assets/images/post.png",
                                  fit: BoxFit.cover,
                                )
                              : postVideo.isNotEmpty
                                  ?
                                  //for video post
                                  Image.asset(
                                      "assets/images/post1.png",
                                      fit: BoxFit.cover,
                                    )
                                  :
                                  //for text post
                                  Center(
                                      child: Text(
                                        post.postCaption,
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
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
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
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
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
                                // "1 hour ago",
                                style:
                                    TextStyle(fontSize: 9, color: Colors.white),
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
                            "Testing User",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Test",
                            style: TextStyle(
                                fontSize: 12, color: appHintTextColor),
                          )
                        ],
                      ),
                    ),
                    Padding(
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
                    ),
                    Padding(
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
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 10, top: 3),
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
                                    border: Border.all(
                                        color: appButtonColor, width: 2),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: TextField(
                                    cursorColor: Colors.white,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    decoration: InputDecoration(
                                        hintText: "Add a comments...",
                                        hintStyle:
                                            TextStyle(color: appHintTextColor),
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Post",
                            style:
                                TextStyle(color: appButtonColor, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
