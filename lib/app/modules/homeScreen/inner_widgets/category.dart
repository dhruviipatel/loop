import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/providers/AuthProvider.dart';

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
    final ap = Provider.of<AuthProvider>(context);
    //get token
    ap.getToken();
    //check login status
    ap.checkLoginStatus(context);
    //call mycata function at initial state to get catalist
    ap.mycata.call();

    var catalist = ap.catalist;
    return Container(
      height: 145,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: catalist.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      catalist[index].image,
                      height: 110.0,
                      width: 80.0,
                      fit: BoxFit.cover,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  catalist[index].name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static fromJson(element) {}
}



//selected container design

// Padding(
//             padding: const EdgeInsets.only(left: 20, bottom: 15),
//             child: Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(
//                     "assets/images/post1.png",
//                     height: 110.0,
//                     width: 80.0,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Container(
//                   height: 110,
//                   width: 80,
//                   decoration: BoxDecoration(
//                       color: appButtonColor.withOpacity(0.6),
//                       borderRadius: BorderRadius.circular(10)),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 32),
//             child: Text(
//               "all",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),