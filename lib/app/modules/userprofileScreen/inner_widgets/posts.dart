import 'package:flutter/material.dart';

import '../../../core/themes/themes.dart';

List postlist = [
  AssetImage("assets/images/post3.png"),
  AssetImage("assets/images/post2.png"),
  AssetImage("assets/images/post1.png"),
  AssetImage("assets/images/post4.png"),
  AssetImage("assets/images/post5.png"),
  AssetImage("assets/images/post6.png"),
  AssetImage("assets/images/post7.png"),
  AssetImage("assets/images/post8.png"),
  AssetImage("assets/images/post9.png"),
  AssetImage("assets/images/post10.png"),
  AssetImage("assets/images/post11.png"),
  AssetImage("assets/images/post12.png"),
  AssetImage("assets/images/post13.png"),
  AssetImage("assets/images/post14.png"),
  AssetImage("assets/images/post15.png"),
];
Widget PostWidget() {
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
        Expanded(child: TabBarView(children: [myTab(), myTab(), myTab()]))
      ],
    ),
  );
}

Widget myTab() {
  return GridView.builder(
    itemCount: postlist.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: postlist[index]),
            border: Border.all(color: Colors.grey)),
      );
    },
  );
}
