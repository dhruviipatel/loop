import 'package:flutter/material.dart';
import 'package:loop/app/data/providers/UserProfileProvider.dart';
import 'package:loop/app/modules/userprofileScreen/inner_widgets/videotab.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/themes.dart';
import '../../homeScreen/inner_widgets/postClick.dart';

Widget PostWidget(userpostlist, context) {
  return DefaultTabController(
    length: 3,
    child: Column(
      children: [
        Container(
          height: 40,
          child: TabBar(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            labelColor: appButtonColor,
            unselectedLabelColor: appHintTextColor,
            indicator: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              border: Border(
                top: BorderSide(color: appButtonColor),
              ),
            ),
            tabs: [
              Tab(
                child: Text("Home"),
              ),
              Tab(
                child: Text("Video"),
              ),
              Tab(
                child: Text("Pics"),
              ),
            ],
          ),
        ),
        Expanded(
            child: TabBarView(children: [
          userHomeTab(userpostlist, context),
          userVideoTab(userpostlist, context),
          userPicTab(userpostlist, context)
        ]))
      ],
    ),
  );
}

Widget userPicTab(userpostlist, context) {
  final up = Provider.of<UserProfileProvider>(context);
  up.getUserImageList(userpostlist);
  var userimagelist = up.userimagelist;
  // print("my image list:${userimagelist}");

  return GridView.builder(
    itemCount: userimagelist.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemBuilder: (context, index) {
      if (userimagelist.isNotEmpty) {
        if (userimagelist[index].postImage.length > 1) {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostClick(
                  postlist: userimagelist[index],
                ),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            userimagelist[index].postImage[0].postImage),
                      ),
                      border: Border.all(color: Colors.grey)),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 100, top: 5),
                    child: Icon(
                      MdiIcons.cardMultiple,
                      size: 20,
                      color: Colors.white,
                    )),
              ],
            ),
          );
        } else {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostClick(
                  postlist: userimagelist[index],
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        userimagelist[index].postImage[0].postImage),
                  ),
                  border: Border.all(color: Colors.grey)),
            ),
          );
        }
      }

      return Container();
    },
  );
}

Widget userVideoTab(userpostlist, context) {
  final up = Provider.of<UserProfileProvider>(context);
  up.getUserVideoList(userpostlist);
  var uservideolist = up.uservideolist;
  // print("my video list:${uservideolist}");

  return GridView.builder(
    itemCount: uservideolist.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemBuilder: (context, index) {
      if (uservideolist.isNotEmpty) {
        return Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              VideoPost(videoUrl: uservideolist[index].postVideo[0].postVideo),
              Icon(
                Icons.play_circle,
                color: Colors.white,
              )
            ]);
      }
      return Container();
    },
  );
}

Widget userHomeTab(userpostlist, context) {
  // print("my userpostlist:${userpostlist}");

  return GridView.builder(
    itemCount: userpostlist.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemBuilder: (context, index) {
      if (userpostlist.isNotEmpty) {
        if (userpostlist[index].postImage.isNotEmpty) {
          if (userpostlist[index].postImage.length > 1) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostClick(
                    postlist: userpostlist[index],
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              userpostlist[index].postImage[0].postImage),
                        ),
                        border: Border.all(color: Colors.grey)),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 100, top: 5),
                      child: Icon(
                        MdiIcons.cardMultiple,
                        size: 20,
                        color: Colors.white,
                      )),
                ],
              ),
            );
          } else {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostClick(
                    postlist: userpostlist[index],
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            userpostlist[index].postImage[0].postImage)),
                    border: Border.all(color: Colors.grey)),
              ),
            );
          }
        } else if (userpostlist[index].postVideo.isNotEmpty) {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostClick(
                  postlist: userpostlist[index],
                ),
              ),
            ),
            child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  VideoPost(
                      videoUrl: userpostlist[index].postVideo[0].postVideo),
                  Icon(
                    Icons.play_circle,
                    color: Colors.white,
                  )
                ]),
          );
        } else {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostClick(
                  postlist: userpostlist[index],
                ),
              ),
            ),
            child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Center(
                    child: Text(
                  userpostlist[index].postCaption,
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ))),
          );
        }
      }

      return Container();
    },
  );
}
