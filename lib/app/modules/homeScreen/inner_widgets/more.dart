import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../../data/providers/HomeProvider.dart';
import 'bottomsheet.dart';

Widget More(context, {required isclicked}) {
  final hp = Provider.of<HomeProvider>(context);

  return InkWell(
    onTap: () {
      hp.click();
    },
    child: PopupMenuButton(
      onOpened: () => hp.click(),
      onCanceled: () {
        hp.click();
      },
      color: appbBgColor,
      child: Icon(
        MdiIcons.dotsHorizontal,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      itemBuilder: (context) => [
        PopupMenuItem(
          height: 50,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  child: InkWell(
                    onTap: () => {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: appbBgColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50))),
                        context: context,
                        builder: (context) => DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.55,
                          minChildSize: 0.3,
                          maxChildSize: 0.8,
                          builder: (context, scrollController) =>
                              SingleChildScrollView(
                            child: BottomUnfollowSheet(context),
                          ),
                        ),
                      ),
                    },
                    child: Text("Unfollow",
                        style: GoogleFonts.ibmPlexMono(
                          textStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              )
            ],
          ),
        ),
        PopupMenuItem(
          height: 50,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  child: InkWell(
                    onTap: () => {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: appbBgColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50))),
                        context: context,
                        builder: (context) => DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.6,
                          minChildSize: 0.3,
                          maxChildSize: 0.8,
                          builder: (context, scrollController) =>
                              SingleChildScrollView(
                            child: BottomReportSheet(context),
                          ),
                        ),
                      ),
                    },
                    child: Text("Report",
                        style: GoogleFonts.ibmPlexMono(
                          textStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              )
            ],
          ),
        ),
        PopupMenuItem(
          height: 30,
          padding: EdgeInsets.zero,
          child: Container(
            width: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: InkWell(
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
                      initialChildSize: 0.38,
                      minChildSize: 0.3,
                      maxChildSize: 0.8,
                      builder: (context, scrollController) =>
                          SingleChildScrollView(
                        child: BottomSharetoSheet(context),
                      ),
                    ),
                  ),
                },
                child: Text("Share to...",
                    style: GoogleFonts.ibmPlexMono(
                      textStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    )),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
