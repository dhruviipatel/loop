import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/homeScreen/inner_widgets/post.dart';
import 'package:provider/provider.dart';

import 'inner_widgets/category.dart';
import 'inner_widgets/homeProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final v1 = Provider.of<HomeProvider>(context);
    final clickvalue = v1.isclicked;
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
                            onTap: () => v1.click(),
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
                            onTap: () => v1.click(),
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
