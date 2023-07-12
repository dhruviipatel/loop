import 'package:flutter/material.dart';
import 'package:loop/app/modules/userprofileScreen/inner_widgets/posts.dart';
import 'package:loop/app/modules/userprofileScreen/inner_widgets/profilepostswidget.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/themes.dart';
import '../../../data/models/searchingModel.dart';
import '../../../data/providers/AuthProvider.dart';
import '../../../data/providers/HomeProvider.dart';
import '../../../data/providers/UserProfileProvider.dart';

class Profile extends StatelessWidget {
  final Search searchuser;
  const Profile({super.key, required this.searchuser});

  @override
  Widget build(BuildContext context) {
    var loginuser = context.read<AuthProvider>().user;
    var loginuserid = 0;

    if (loginuser != null) {
      loginuserid = loginuser.id;
    }

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

    //check user following his follower or not

    // var user = context.read<AuthProvider>().user;
    // var userid = 0;
    // var profileImage = "";
    // var username = "";
    // if (user != null) {
    //   userid = user.id;
    //   profileImage = user.profileImage;
    //   username = user.name;
    // }

    return ChangeNotifierProvider<HomeProvider>(
      create: (BuildContext context) => HomeProvider()..mypost(context),
      child: Consumer<HomeProvider>(
        builder: (BuildContext context, hp, child) {
          var postlist = hp.postlist;
          print(postlist);
          if (postlist.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ChangeNotifierProvider<UserProfileProvider>(
            create: (BuildContext context) => UserProfileProvider()
              ..getUserAllPost(userid, postlist)
              ..myfollowers(userid)
              ..myfollowing(userid),
            child: Consumer<UserProfileProvider>(
              builder: (context, up, child) {
                var userpostlist = up.userpostlist;
                var followerlist = up.followerList;

                var followinglist = up.followingList;

                print("followerlist $followerlist");

                up.getUserImageList(userpostlist);
                up.getUserVideoList(userpostlist);

                var userimagelist = up.userimagelist;
                var uservideolist = up.uservideolist;
                var clickvalue = up.buttonclicked;

                up.getprofilefollowing(followerlist, loginuserid);
                var isfollowing = up.isprofilefollowing;

                print("isfollowing $isfollowing");

                return Scaffold(
                  backgroundColor: appbBgColor,
                  body: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
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
                                  border: Border.all(
                                      width: 2, color: appButtonColor),
                                  borderRadius: BorderRadius.circular(15),
                                  color:
                                      const Color.fromARGB(255, 234, 226, 226),
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
                          isfollowing == false
                              ? Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                  child: InkWell(
                                    onTap: () {
                                      up.followUser(
                                          userid, loginuserid, context);

                                      up.isprofilefollowing = true;
                                      //up.followerList.length++;

                                      up.myfollowers(userid);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: appButtonColor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      height: 40,
                                      child: Center(
                                          child: Text(
                                        "Follow",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                  child: InkWell(
                                    onTap: () {
                                      up.UnFollowUser(
                                          userid, loginuserid, context);

                                      up.followerList.length--;

                                      up.isprofilefollowing = false;
                                      up.myfollowers(userid);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: appbBgColor,
                                          border:
                                              Border.all(color: appButtonColor),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      height: 40,
                                      child: Center(
                                          child: Text(
                                        "Unfollow",
                                        style: TextStyle(
                                            color: appButtonColor,
                                            fontSize: 15),
                                      )),
                                    ),
                                  ),
                                ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Consumer<UserProfileProvider>(
                                      builder: (context, up, child) {
                                        return Text(
                                          up.userpostlist.length.toString(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
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
                                Column(
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
                                Column(
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
                              ],
                            ),
                          ),
                          Expanded(
                            child: ProfilePostWidget(userpostlist,
                                userimagelist, uservideolist, context),
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
              },
            ),
          );
        },
      ),
    );
  }
}
