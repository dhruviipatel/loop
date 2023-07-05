import 'package:flutter/material.dart';
import 'package:loop/app/core/themes/themes.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:velocity_x/velocity_x.dart';

//filter list and model
class Filter {
  final String title;
  final String image;

  Filter(this.title, this.image);
}

List filterlist = [
  Filter("Original", "assets/images/filter1.png"),
  Filter("Cream", "assets/images/filter1.png"),
  Filter("Deep", "assets/images/filter1.png"),
  Filter("Classic", "assets/images/filter1.png"),
];

class FilterScreen extends StatelessWidget {
  final List<AssetEntity> selectedAssetList;
  const FilterScreen({super.key, required this.selectedAssetList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbBgColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Container(
              height: 420,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/cropimg.png",
                fit: BoxFit.cover,
              ),
            ),
            30.heightBox,
            Container(
              height: 135,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: filterlist.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 13, top: 13),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              filterlist[index].image,
                              height: 75.0,
                              width: 75.0,
                              fit: BoxFit.cover,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Text(
                          filterlist[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
