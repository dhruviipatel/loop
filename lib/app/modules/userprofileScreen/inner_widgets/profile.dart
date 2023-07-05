import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/modules/userprofileScreen/inner_widgets/posts.dart';
import 'package:loop/app/modules/userprofileScreen/inner_widgets/setting.dart';
import 'package:provider/provider.dart';

import '../../../core/themes/themes.dart';
import '../../../data/models/searchingModel.dart';
import '../../../data/providers/AuthProvider.dart';
import '../../../data/providers/HomeProvider.dart';
import '../../../data/providers/UserProfileProvider.dart';
import '../../authenticationScreens/Editprofile_screen.dart';
import '../following_follower_scrren.dart';

class Profile extends StatelessWidget {
  final Search searchuser;
  const Profile({super.key, required this.searchuser});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context);
    final up = Provider.of<UserProfileProvider>(context);
    final clickvalue = up.buttonclicked;

    var userid = 0;
    var profileImage =
        "https://looptest.inventdi.com/profile_images/default.png";
    var username = '';
    if (searchuser != null) {
      if (searchuser.profileImage.isNotEmpty) {
        profileImage = searchuser.profileImage;
      } else {
        profileImage =
            "https://looptest.inventdi.com/profile_images/default.png";
      }

      username = searchuser.name;
      userid = searchuser.id;
    } else {
      print("we can't get user");
    }

    final hp = Provider.of<HomeProvider>(context);
    hp.mypost(context);

    up.getmyuserpost(userid);
    var userpostlist = up.userpostlist;

    up.myfollowing(userid);
    var followinglist = up.followingList;

    up.myfollowers(userid);
    var followerlist = up.followerList;

    up.getUserImageList(userpostlist);
    var userimagelist = up.userimagelist;
    up.getUserVideoList(userpostlist);
    var uservideolist = up.uservideolist;

    // print(followinglist);
    print("profile111111:${profileImage}");

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profile",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              searchuser == ap.user
                  ? Row(
                      children: [
                        InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfileScreen(),
                                )),
                            child: Icon(IconlyLight.edit,
                                size: 27, color: Colors.white)),
                        SizedBox(width: 18),
                        Setting(context, isbtnclicked: clickvalue),
                      ],
                    )
                  : Container(
                      height: 5,
                      width: 5,
                    )
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: appButtonColor),
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 234, 226, 226),
                image: DecorationImage(
                  image: NetworkImage(profileImage),
                ),
              ),
            ),
          ),
        ),
        Text(
          username,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    userpostlist.length.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Posts",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: appHintTextColor),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FollowingFollowerScreen(
                      initialIndex: 0,
                      userid: userid,
                      username: username,
                    ),
                  ));
                },
                child: Column(
                  children: [
                    Text(
                      followinglist.length.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 7),
                    Text(
                      "Following",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: appHintTextColor),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FollowingFollowerScreen(
                      initialIndex: 1,
                      userid: userid,
                      username: username,
                    ),
                  ));
                },
                child: Column(
                  children: [
                    Text(
                      followerlist.length.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 7),
                    Text(
                      "Followers",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: appHintTextColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child:
              PostWidget(userpostlist, userimagelist, uservideolist, context),
        ),
      ],
    );
  }
}
