import 'package:flutter/material.dart';
import '../../../core/themes/themes.dart';

Widget Following() {
  return ListView.builder(
    itemCount: 4,
    itemBuilder: (context, index) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/profile.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Broo_Simmons",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Brooklyn_Simmons",
                          style:
                              TextStyle(fontSize: 12, color: appHintTextColor),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: appButtonColor),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Following",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.more_vert, color: appHintTextColor)
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ],
      );
    },
  );
}

Widget Followers() {
  return ListView.builder(
    itemCount: 4,
    itemBuilder: (context, index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/profile.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Broo_Simmons",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Brooklyn_Simmons",
                          style:
                              TextStyle(fontSize: 12, color: appHintTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: appbBgColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(50))),
                      context: context,
                      builder: (context) => DraggableScrollableSheet(
                        expand: false,
                        initialChildSize: 0.45,
                        minChildSize: 0.3,
                        maxChildSize: 0.8,
                        builder: (context, scrollController) =>
                            SingleChildScrollView(
                          child: RemoveFollowerSheet(context),
                        ),
                      ),
                    ),
                  },
                  child: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: appButtonColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Remove",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 65, bottom: 15, top: 5),
            child: Text(
              "Follow",
              style: TextStyle(fontSize: 12, color: appButtonColor),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ],
      );
    },
  );
}

Widget RemoveFollowerSheet(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 50),
    child: Column(
      children: [
        SizedBox(height: 30),
        Container(
          color: appHintTextColor,
          height: 3,
          width: 150,
        ),
        SizedBox(height: 30),
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              image: AssetImage(
                "assets/images/profile.png",
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Remove Follower ?",
          style: TextStyle(
              color: Colors.white, fontSize: 21, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 10),
        Text(
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: appHintTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: appButtonColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Remove",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 120,
                height: 35,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
