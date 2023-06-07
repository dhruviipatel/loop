import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/data/models/userPostModel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class PostClick extends StatelessWidget {
  final Users postUserlist;
  PostClick({
    Key? key,
    required this.postUserlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        bottomSheet: BottomSheet(
          backgroundColor: appbBgColor,
          elevation: 0.0,
          enableDrag: false,
          onClosing: () {},
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15)),
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Icon(
                      IconlyBold.heart,
                      color: appButtonColor,
                    ),
                    6.widthBox,
                    Text(
                      "458",
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
                      child: VerticalDivider(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      IconlyLight.chat,
                      color: Colors.white,
                    ),
                    6.widthBox,
                    Text(
                      "652",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              child: Image.asset(
                "assets/images/post.png",
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                leading: Container(
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
                    border: Border.all(color: appButtonColor, width: 2),
                  ),
                ),
                title: Text(
                  postUserlist.name,
                  //"Esther Howarlds",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  MdiIcons.dotsHorizontal,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
