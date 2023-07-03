import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/data/providers/HomeProvider.dart';
import 'package:loop/app/modules/authenticationScreens/Editprofile_screen.dart';
import 'package:loop/app/modules/userprofileScreen/following_follower_scrren.dart';
import 'package:loop/app/modules/userprofileScreen/inner_widgets/posts.dart';
import 'package:loop/app/modules/userprofileScreen/inner_widgets/setting.dart';
import 'package:provider/provider.dart';
import '../../data/providers/AuthProvider.dart';
import '../../data/providers/UserProfileProvider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.read<AuthProvider>().user;
    var userid = 0;
    var profileImage = "";
    var username = "";
    if (user != null) {
      userid = user.id;
      profileImage = user.profileImage;
      username = user.name;
    }

    var postlist = context.read<HomeProvider>().postlist;
    context.read<HomeProvider>().mypost(context);
    context.read<UserProfileProvider>().getUserAllPost(userid, postlist);
    context.read<UserProfileProvider>().myfollowers(userid);
    context.read<UserProfileProvider>().myfollowing(userid);

    var userpostlist = context.read<UserProfileProvider>().userpostlist;
    var followerlist = context.read<UserProfileProvider>().followerList;
    var followinglist = context.read<UserProfileProvider>().followingList;

    context.read<UserProfileProvider>().getUserImageList(userpostlist);
    var userimagelist = context.read<UserProfileProvider>().userimagelist;

    context.read<UserProfileProvider>().getUserVideoList(userpostlist);
    var uservideolist = context.read<UserProfileProvider>().uservideolist;
    final clickvalue = context.read<UserProfileProvider>().buttonclicked;

    return Scaffold(
      backgroundColor: appbBgColor,
      body: Stack(
        children: [
          Column(
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
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(),
                            ),
                          ),
                          child: Icon(
                            IconlyLight.edit,
                            size: 27,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 18),
                        Setting(context, isbtnclicked: clickvalue),
                      ],
                    ),
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
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
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
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          "Posts",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: appHintTextColor,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FollowingFollowerScreen(
                              initialIndex: 0,
                              userid: userid,
                              username: username,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            followinglist.length.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Following",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: appHintTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FollowingFollowerScreen(
                              initialIndex: 1,
                              userid: userid,
                              username: username,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            followerlist.length.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Followers",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: appHintTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PostWidget(
                    userpostlist, userimagelist, uservideolist, context),
              ),
            ],
          ),
          if (clickvalue == true)
            Container(
              color: Colors.black.withOpacity(0.8),
            ),
        ],
      ),
    );
  }
}
