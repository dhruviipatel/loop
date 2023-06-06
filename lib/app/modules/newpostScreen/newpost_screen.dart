import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../userprofileScreen/inner_widgets/posts.dart';
import 'editpost/editnavbar.dart';

class NewpostScreen extends StatelessWidget {
  const NewpostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: appbBgColor,
            elevation: 0.0,
            leading: InkWell(
                onTap: () {},
                child: Icon(
                  MdiIcons.close,
                  color: Colors.white,
                )),
            titleSpacing: 0,
            title: Text("New Post",
                style: GoogleFonts.ibmPlexMono(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 21),
                )),
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: InkWell(
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(
                    builder: (context) => EditNavbar(),
                  )),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: appButtonColor,
                  ),
                ),
              )
            ],
          ),
          backgroundColor: appbBgColor,
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/post.png",
                    fit: BoxFit.fill,
                  ),
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gallery",
                      style: GoogleFonts.ibmPlexMono(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 21),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          IconlyLight.camera,
                          color: Colors.white,
                        ),
                        20.widthBox,
                        Image.asset(
                          "assets/images/check.png",
                        ),
                      ],
                    )
                  ],
                ),
                25.heightBox,
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Choose Category",
                            style: GoogleFonts.ibmPlexMono(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            )),
                        Icon(
                          MdiIcons.chevronDown,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                20.heightBox,
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: postlist.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: postlist[index]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
