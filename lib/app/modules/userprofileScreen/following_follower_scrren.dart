import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:provider/provider.dart';
import '../../data/providers/UserProfileProvider.dart';
import 'inner_widgets/followingWidget.dart';

class FollowingFollowerScreen extends StatelessWidget {
  final int initialIndex;
  final int userid;
  final String username;
  const FollowingFollowerScreen(
      {super.key,
      required this.userid,
      required this.username,
      required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProfileProvider>(
      create: (BuildContext context) => UserProfileProvider()
        ..myfollowers(userid)
        ..myfollowing(userid),
      child: Consumer<UserProfileProvider>(
        builder: (context, up, child) {
          var followerlist = up.followerList;
          var followinglist = up.followingList;
          return Scaffold(
            backgroundColor: appbBgColor,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: appbBgColor,
              title: Text(
                username,
                style: TextStyle(color: Colors.white),
              ),
              titleSpacing: 0,
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: DefaultTabController(
                initialIndex: initialIndex,
                length: 2,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      child: TabBar(
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        indicator: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: appButtonColor),
                          ),
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              child: Column(
                                children: [
                                  Consumer<UserProfileProvider>(
                                    builder: (context, up, child) {
                                      return Text(
                                        up.followingList.length.toString(),
                                        //up.followinglist.length.toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 5),
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
                          ),
                          Tab(
                            child: Container(
                              child: Column(
                                children: [
                                  Consumer<UserProfileProvider>(
                                    builder: (context, up, child) {
                                      return Text(
                                        up.followerList.length.toString(),
                                        // followerlist.length.toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Followers",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: appHintTextColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: TabBarView(children: [
                      Following(followinglist),
                      Followers(followerlist, followinglist)
                    ]))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
