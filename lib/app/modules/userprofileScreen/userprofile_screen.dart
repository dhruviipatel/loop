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
    final up = Provider.of<UserProfileProvider>(context);
    final hp = Provider.of<HomeProvider>(context);
    final clickvalue = up.buttonclicked;

    final ap = Provider.of<AuthProvider>(context);
    var user = ap.user;

    var userid = 0;
    var profileImage = '';
    var username = '';
    if (user != null) {
      profileImage = user.profileImage;
      username = user.name;
      userid = user.id;
    } else {
      print("we can't get user");
    }

    up.getUserAllPost(userid, hp.postlist);
    up.myfollowers(userid);
    up.myfollowing(userid);

    var userpostlist = up.userpostlist;
    var followerlist = up.followerList;
    var followinglist = up.followingList;

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
                child: PostWidget(userpostlist, context),
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
