import 'package:flutter/material.dart';

//category list and model
class Cata {
  final String title;
  final String image;

  Cata(this.title, this.image);
}

List categorylist = [
  Cata("All", "assets/images/post1.png"),
  Cata("Chess", "assets/images/post2.png"),
  Cata("PUBG", "assets/images/post3.png"),
  Cata("Free Fire", "assets/images/post5.png"),
  Cata("Ludo", "assets/images/post4.png"),
];

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categorylist.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      categorylist[index].image,
                      height: 110.0,
                      width: 80.0,
                      fit: BoxFit.cover,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  categorylist[index].title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
