import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_editor_plus/data/image_item.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_editor_plus/utils.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:loop/app/modules/newpostScreen/addpostInfo_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../data/providers/HomeProvider.dart';
import 'inner_widgets/Scrollbar.dart';
import 'inner_widgets/media_service.dart';

class NewpostScreen extends StatefulWidget {
  const NewpostScreen({super.key});

  @override
  State<NewpostScreen> createState() => _NewpostScreenState();
}

class _NewpostScreenState extends State<NewpostScreen> {
  AssetEntity? selectedEntity;
  AssetPathEntity? selectedAlbum;
  List<AssetPathEntity> albumList = [];
  List<AssetEntity> assetList = [];
  List<AssetEntity> selectedAssetList = [];

  bool isMultiple = false;

  bool isStrechedDropDown = false;
  int? cataid;
  String title = 'Choose Category';

  @override
  void initState() {
    MediaServices().loadAlbums(RequestType.common).then(
      (value) {
        setState(() {
          albumList = value;
          selectedAlbum = value[0];
        });
        //LOAD RECENT ASSETS
        MediaServices().loadAssets(selectedAlbum!).then(
          (value) {
            setState(() {
              selectedEntity = value[0];
              assetList = value;
            });
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String selectedtitle = "";
    if (selectedAlbum != null) {
      selectedtitle = selectedAlbum!.name;
      var selectedname = selectedAlbum!.name;
      if (selectedname.length > 15) {
        selectedtitle = selectedname.substring(0, 15) + "...";
      } else {
        selectedtitle = selectedname;
      }
    }

    var height = MediaQuery.of(context).size.height;
    context.read<HomeProvider>().mycata();
    var catalist = context.read<HomeProvider>().catalist;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appbBgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appbBgColor,
          leading: const CloseButton(
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text(
            "New Post",
            style: GoogleFonts.ibmPlexMono(
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 21,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (imageBytesList.isNotEmpty) {
                  if (imageBytesList.length > 1) {
                    var editedImage =
                        await Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (context) => ImageEditor(
                          images: imageBytesList,
                          maxLength: 10,
                          allowMultiple: true,
                          features: const ImageEditorFeatures(
                            crop: true,
                            blur: true,
                            brush: true,
                            emoji: true,
                            filters: true,
                            flip: true,
                            rotate: true,
                            text: true,
                          ),
                        ),
                      ),
                    );

                    // replace with edited image
                    // if (editedImage != null) {
                    //   print("editedImage ${editedImage}");
                    //   imageBytesList = editedImage;
                    //   setState(() {});
                    // }
                    await Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(
                      builder: (context) => AddpostInfoscreen(
                        imageBytesList: editedImage,
                      ),
                    ));
                  } else {
                    var editedImage =
                        await Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    ImageEditor(image: imageBytesList[0])));

                    // replace with edited image
                    List<ImageItem> editedlist = [];
                    if (editedImage != null) {
                      editedlist[0] = editedImage;
                      print("edi $editedImage");
                      //imageBytesList[0] = editedImage;
                      setState(() {});
                    }
                    await Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(
                            builder: (context) => AddpostInfoscreen(
                                  imageBytesList: editedImage,
                                )));
                  }
                }
                // await Navigator.of(context, rootNavigator: true)
                //     .push(MaterialPageRoute(
                //         builder: (context) => AddpostInfoscreen(
                //               imageBytesList: editedImage,
                //             )));
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: appButtonColor,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.3,
                child: selectedEntity == null
                    ? const SizedBox.shrink()
                    : Stack(
                        children: [
                          Positioned.fill(
                            child: AssetEntityImage(
                              selectedEntity!,
                              isOriginal: false,
                              thumbnailSize: const ThumbnailSize.square(1000),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                );
                              },
                            ),
                          ),
                          if (selectedEntity!.type == AssetType.video)
                            const Positioned.fill(
                              child: Center(
                                child: Icon(
                                  Iconsax.play_circle5,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                        ],
                      ),
              ),
              SizedBox(
                height: 5,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (selectedAlbum != null)
                          GestureDetector(
                            onTap: () {
                              albums(height);
                            },
                            child: Text(
                              selectedtitle == "Recent"
                                  ? "Gallery"
                                  : selectedtitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Icon(
                            Iconsax.arrow_down_1,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isMultiple = isMultiple == true ? false : true;
                              selectedAssetList = [];
                            });
                          },
                          icon: Icon(
                            isMultiple == true
                                ? Iconsax.note_215
                                : Iconsax.note_2,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Icon(
                          Iconsax.camera,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9)),
                                  ),
                                  constraints: BoxConstraints(
                                    minHeight: 45,
                                    minWidth: double.infinity,
                                  ),
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isStrechedDropDown =
                                            !isStrechedDropDown;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            child: Text(
                                              title,
                                              style: GoogleFonts.ibmPlexMono(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          isStrechedDropDown
                                              ? MdiIcons.chevronUp
                                              : MdiIcons.chevronDown,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                  height: isStrechedDropDown ? 170 : 0,
                                  child: MyScrollbar(
                                    builder: (context, scrollController2) =>
                                        ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      controller: scrollController2,
                                      shrinkWrap: true,
                                      itemCount: catalist.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          visualDensity: VisualDensity.compact,
                                          title: Text(
                                            catalist[index].name,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              cataid =
                                                  catalist[index].categoryId;
                                              print(cataid);
                                              title = catalist[index].name;
                                              isStrechedDropDown =
                                                  !isStrechedDropDown;
                                            });
                                          },
                                        );
                                      },
                                    ),
                                    scrollController: ScrollController(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.heightBox,
                    Flexible(
                      child: assetList.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: assetList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 1,
                              ),
                              itemBuilder: (context, index) {
                                AssetEntity assetEntity = assetList[index];
                                return assetWidget(assetEntity);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void albums(height) {
    showModalBottomSheet(
      backgroundColor: appbBgColor,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      builder: (context) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: albumList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                setState(() {
                  selectedAlbum = albumList[index];
                });
                MediaServices().loadAssets(selectedAlbum!).then(
                  (value) {
                    setState(() {
                      assetList = value;
                      selectedEntity = assetList[0];
                    });
                  },
                );
                Navigator.pop(context);
              },
              title: Text(
                albumList[index].name == "Recent"
                    ? "Gallery"
                    : albumList[index].name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void selectAsset({
    required AssetEntity assetEntity,
  }) {
    if (selectedAssetList.contains(assetEntity)) {
      setState(() {
        selectedAssetList.remove(assetEntity);
        print("assetlist:${selectedAssetList}");

        getImagesBytes();
      });
    } else {
      setState(() {
        selectedAssetList.add(assetEntity);
        print("assetlist:${selectedAssetList}");

        getImagesBytes();
      });
    }
  }

  // Convert List<AssetEntity> to List<Uint8List>
  Future<List<Uint8List>> convertAssetListToUint8List(
      List<AssetEntity> selectedAssetList) async {
    List<Uint8List> result = [];

    for (var asset in selectedAssetList) {
      File? file = await asset.file;
      if (file != null) {
        Uint8List imageBytes = await file.readAsBytes();
        result.add(imageBytes);

        print("imagebyte ${imageBytes}");
      }
    }

    return result;
  }

  List<Uint8List> imageBytesList = [];
// Usage example
  void getImagesBytes() async {
    imageBytesList = await convertAssetListToUint8List(selectedAssetList);
    setState(() {});
    print("ibytelist ${imageBytesList}");
  }

  Widget assetWidget(AssetEntity assetEntity) => GestureDetector(
        onTap: () {
          setState(() {
            selectedEntity = assetEntity;

            //set selected value in selected asset list for take single asset.
            selectedAssetList = [];
            selectedAssetList.add(assetEntity);

            getImagesBytes();
            print(selectedAssetList);
          });
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: AssetEntityImage(
                assetEntity,
                isOriginal: false,
                thumbnailSize: const ThumbnailSize.square(250),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
            if (assetEntity.type == AssetType.video)
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Iconsax.video5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            Positioned.fill(
              child: Container(
                color: assetEntity == selectedEntity
                    ? Colors.orange.withOpacity(0.65)
                    : Colors.transparent,
              ),
            ),
            if (isMultiple == true)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      selectAsset(assetEntity: assetEntity);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedAssetList.contains(assetEntity) == true
                              ? Colors.blue
                              : Colors.white12,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "${selectedAssetList.indexOf(assetEntity) + 1}",
                            style: TextStyle(
                              color: selectedAssetList.contains(assetEntity) ==
                                      true
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
}
