import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/data/models/userPostModel.dart';
import 'package:loop/app/data/providers/HomeProvider.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/post.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'more.dart';

class PostClick extends StatelessWidget {
  final Post postlist;

  PostClick({
    Key? key,
    required this.postlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<HomeProvider>(
        builder: (context, hp, _) {
          final clickvalue = hp.isclicked;

          var postuserid = postlist.customerId;
          hp.postuserdata(postuserid);

          return Scaffold(
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
                    borderRadius: BorderRadius.circular(15),
                  ),
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
            body: Stack(
              children: [
                InnerPage(postlist: postlist, isclicked: clickvalue),
                if (clickvalue)
                  Container(
                    color: Colors.black.withOpacity(0.8),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class InnerPage extends StatelessWidget {
  final Post postlist;
  final bool isclicked;

  InnerPage({
    Key? key,
    required this.postlist,
    required this.isclicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, hp, _) {
        final hasPostImage = postlist.postImage.isNotEmpty;
        final hasPostVideo = postlist.postVideo.isNotEmpty;
        String profileImageUrl =
            "https://looptest.inventdi.com/profile_images/" +
                hp.postuserprofile;

        return Stack(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
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
                        ? PageView.builder(
                            onPageChanged: (index1) {
                              hp.ImageViews(postlist.postVideo);
                            },
                            itemCount: postlist.postVideo.length,
                            itemBuilder: (context, idx2) {
                              return PostVideoPart(
                                  mypostvideo: postlist.postVideo[idx2]);
                            },
                          )
                        : Center(
                            child: Text(
                              postlist.postCaption ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
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
                    image: DecorationImage(
                      image: NetworkImage(profileImageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(color: appButtonColor, width: 2),
                  ),
                ),
                title: Text(
                  hp.postuser,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: More(clickvalue: isclicked, context: context),
              ),
            ),
          ],
        );
      },
    );
  }
}
