import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/themes/themes.dart';
import '../data/providers/HomeProvider.dart';
import 'newpostScreen/editpost/editnavbar.dart';
import 'newpostScreen/inner_widgets/Scrollbar.dart';
import 'newpostScreen/inner_widgets/media_service.dart';

class NewpostScreen1 extends StatefulWidget {
  const NewpostScreen1({Key? key}) : super(key: key);

  @override
  State<NewpostScreen1> createState() => _NewpostScreen1State();
}

class _NewpostScreen1State extends State<NewpostScreen1> {
  bool isStrechedDropDown = false;
  int? groupValue;
  String title = 'Choose Category';

  AssetEntity? selectedEntity;
  AssetPathEntity? selectedAlbum;
  List<AssetPathEntity> albumList = [];
  List<AssetEntity> assetList = [];
  List<AssetEntity> selectedAssetList = [];

  bool isMultiple = false;

  @override
  void initState() {
    MediaServices().loadAlbums(RequestType.common).then(
      (value) {
        setState(() {
          albumList = value;
          selectedAlbum = value[0];
        });
        // LOAD RECENT ASSETS
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
    context.read<HomeProvider>().mycata();
    var catalist = context.read<HomeProvider>().catalist;

    var height = MediaQuery.of(context).size.height;
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
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => EditNavbar(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: appButtonColor,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: SizedBox(
                height: height * 0.31,
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
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
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
                              selectedAlbum!.name == "Recent"
                                  ? "Gallery"
                                  : selectedAlbum!.name,
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
                              isMultiple = !isMultiple;
                              selectedAssetList = [];
                            });
                          },
                          icon: Icon(
                            isMultiple ? Iconsax.note_215 : Iconsax.note_2,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.camera,
                            color: Colors.white,
                            size: 30,
                          ),
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
                                    minHeight: 50,
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
                                  height: isStrechedDropDown ? 200 : 0,
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
                                              groupValue = index;
                                              print(groupValue);
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
            ),
          ],
        ),
      ),
    );
  }

  void albums(double height) {
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
      });
    } else {
      setState(() {
        selectedAssetList.add(assetEntity);
      });
    }
  }

  Widget assetWidget(AssetEntity assetEntity) => GestureDetector(
        onTap: () {
          setState(() {
            selectedEntity = assetEntity;
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
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: selectedAssetList.contains(assetEntity)
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
