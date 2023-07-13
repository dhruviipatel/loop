import 'dart:async';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_editor_plus/data/image_item.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/bottomNavbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class AddpostInfoscreen extends StatefulWidget {
  final List<ImageItem> imageBytesList;
  const AddpostInfoscreen({super.key, required this.imageBytesList});

  @override
  State<AddpostInfoscreen> createState() => _AddpostInfoscreenState();
}

class _AddpostInfoscreenState extends State<AddpostInfoscreen> {
  Uint8List convertUint8ListToJpeg(Uint8List imageData) {
    final image = img.decodeImage(imageData);
    final jpegData = img.encodeJpg(image!, quality: 85);
    print("jpeg data ${jpegData}");
    return Uint8List.fromList(jpegData);
  }

  Future<List<Uint8List>> convertUint8ListImagesToJpeg(
      List<Uint8List> imagesData) async {
    final List<Uint8List> jpegImages = [];

    for (final imageData in imagesData) {
      final jpegData = await FlutterImageCompress.compressWithList(
        imageData,
        format: CompressFormat.jpeg,
        quality: 85,
      );

      jpegImages.add(jpegData);
      print("jpeg images : ${jpegImages}");
    }

    return jpegImages;
  }

  @override
  void initState() {
    super.initState();
    //convertUint8ListImagesToJpeg(widget.imageBytesList);
    //convertUint8ListToJpeg(widget.imageBytesList[0]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        appBar: AppBar(
          backgroundColor: appbBgColor,
          elevation: 0.0,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: appButtonColor,
            ),
          ),
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
                onTap: () {
                  //context.read<BottomNavbarProvider>().clearNavigatorKeys();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BottomNavbar(),
                  ));
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: appButtonColor,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              TextFormField(
                minLines: 8,
                cursorColor: Colors.white,
                style: GoogleFonts.ibmPlexMono(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 21),
                ),
                decoration: InputDecoration(
                    hintText: "Type a text",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 21),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                keyboardType: TextInputType.multiline,
                maxLines: null,
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
              17.heightBox,
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              12.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Location",
                    style: GoogleFonts.ibmPlexMono(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 21),
                    ),
                  ),
                  Image.asset("assets/images/switch.png"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
