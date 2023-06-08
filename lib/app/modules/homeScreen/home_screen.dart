import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/category.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/post.dart';
import 'package:provider/provider.dart';
import '../../data/providers/AuthProvider.dart';
import '../../data/providers/HomeProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hp = Provider.of<HomeProvider>(context);
    final isclicked = hp.click;

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
        body: isclicked == true
            ? Stack(
                children: [
                  HomePost(hp, postlist, userlist, isclicked, context),
                  Container(
                    color: Colors.black.withOpacity(0.8),
                  )
                ],
              )
            : Stack(
                children: [
                  HomePost(hp, postlist, userlist, isclicked, context),
                  Container()
                ],
              ),
      ),
    );
  }
}

Widget HomePost(hp, postlist, userlist, isclcked, context) {
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

      Expanded(child: MyHomePost(hp, isclcked, postlist, context)),
    ],
  );
}
