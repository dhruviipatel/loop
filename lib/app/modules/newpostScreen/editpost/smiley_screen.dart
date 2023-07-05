import 'package:emoji_selector/emoji_selector.dart';
import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:photo_manager/photo_manager.dart';

class SmileyScreen extends StatelessWidget {
  final List<AssetEntity> selectedAssetList;
  const SmileyScreen({super.key, required this.selectedAssetList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbBgColor,
      bottomSheet: BottomSheet(
        backgroundColor: Color(0xff1e1c24),
        onClosing: () {},
        enableDrag: false,
        builder: (context) {
          return Container(
            height: 290,
            child: EmojiSelector(
              withTitle: false,
              onSelected: (emoji) {
                print('Selected emoji ${emoji.char}');
              },
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Container(
          height: 340,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/cropimg.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
