import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../core/themes/themes.dart';
import 'more.dart';

Widget HomePost(context, {required isclicked}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Container(
      height: 557,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: appbBgColor,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 74,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 15, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/profile.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(color: appButtonColor, width: 2),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Esther Howard",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                  More(isclicked: isclicked, context),
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/post.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                        size: 15,
                      ),
                      Text(
                        "3",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Container(
                        height: 15,
                        width: 1,
                        child: VerticalDivider(
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        MdiIcons.chatProcessing,
                        color: appButtonColor,
                        size: 15,
                      ),
                      Text(
                        "1",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      MdiIcons.update,
                      color: Colors.white,
                      size: 12,
                    ),
                    Text(
                      "6 Months Ago",
                      style: TextStyle(fontSize: 9, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 14),
            child: Row(
              children: [
                Text(
                  "Testing User",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Test",
                  style: TextStyle(fontSize: 12, color: appHintTextColor),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 6),
            child: Text(
              "View All 1 Comments",
              style: TextStyle(fontSize: 12, color: appHintTextColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 6, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "jinal",
                      style: TextStyle(fontSize: 9, color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "test user",
                      style: TextStyle(fontSize: 9, color: appHintTextColor),
                    )
                  ],
                ),
                Icon(
                  Icons.favorite_outline,
                  color: Colors.white,
                  size: 15,
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 10, top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 240,
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/profile.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(color: appButtonColor, width: 2),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          decoration: InputDecoration(
                              hintText: "Add a comments...",
                              hintStyle: TextStyle(color: appHintTextColor),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Post",
                  style: TextStyle(color: appButtonColor, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
