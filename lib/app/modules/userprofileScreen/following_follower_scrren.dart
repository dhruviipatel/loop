import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';

import 'inner_widgets/followingWidget.dart';
import 'inner_widgets/posts.dart';

class FollowingFollowerScreen extends StatelessWidget {
  const FollowingFollowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbBgColor,
      appBar: AppBar(
        backgroundColor: appbBgColor,
        title: Text("Leslie@123"),
        titleSpacing: 0,
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                height: 60,
                child: TabBar(
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
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
                            Text(
                              "5145",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
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
                            Text(
                              "6897",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
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
              Expanded(child: TabBarView(children: [Following(), Followers()]))
            ],
          ),
        ),
      ),
    );
  }
}
