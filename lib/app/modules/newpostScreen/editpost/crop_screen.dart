import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:photo_manager/photo_manager.dart';

class CropScreen extends StatelessWidget {
  final List<AssetEntity> selectedAssetList;
  const CropScreen({super.key, required this.selectedAssetList});

  @override
  Widget build(BuildContext context) {
    print(selectedAssetList);
    return Scaffold(
        backgroundColor: appbBgColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/cropimage.png"))),
          ),
        ));
  }
}
