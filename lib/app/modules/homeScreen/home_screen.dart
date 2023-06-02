import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/post.dart';
import 'package:provider/provider.dart';

import '../../data/providers/AuthProvider.dart';
import '../../data/providers/HomeProvider.dart';
import 'inner_widgets/category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hp = Provider.of<HomeProvider>(context);
    final clickvalue = hp.isclicked;

    final ap = Provider.of<AuthProvider>(context);
    //get token
    ap.getToken();
    //check login status
    ap.checkLoginStatus(context);
    //call mycata function at initial state to get catalist
    hp.mycata.call();

    //var catalist = ap.catalist;

    //bool isclicked = true;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        body: clickvalue == true
            ? Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
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

                        SizedBox(
                          height: 25,
                        ),

                        // Post
                        HomePost(context, isclicked: clickvalue),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.8),
                  )
                ],
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
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

                        SizedBox(
                          height: 25,
                        ),

                        // Post
                        HomePost(context, isclicked: clickvalue),
                      ],
                    ),
                  ),
                  Container()
                ],
              ),
      ),
    );
  }
}
